package com.flightproject;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginAdmin extends HttpServlet {
	
	final String DB_URL = "jdbc:mysql://localhost:3306/flightDB";
	final String USER = "flyaway21";
	final String PASSWORD = "flyaway21";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String adminUsername =  request.getParameter("username");
		String adminPassword  =  request.getParameter("password");
		boolean userFound = false;
		
		HttpSession session = request.getSession();
	
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try(Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD)){
				System.out.println("Connection established!");
				
				String query;
				query = "select * from admin where (trim(name) = ? or trim(email) = ? ) "
						+ "and trim(password) = ?  ";
				
				try(PreparedStatement ps = connection.prepareStatement(query))
				{
					ps.setString(1, adminUsername.trim()); 
					ps.setString(2, adminUsername.trim());
					ps.setString(3, adminPassword.trim());
					
					ResultSet rs = ps.executeQuery();
									
					userFound = rs.next();	

					if(userFound) {
						System.out.println("Login Successful!");
						session.setAttribute("userName", adminUsername); 
						RequestDispatcher rd = request.getRequestDispatcher("adminhome");
						rd.forward(request,response);					
					}else {
						System.out.println("Login Failed");
						RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
						rd.include(request,response);
						response.getWriter().write(
								"<html><body>"
								+"<div style = \"color:black; text-align:center; margin: 0px 500px 0px 500px;\" >Login failed!</div>"
								+ "</body></html>");				
					}
					
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
