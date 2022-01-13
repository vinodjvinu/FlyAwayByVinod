<!DOCTYPE html>
<html>
<head>
	<style>	
	
			* {
				margin: 0;
				padding: 0;
				font-family: sans-serif;
			}

			body {
				padding: 10px;
				background: linear-gradient(85deg,#FFD700, #8d6a9c);
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

			.message {
			  background-position: center;
			  background-size: cover;
			  color: black;
			  font-family: "Courier New", Courier, monospace;
			  font-size: 25px;
			}

			.middle {
			  position: absolute;
			  top: 40%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  text-align: center;
			}

			hr {
			  margin: auto;
			  width: 60%;
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

<div class="message">
	  <div class="middle">
			<h1>COMING SOON</h1>
			<hr>
			<p>50 days left</p>
	  </div>
</div>

</body>
</html>
