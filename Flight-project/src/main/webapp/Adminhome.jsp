<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Admin</title>
    <style>
		* {
			margin: 0;
			padding: 0;
			font-family: sans-serif;
		}
		
		body {
			height: 100vh;
			padding: 10px;
			background: linear-gradient(55deg,#FFD700, #888888);
			background-image: url('pilot.gif');
			background-repeat: no-repeat;
			background-attachment: fixed;
			background-size: 1300px 630px;;		
		}

		#navigate{
			padding: 30px 60px;
			margin-top: 50px;
			margin-left: 280px;
			float: center;	
			
		}
		
		.nav{
			background-color:#00008B;
			padding: 20px;
			margin-left: 150px;
			margin-top: 50px;
			color: white;
			font-size: 14px;
			text-decoration: none;
			font-weight: bold;
			border-radius: 15px;
			display: block;
			width: 20%;
		}
		
		.nav:hover{
			background-color: #008000;
			
		}

		.submit {
			background-color: #06d;
			color: #eee;
			cursor: pointer;
			font-size: 18px;
			height:	40px;
			padding: 10px;
		}
		
		.submit:active{
			background-color: #71b7e6;
		}
		
		b {
			color: white;
		}
    </style>
</head>
<body>
<% 
  
  //response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
	if ((String)session.getAttribute("userName") == null )
		response.sendRedirect("Admin.jsp");
%>
		
<div class = container>
	<form action="logout" method="POST">
			<div class = "Admin">
					Hi <b><%=(String)session.getAttribute("userName")%></b>, Welcome to Admin Dashboard!				
				<button type = "submit" class = "submit">Logout</button>
			</div>
	</form>
</div>
<div id="navigate">
		<a href="places.jsp" title="places" class="nav"> Master List- Places</a>	
			
		<a href="airlines.jsp" title="airlines" class="nav"> Master List- Airlines</a>
		
		<a href="flights.jsp"  title="flights" class="nav"> Master List - Flights</a> 

		<a href="change.jsp" title="change-password" class="nav">Change password</a> 	
</div>
</body>
</html>