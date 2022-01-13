<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.flightproject.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
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
			background: linear-gradient(150deg,#FFD700, #8d6a9c);
			
		}
		
		#navigate{
			float: right;
			margin-top: 20px;
		}
		
		.nav{
			background-color:#48CCCD;
			padding: 19px;
			color: white;
			font-size: 14px;
			text-decoration: none;
			float:left;
			font-weight: bold;
		}
		
		.nav:hover{
			background-color: #00008B;
			
		}

    	.a {
			color : white;
			background-color : #223094;			
			padding: 10px 50px;
			font-size: 100%;
			border-radius: 25px;
		}
	
		.a:hover {
			background-color : #199319;	
		}
		
		th {
			color: white;
			background-color: #006699;
			
		}
		
		tr {
			color: black;
			font-weight: bold;
		}
		
		tr:hover {
			background-color: #0099cc;
		}
		
		table, th, td {
			margin-top: 30px;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 12px;
			font-size: 15px;
		}
		
		table {
				border: 5px outset black;	
		}
		
		#message{
			color: white;
			margin-left: 35%;
			margin-top: 80px;
			font-size: 10px;
		}
		
</style>
</head>
<body>
<%
	String fsource =(String)session.getAttribute("fsource");
	String fdest =(String)session.getAttribute("fdest");
	String fdate =(String)session.getAttribute("sdate");
%>
<div id="navigate">
		<a href="index.jsp" title="Home" class="nav"> Home</a>	
			
		<a href="Admin.jsp" title="Admin" class="nav"> Admin Login</a>
		
		<a href="Hotels.jsp"  title="Hotel" class="nav"> Hotels</a> 

		<a href="Contact.jsp" title="Contact" class="nav"> Contact us</a> 
</div>
	<div id="message">
			<h2>Showing flights between <%= fsource%> and <%=fdest%> </h2>
	</div>
	<table style="width: 100%; text-align: center; color: green;">
	<%
		ArrayList<FlightInfo> flights = (ArrayList<FlightInfo>)session.getAttribute("flights");
		
		int count = (int)session.getAttribute("count");
		
		if (count > 0)
		{
	%>
			<tr>
			<th>Flight Number</th>
			<th>Flight Name</th>
			<th>Departure Airport</th>
			<th>Arrival Airport</th>
			<th>Travel Date</th>
			<th>Price</th>			
			<th>Select one</th>
			</tr>
			<% 	
			for(FlightInfo flight : flights)
			{
			%>
				<tr>
				<td> <%= flight.getFlightId()%> </td>
				<td> <%= flight.getFlightName()%> </td>
				<td> <%= flight.getSrcAirport()%> </td>
				<td> <%= flight.getDestAirport()%> </td>
				<td> <%= fdate %> </td>
				<td> <%= flight.getPrice()%> </td>
				<td><a class="a" href= "RegisterPage.jsp?fid=<%=flight.getFlightId()%>&fname=<%=flight.getFlightName()%>
						&fprice=<%=flight.getPrice()%>&sAir=<%=flight.getSrcAirport()%>
						&dAir=<%=flight.getDestAirport()%>">Book</a></td>
				</tr>
	<% 
			}
		}else{
			out.print("No flights found from " + fsource + " to " + fdest  +" for the entered date!\n");
		}
	%>
	</table>
</body>
</html>