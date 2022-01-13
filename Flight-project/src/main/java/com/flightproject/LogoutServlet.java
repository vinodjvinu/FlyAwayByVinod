package com.flightproject;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class LogoutServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			session.removeAttribute("userName");
			session.invalidate();
			response.sendRedirect("Admin.jsp");
			
	}
}
