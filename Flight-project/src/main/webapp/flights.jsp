<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<% 
  
  //response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
	if ((String)session.getAttribute("userName") == null )
		response.sendRedirect("Admin.jsp");
%>
<%
	final String DB_URL = "jdbc:mysql://localhost:3306/flightDB";
	final String USER = "flyaway21";
	final String PASSWORD = "flyaway21";
	
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Places - Master</title>
<style>
		* {
			margin: 0;
			padding: 0;
			font-family: sans-serif;
		}
		
		body {
			height: 100vh;
			justify-content: left;
			align-items: center;
			padding: 10px;
			background: linear-gradient(55deg,#FFD700, #888888);	
		}
		
		#navigate{
			float: right;
			height: 50vh;
		}
		
		.nav{
			background-color:#48CCCD;
			padding: 19px;
			color: white;
			font-size: 14px;
			text-decoration: none;
			float:right;
			font-weight: bold;
		}
		
		.nav:hover{
			background-color: #00008B;
			
		}

		.container {
			padding: 10px 10px;
			margin-left: 300px;
			margin-top: 40px;
		}

		
		th {
			color: white;
			background-color: #006699;
			
		}
		
		tr {
			color: black;
			background-color: #f0ffff;
		}
		
		table, th, td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 7px;
			max-width: 400px;
		}
		
		table {
				border: 5px outset black;	
		}
		
		#message{
			color: white;
			margin-left: 32%;
		}
		
</style>
</head>
<body>
	<div id="navigate">
			<a href="Adminhome.jsp" title="Home" class="nav"> Admin Home</a>	
	</div>
	<div id="message">
			<h2>Master List - Flight Details </h2>
	</div>
	<div class="container">
		<table style="width: 80%; text-align: center; color: green;">
		<tr>
			<th>Flight #</th>
			<th>Flight Name</th>
			<th>Source </th>
			<th>Destination</th>
			<th>Day of Run</th>
			<th>Price</th>
		</tr>
	     <%
	         try{
	             connection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
	             statement = connection.createStatement();
	             String query ="select f.fid , f.fname, f.fsrc, f.fdest, fs.fday, fs.fprice "
							+ "from flight f inner join flight_schedule fs on f.fid = fs.fid ";
	             
	             rs = statement.executeQuery(query);
	             while(rs.next()){
	     %>
	             <tr>
	                <td><%=rs.getInt("f.fid") %></td>
	                <td><%=rs.getString("f.fname") %></td>
	                <td><%=rs.getString("f.fsrc") %></td>
	                <td><%=rs.getString("f.fdest") %></td>
	                <td><%=rs.getString("fs.fday")%></td>
	                <td><%=rs.getFloat("fs.fprice") %></td>
	            </tr>    		
	     <%
	                 }
	             } catch (Exception e) {
	                 e.printStackTrace();
	             }        
	     %>
	     </table>
     </div>
</body>
</html>