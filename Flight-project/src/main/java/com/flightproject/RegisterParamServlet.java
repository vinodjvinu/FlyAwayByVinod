package com.flightproject;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterParamServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String tName =  request.getParameter("tname");
		String tEmail   =  request.getParameter("temail");
		String tNumber = request.getParameter("tphone");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("tName", tName);
		session.setAttribute("tEmail", tEmail);
		session.setAttribute("tNumber", tNumber);
		
		RequestDispatcher rd = request.getRequestDispatcher("PaymentDetails.jsp");
		rd.forward(request,response);	
	}
}
