<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Portal</title>
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
			background: linear-gradient(35deg,#71b7e6, #8d6a9c);
			background-image: url('move.gif');
			background-repeat: no-repeat;
			background-attachment: fixed;
			background-size: 1400px 650px;;		
		}

		#navigate{
			float: right;
			height: 80vh;
			margin-top:-58px;
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
			max-width: 300px;
			padding: 20px 30px;
			border: 5px outset black;
			margin-left: 30px;
			margin-top: 50px;
			float: left;
		}
		
		.container .title{
			font-size: 25px;
			font-weight: bold;
		}
		
		form .travel-details .input-box {
			margin: 20px 0 12px 0;
		}
		
		.travel-details .input-box .details{
			font-weight: bold;
			margin-bottom: 5px;
		}
		
		.travel-details .input-box input   {
			height: 30px;
			width: 53%;
			outline: none;
			border: 2px solid #71b7e6;
			font-size: 16px;
			border-radius: 5px;
		}
		
		.submit-button{
			height: 25px;
			margin: 35px 0;
			width: 150%;
		}
		
		.submit-button input{
			color: white;
			font-weight: bold;
			background: linear-gradient(260deg,#71b7e6, #8d6a9c);		
		}
		
		.select{
			padding: 8px 0px;
			cursor: pointer;
			width: 80%;
			border-radius: 5px;
			border: 2px solid #71b7e6;
		}
		
		.box{
			padding: 5px 0px;
			width: 150%;
		}
		
		.box2{
			padding: 5px 0px;
			height: 30px;
			width: 150%;
		}
		
		#flyaway{
		text-align: center;
		font-size:50px; 
		color:white; 
		}
		
</style>
</head>
<body>
	<div id="flyaway">FlyAway Travels</div>
	<div id="navigate">
			<a href="index.jsp" title="Home" class="nav"> Home</a>	
				
			<a href="Admin.jsp" title="Admin" class="nav"> Admin Login</a>
			
			<a href="Hotels.jsp"  title="Hotel" class="nav"> Hotels</a> 

			<a href="Contact.jsp" title="Contact" class="nav"> Contact us</a> 
	</div>
	<div class = "container">
		<div class = "title"><h3>Enter travel details</h3></div>
					<form action="searchFlight" method="POST">
						<div class = "travel-details">
								<div class = "input-box">
									<label class = "details" for="date">Travel date</label>
									<div class="box">
									<input type="date" id="date" name="date" required >
									</div>
								</div>
								
								<div class = "input-box">
									<label class = "details" for="source">Source</label>
									<div class="select-box">
									<select id="source" class="select" name="source" required>
										<option selected disabled> Select Source </option>
										<option value = "Bangalore"> Bangalore </option>
										<option value = "Chennai"> Chennai </option>
										<option value = "Hyderabad"> Hyderabad </option>
										<option value = "Goa"> Goa </option>	
										<option value = "Kochi"> Kochi </option>			
										<option value = "Mumbai"> Mumbai </option>
										<option value = "Pune"> Pune </option>										
										<option value = "Vizag"> Vizag </option>
									</select>
									</div>
								</div>
								
								<div class = "input-box">
									<label class = "details" for="destination">Destination</label>
									<div class="select-box">
									<select id="destination" class="select" name="destination" required> 
										<option selected disabled> Select Source </option>
										<option value = "Bangalore"> Bangalore </option>
										<option value = "Chennai"> Chennai </option>
										<option value = "Hyderabad"> Hyderabad </option>
										<option value = "Goa"> Goa </option>	
										<option value = "Kochi"> Kochi </option>			
										<option value = "Mumbai"> Mumbai </option>
										<option value = "Pune"> Pune </option>										
										<option value = "Vizag"> Vizag </option>
									</select>
									
								</div>
								
								<div class = "input-box">
									<label class = "details" for="persons">No. of Travellers</label>
									<div class="box2">
									<input type="number" id="persons" name="persons" required value= 1 min="1" max="10"><br /><br />		
									</div>
								</div>
								
								<div class = "submit-button">
									 <input type="submit" value="Search Flights"> 
								</div>
						</div>
					</form>
	</div>

</body>
</html>