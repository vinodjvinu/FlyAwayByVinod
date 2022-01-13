<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
		* {
			margin: 0;
			padding: 0;
			font-family: sans-serif;
		}
		
		body {
			height: 100vh;
			align-items: center;
			padding: 10px;
			background: linear-gradient(75deg,#FFD700, #8d6a9c);
		}

		#navigate{
			float: right;
			height: 100vh;
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
			background: 48CCCD;
			padding: 20px 30px;
			border: 5px outset black;
			margin-left: 40%;
			margin-top: 10%;
			float: left;
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
		
		.box {
			padding: 5px 0 0 0 ;
		}
		
</style>
</head>
<body>

	<div id="navigate">
			<a href="index.jsp" title="Home" class="nav"> Home</a>	
				
			<a href="Admin.jsp" title="Admin" class="nav"> Admin Login</a>
			
			<a href="Hotels.jsp"  title="Hotel" class="nav"> Hotels</a> 

			<a href="Contact.jsp" title="Contact" class="nav"> Contact us</a> 
	</div>
<div class="container">
		<div class="title">
			<h3>Admin Login</h3>
		</div>
				<form action="adminLogin" method="POST">
					<div class="form-deets">
						<div class="input-box">
							<label for="username">UserName/Email</label>
							<div class="box">
								<input type="text" placeholder = "Enter Username/Email" name="username" required>
							</div>
						</div>
	
						<div class="input-box">
							<label for="password">Password</label>
							<div class="box">
								<input type="password" placeholder = "Enter Password" name="password" required>
							</div>
						</div>
						<div class="sub">
							<input type="submit"  class="submit" value="Login">
						</div>
					</div>
				</form>
</div>
</body>
</html>