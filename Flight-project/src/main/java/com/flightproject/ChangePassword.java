package com.flightproject;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class ChangePassword extends HttpServlet {
	
	final String DB_URL = "jdbc:mysql://localhost:3306/flightDB";
	final String USER = "flyaway21";
	final String PASSWORD = "flyaway21";
	boolean userFound = false;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String adminUsername =  request.getParameter("userid");
		String adminPassword  =  request.getParameter("oldpass");
		String newPassword  = request.getParameter("newpass");
		String confNewPassword = request.getParameter("confpass");
		boolean userFound = false;
		
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }

	    Connection connection = null;
	    PreparedStatement ps1 = null, ps2 = null;
	    ResultSet rs = null;
	    int updateCount = 0;
	    String query;
        try{
            connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
           
            
			query = "select * from admin where (trim(name) = ? or trim(email) = ? ) "
					+ "and trim(password) = ?  ";
            
            ps1 = connection.prepareStatement(query);
            
			ps1.setString(1, adminUsername.trim()); 
			ps1.setString(2, adminUsername.trim());
			ps1.setString(3, adminPassword.trim());           
            rs = ps1.executeQuery();
            
            userFound = rs.next();	
            
           } catch (Exception e) {
                e.printStackTrace();
          }  	
        
        HttpSession session = request.getSession();
        session.invalidate();
        
        if (userFound) {
        	if(newPassword.equals(confNewPassword)) {
        		if(adminPassword.equals(newPassword)) {
        			
					RequestDispatcher rd = request.getRequestDispatcher("change.jsp");
					
					rd.include(request,response);
					response.getWriter().write(
							"<html><body></br></br></br>"
							+"<div style = \"color:black; text-align:center; margin: 100px 500px 0px 500px;\" >New Password is same as Old Password!</div>"
							+ "</body></html>");				
				}else {
					
					try {
						query = "update admin set password = ? where (trim(name) = ? or trim(email) = ? ) ";
						ps2 = connection.prepareStatement(query);
						ps2.setString(1, newPassword.trim()); 
						ps2.setString(2, adminUsername.trim());
						ps2.setString(3, adminUsername.trim()); 
						
						updateCount = ps2.executeUpdate();
					
					}catch(Exception e){
							System.out.println(e);
					}
					
					if (updateCount > 0) {					
						RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
						rd.include(request,response);	
						response.getWriter().write(
								"<html><body>"
								+"<div style = \"color:black; text-align:center; margin: 100px 500px 0px 500px;\" >Password changed! Login again.</div>"
								+ "</body></html>");	
					}
				}
        	}else {
					RequestDispatcher rd = request.getRequestDispatcher("change.jsp");
					rd.include(request,response);
					response.getWriter().write(
						"<html><body>"
						+"<div style = \"color:black; text-align:center; margin: 100px 500px 0px 500px;\" >Passwords do not match!</div>"
						+ "</body></html>");	
        	 }
        }else {
				RequestDispatcher rd = request.getRequestDispatcher("change.jsp");
				rd.include(request,response);
				response.getWriter().write(
				"<html><body>"
				+"<div style = \"color:black; text-align:center; margin: 100px 500px 0px 500px;\" >UserName,Password do not exist!</div>"
				+ "</body></html>");        	
        }
   
	}
		
	
}
