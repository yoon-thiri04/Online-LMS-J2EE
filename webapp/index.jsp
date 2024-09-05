<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");

*{
 margin: 0;
 padding: 0;
 box-siziing: border-box;
 text-decoration:none;
 font-family: Poppins, Helvetica, sans-serif;
}

body{
		margin: 0;
		padding: 0;
		background-color: #DDF2FD;
		
	}
/*header*/
.header{
  	display: flex;
  	align-items: center;
  	justify-content: space-between;
  	height: 20px;
 	padding: 20px;
  	background: #427D9D;
  	box-shadow: 0px 0px 10px 0px grey;
  	color:white;
}.header b{
  font-size:37px;
  color:white;
  font-family: 'Amatic SC', cursive;
}

.logo{
  display: flex;
  align-items: center;
}

.logo a{
  color: #000;
  font-size: 18px;
  font-weight: 600;
 
}

.header-icons{
  display: flex;
  align-items: center;
  margin-right:10px;
}

.header-icons .account{
  margin-right:50px;
}
.header-icons .account ul{
    display: flex;
    align-items: center;
    gap:40px;
}

.header-icons .account ul li{
  list-style-type: none;
}

.header-icons .account ul li a{
    color: /*#c5c2c2*/white;
    text-decoration: none;
    font-size: 17px;
    padding-top: 20px;
    padding-bottom: 10px;
    padding-left: 10px;
    padding-right: 20px;
    line-height: 30px;
}

.header-icons .account ul li a:hover{
    color: orange;
}
	.title{
		text-align: center;
		padding: 35px 0 20px;
	}
	.title h1{
		margin: 0;
		padding: 0;
		color: #262626;
		
	}
	.container{
		width: 50%;
		height: 500px;
		background: #fff;
		margin: 0 auto;
		border: 1px solid white;
		box-shadow: 0 15px 40px rgba(0,0,0,.5);
	}
	.container .left{
		float: left;
		width:50%;
	    height: 500px;
	    background: url('online.avif');
	    background-size: cover;
		box-sizing: border-box;
	}
	.container .right{
		float: left;
		width:50%;
	    height: 400px;
		box-sizing: border-box;
	}
	.formBox{
		width: 100%;
		padding: 30px 40px;
		box-sizing: border-box;
		height: 400px;
		background: #fff;
	}
	.formBox p{
		margin: 0;
		padding: 0;
		font-weight: bold;
		
		color: black;
	}
	.formBox input{
		width: 100%;
		margin-bottom: 15px;
		
	}
	.formBox input[type="text"],.formBox input[type="password"],.formBox input[type="email"]{
		border: none;
		border-bottom: 2px solid black;
		outline: none;
		height: 40px;
	}
	
	.formBox input[type="text"]:focus,.formBox input[type="password"],.formBox input[type="email"]:focus{
		border-bottom: 2px solid #262626;
	
	}
	.formBox input[type="submit"]{
		border: none;
		outline: none;
		height: 40px;
		color: #fff;
		background: #387ADF;
		cursor: pointer;
		font-size:17px;
	}
	.formBox input[type="submit"]:hover{
		background: #2c3e50;
	} .register-link{
 font-size: 15px;
  text-align: center;
  margin: 20px 0 15px;
}
.register-link p a{
  
  text-decoration: none;
  font-weight: 600;
  font-size:16px;
  
}
.register-link p a:hover{
  text-decoration: underline;
  
}
</style>

</head>
<body>
	<header class="header">
      <div class="logo">
        <a href="source.jsp"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a>
      </div>
      
      <div class="header-icons">
        <div class="account">
            <ul>
                <li><a href="source.jsp">Home</a></li>
                  <li><a href="Course.jsp">Course</a></li>
                  <li><a href="source.jsp#ourfaq">FAQ</a></li>
                 
              </ul>
        </div>
      </div>
  </header>

<div class="title"><h1>Start Learning with us!</h1></div>
		<div class="container">
			<div class="left"></div>
			<div class="right">
				<div class="formBox">
					<form action="RegisterController" method="post">
						<p>Name</p>
						<input type="text" name="username" placeholder="Name" value="<%= request.getAttribute("username") != null? request.getAttribute("username") : "" %>"  required>

						<p>Email</p>
						<input type="email" name="email" placeholder="Email" value="<%= request.getAttribute("email") != null? request.getAttribute("email") : "" %>"  required>
						
						
						
						<p>Password</p>
						<input type="password" name="password" placeholder="Password" required>
						
						<p>Confirm Password</p>
						<input type="password" name="confirmPassword" placeholder="Confirm Password" required>
											
						<input type="submit" name="submit" value="Register">
						
      					<%String error=(String)request.getAttribute("errorMessage");
                          if ( error != null && !error.isEmpty()){ %>
                          <div style="color: red;">
                            <%= error %>
                           </div> <% } %>
      						<div class="register-link">
        					<p>Already have an account? <a href="login.jsp">Login</a></p>
      					</div>	
      						
					</form>
				</div>
			</div>
		</div>


</body>
</html>