<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.flightproject.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<style>
		* {
			margin: 0;
			padding: 0;
			font-family: sans-serif;
		}
		
		body {
			align-items: center;
			justify-content: center;
			height: 100vh;
			background: linear-gradient(150deg,#FFD700, #8d6a9c);
		}

		#navigate{
			float: right;
			margin-top: -9%;
			margin-right: 10px;
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
		
		.container {
			max-width: 250px;
			padding: 20px 30px;
			border: 5px outset black;
			margin-left: 35%;			
			margin-top: 10%;	
		}		
		
		.container .title form{
			height: 500px;
			width: 320px;
			padding: 10px;
			margin: 150px;			
		}
		
		.container .title {
			font-size: 25px;
			font-weight: bolder;
		}

		form .form-deets .input-box {
			margin: 20px 0 12px 0;
		}	
		
		input{
			border-radius: 5px;
		    padding: 5px 0px;
			width: 120%;
			background-color: #71b7e6,;
			height: 100%;
			width: 100%;			
		}
			
		.input-box {
			height: 50px;
			position: relative;
			width: 100%;
			font-size: 15px;
			font-weight: bold;
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
	   String fid = request.getParameter("fid");
	   String fname = request.getParameter("fname");
	   float fprice = Float.parseFloat(request.getParameter("fprice"));
	   String sAir = request.getParameter("sAir");
	   String dAir = request.getParameter("dAir");
	   session.setAttribute("fid", fid);
	   session.setAttribute("fname", fname);
	   session.setAttribute("fprice", fprice);
	   session.setAttribute("sAir", sAir);
	   session.setAttribute("dAir", dAir);
	%>
<div id="navigate">
		<a href="index.jsp" title="Home" class="nav"> Home</a>	
			
		<a href="Admin.jsp" title="Admin" class="nav"> Admin Login</a>
		
		<a href="Hotels.jsp"  title="Hotel" class="nav"> Hotels</a> 

		<a href="Contact.jsp" title="Contact" class="nav"> Contact us</a> 
</div>
<div class="container">
		<div class="title">
			<h3>Enter your details</h3>
		</div>
				<form action="register" method="POST">
					<div class="form-deets">
						<div class="input-box">
							<label for="name">Name</label>
							<div class="box">
								<input type="text" id="name" name="tname" required>
							</div>
						</div>
						<div class="input-box">
							<label for="email">Email</label>
							<div class="box">
								<input type="email" id="email" name="temail" required>
							</div>
						</div>
						<div class="input-box">
							<label for="phone">Phone#</label>
							<div class="box">
								<input type="text" id="phone" name="tphone" required>
							</div>
						</div>
						<div class="sub">
							<input type="submit"  class="submit" value="Submit">
						</div>
					</div>
				</form>
</div>
</body>
</html>