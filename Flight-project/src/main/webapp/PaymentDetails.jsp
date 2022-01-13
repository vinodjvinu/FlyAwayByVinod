<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.flightproject.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment details</title>
<style>
		* {
			margin: 0;
			padding: 0;
			font-family: sans-serif;
		}
		
		body {
			align-items: center;
			justify-content: center;
			display: flex;
			height: 100vh;
			background: linear-gradient(35deg,#FFD700, #8d6a9c);
		}
		
		.container {
			max-width: 500px;
			padding: 20px 30px;
			border: 5px outset black;			
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

		form .card-deets .input-box {
			margin: 20px 0 12px 0;
		}	
		
		input{
			border-radius: 5px;
		    padding: 5px 0px;
			background-color: #71b7e6,;
			height: 10px;
			width: 80%;		
		}
			
		.input-box {
			height: 50px;
			position: relative;
			width: 100%;
			font-size: 15px;
			font-weight: bold;
		}

		.card{
			width: 90%;
		}
		
		.cvv{
			width: 30%;
			margin-top: 18px;
		}
		
		.flex-container{
			display: flex;
		}
		
		.select{
			padding: 8px 0px;
			cursor: pointer;
			width: 80%;
			border-radius: 5px;
			border: 2px solid #71b7e6;
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
	float fprice = (float)session.getAttribute("fprice");
	int fpersons = (int)session.getAttribute("fpersons");
	float totalPrice = fpersons * fprice;	
%>
<div class = "container">
	<div class = "title"><h3>Enter payment details</h3><br></div>
	<div class = "subtitle"><h4>(Amount to pay : <%= fpersons %> x <%= fprice%> = <%= totalPrice%>)</h4></div>
	<form action="Summary.jsp" method="POST">
		<div class = "card-deets">
		
			<div class = "input-box">
				<label for="cardtype">Card Type</label><br />
				<div class="select-box">
					<select id="cardtype" class="select" name="cardtype" required>
						<option selected> Select type </option>
						<option value = "Debit Card"> Debit </option>
						<option value = "Credit Card"> Credit </option>
					</select>
				</div>
			</div>
			
			<div class = "flex-container">
				<div class = "input-box child child1">
					<label for="cardno">Card Number</label><br />
					<input type="tel" class="card" inputmode="numeric" id="cardno" name="cardno" 
							required pattern="[0-9\s]{13,19}" maxlength= "19" placeholder="xxxx xxxx xxxx xxxx" >
				</div>
				<div class = "input-box child child2 ">
					<label for="cvv">CVV</label>
					<input type="password" class="cvv" id="cvv" name="cvv" required pattern="[0-9\]{3}" maxlength = "3" size="1" placeholder=" xxx " >
				</div>
			</div>
			
			<div class = "input-box">
				<label for="cardname">Name on the Card</label>
				<input type="text" id="cardname" name="cardname"  >
			</div>
			
			
			<div class="sub">
				<input type="submit" class="submit" value="Proceed to pay">
			</div>
		</div>
	</form>	
</div>
</body>
</html>