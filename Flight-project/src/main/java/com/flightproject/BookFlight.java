package com.flightproject;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookFlight extends HttpServlet {
	
	final String DB_URL = "jdbc:mysql://localhost:3306/flightDB";
	final String USER = "flyaway21";
	final String PASSWORD = "flyaway21";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String fsource =  request.getParameter("source");
		String fdest   =  request.getParameter("destination");
		String spersons = request.getParameter("persons");
		int    fpersons = Integer.parseInt(spersons);
		String sdate = request.getParameter("date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int fday = 0;
		
		HttpSession session = request.getSession();
		
		try {
			Date fdate = sdf.parse(sdate);
			//@SuppressWarnings("deprecation")
			fday = fdate.getDay();
			fday++;
		} catch (ParseException e1) {
			System.out.println(e1);
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try(Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD)){
				System.out.println("Connection established!");
				
				List<FlightInfo> flights = new ArrayList<FlightInfo>();
				String query;
				query = "select f.fid , f.fname, fs.fday, fs.fprice, s.airport, d.airport "
						+ "from flight f inner join flight_schedule fs on f.fid = fs.fid "
						+ "left join cities s on f.fsrc = s.city "
						+ "left join cities d on f.fdest = d.city "
						+ "where trim(f.fsrc) = ? and trim(f.fdest) = ? "
						+ "and fs.fday = ? ";
				
				try(PreparedStatement ps = connection.prepareStatement(query))
				{
					ps.setString(1, fsource.trim()); 
					ps.setString(2, fdest.trim());
					ps.setInt(3, fday);
					
					ResultSet rs = ps.executeQuery();
					
					int count = 0;
					
					while(rs.next())
					{   		
						int id = rs.getInt("f.fid");
						String flight = rs.getString("f.fname");
						float price = rs.getFloat("fs.fprice");
						String srcAirport = rs.getString("s.airport");
						String destAirport = rs.getString("d.airport");
						
						FlightInfo fi = new FlightInfo(flight, fsource, fdest, id, srcAirport, destAirport , price  );						
						flights.add(count, fi);
						count++;						
					}
					session.setAttribute("count", count);
					session.setAttribute("sdate", sdate);
					session.setAttribute("fsource", fsource);
					session.setAttribute("fdest", fdest);
					session.setAttribute("fpersons", fpersons);
					
					
					if (count > 0)
					{
						session.setAttribute("flights", flights);
						
						
						RequestDispatcher rd = request.getRequestDispatcher("SearchResults.jsp");
						rd.forward(request,response);	
					}
					if (count == 0) {
						System.out.println("No flights found for the entered date!");
						RequestDispatcher rd = request.getRequestDispatcher("SearchResults.jsp");
						rd.include(request,response);
						
					}
					//RequestDispatcher rd = request.getRequestDispatcher("index.html");
					//rd.include(request,response);
					
				}catch(Exception e) {
					System.out.println("Error during DB operation : " + e);
				}
			}
			catch(Exception e) {
				System.out.println("Connection failed");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		
	}
}
