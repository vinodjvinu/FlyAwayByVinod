<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.flightproject.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Summary</title>
<style>
		body {
			align-items: center;
			justify-content: left;

			height: 100vh;
			background: linear-gradient(6deg,#FFD700, #8d6a9c);
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
			float: left;
			font-weight: bold;
		}
		
		.nav:hover{
			background-color: #00008B;
			
		}
		
		
		.container {
			max-width: 60%;

			padding: 20px 50px;

			margin: 30px;
		}		
		
		.msg {
			color: white;
			font-size: 20px;
		
		}
		
		.print-msg{
			font-size: 15px;
			margin: 10px;
		}

		dl {
		width: 80%;
		overflow: hidden;
		background: #DBE0DA;
		padding: 20px 20px;
		margin: 0;
		border: 5px outset black;	
		}
		
		dt {
		float: left;
		width: 30%;
		background: #DBE0DA;
		padding: 0;
		margin: 0;
		font-weight: bolder;
		}
		
		dd {
		float: left;
		width: 70%;
		background: #DBE0DA;
		padding: 0;
		margin: 0;	
		}
		
		.submit {
			background-color: #06d;
			color: #eee;
			cursor: pointer;
			font-size: 18px;
			height:	40px;
			margin-top: 18px;
		}
		
		.submit:active{
			background-color: #71b7e6;
		}
</style>
</head>
<body>
<%
String fsource = (String)session.getAttribute("fsource");
String fdest = (String)session.getAttribute("fdest");
String sAir = (String)session.getAttribute("sAir");
String dAir = (String)session.getAttribute("dAir");
String fid = (String)session.getAttribute("fid");
String sdate = (String)session.getAttribute("sdate");
String flightName = (String)session.getAttribute("fname");
String tNumber = (String)session.getAttribute("tNumber");
String tEmail = (String)session.getAttribute("tEmail");
String tName = (String)session.getAttribute("tName");
float fprice = (float)session.getAttribute("fprice");
int fpersons = (int)session.getAttribute("fpersons");
float totalPrice = fpersons * fprice;	
String cardno = request.getParameter("cardno");
String cardtype = request.getParameter("cardtype");
String cardname = request.getParameter("cardname");
%> 
<div id="navigate">
		<a href="index.jsp" title="Home" class="nav"> Home</a>	
			
		<a href="Admin.jsp" title="Admin" class="nav"> Admin Login</a>
		
		<a href="Hotels.jsp"  title="Hotel" class="nav"> Hotels</a> 

		<a href="Contact.jsp" title="Contact" class="nav"> Contact us</a> 
</div>
<div class = "container">
	<div class = "msg">
		Your flight has been booked succesfully! Ticket summary is mentioned below.
	</div>
	<h2>Ticket Summary </h2>
	<dl>
		<dt>Flight Number:</dt>
		<dd><%= fid %></dd>
		<dt>Flight Name:</dt>
		<dd><%= flightName%> </dd>
		<dt>Source:</dt>
		<dd><%= fsource + " (" + sAir + ")" %></dd>		
		<dt>Destination:</dt>
		<dd><%= fdest +  " (" + dAir + ")"%></dd>
		<dt>Travel Date:</dt>
		<dd><%= sdate%></dd>
		<dt>No. of Passengers:</dt>
		<dd><%= fpersons%></dd>
		<dt>Total Amount Paid:</dt>
		<dd><%= totalPrice %></dd>
		<dt>Passenger Name:</dt>
		<dd><%= tName%></dd>	
		<dt>Passenger Email:</dt>
		<dd><%= tEmail%></dd>
		<dt>Passenger Phone#:</dt>
		<dd><%= tNumber%></dd>	
		<dt><%=cardtype %> Number:</dt>
		<dd><%= "XXXXXXXXXXXX" + cardno.substring(cardno.length() - 4) %>	
		<dt>Name on the card:</dt>
		<dd><%= cardname%></dd>			
	</dl>
		<input class = "submit" type = "submit" value="Print Ticket" onClick="window.print()">
		<div class="print-msg">*Print the ticket before boarding. FlyAway wishes you a wonderful journey! </div>
</div>

</body>
</html>