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
			background: linear-gradient(55deg,#FFD700, #888888);	
		}

		#navigate{
			float: right;
			height: 100vh;
		}
		
		.nav{
			background-color:#48CCCD;
			padding: 19px;
			font-size: 14px;
			text-decoration: none;
			float:left;
			font-weight: bold;
		}
		
		.nav:hover{
			background-color: #00008B;
			
		}

		.container {
			padding: 20px 30px;
			border: 5px outset black;
			margin-left: 40%;
			margin-top: 10%;
			float: left;
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
<% 
  
  //response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  
	if ((String)session.getAttribute("userName") == null )
		response.sendRedirect("Admin.jsp");
%>
	<div id="navigate">
		<a href="Adminhome.jsp" title="Home" class="nav"> Admin Home</a>
	</div>
<div class="container">

				<form action="passchange" method="POST">
					<div class="form-deets">
						<div class="input-box">
							<label for="username">UserName/Email</label>
							<div class="box">
								<input type="text" placeholder = "Enter Username/Email" name="userid" required>
							</div>
						</div>
	
						<div class="input-box">
							<label for="old-password">Old Password</label>
							<div class="box">
								<input type="password" placeholder = "Enter Old Password" name="oldpass" required>
							</div>
						</div>

						<div class="input-box">
							<label for="new password">New Password</label>
							<div class="box">
								<input type="password" placeholder = "Enter New Password" name="newpass" required>
							</div>
						</div>

						<div class="input-box">
							<label for="new password">Confirm New Password</label>
							<div class="box">
								<input type="password" placeholder = "Enter New Password" name="confpass" required>
							</div>
						</div>
						
						<div class="sub">
							<input type="submit"  class="submit" value="Change Password">
						</div>
					</div>
				</form>
</div>
</body>
</html>