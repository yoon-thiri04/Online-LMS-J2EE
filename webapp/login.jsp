
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
*{
 margin: 0;
 padding: 0;
 box-siziing: border-box;
 text-decoration:none;
 font-family: Poppins, Helvetica, sans-serif;
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
	body {
   background-color: #DDF2FD;
  
}
	.title{
		text-align: center;
		padding:35px 0 20px;
	}
	.title h1{
		margin: 0;
		padding: 0;
		color: #262626;
	}
	.container{
		width: 50%;
		height: 450px;
		background: #fff;
		margin: 0 auto;
		font-size:18px;
		border: 0.5px solid white;
		box-shadow: 0 15px 40px rgba(0,0,0,.5);
		
	}
	.container .left{
		float: left;
		width:50%;
	    height: 450px;
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
		padding: 80px 40px;
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
		margin-bottom: 25px;
		
	}
	.formBox input[type="text"],.formBox input[type="password"]{
		border: none;
		border-bottom: 2px solid black;
		outline: none;
		height: 40px;
	}
	.formBox input[type="text"]:focus,.formBox input[type="password"]:focus{
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
  margin: 15px 0 15px;
}
.register-link p a{
  
  font-size:16px;
  text-decoration: none;
  font-weight: 600;
  
}
.register-link p a:hover{
  text-decoration: underline;
  
}
.error-message1{
font-size:15px;
color:red;
margin-bottom:10px;
}
.error-message{
font-size:15px;
color:red;
margin-bottom:10px;
}
</style>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>

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
	                <li><a href="Courses.jsp">Course</a></li>
	                <li><a href="source.jsp#ourfaq">FAQ</a></li>
	            </ul>
	    	</div>
	    </div>
	</header>
	

<div class="title"><h1>Welcome Back!</h1></div>
		<div class="container">
			<div class="left"></div>
			<div class="right">
				<div class="formBox">
					<form action="${pageContext.request.contextPath}/LoginController" method="post">
						
        				<p>Email</p>
						<input type="text" name="email" placeholder="Email">
						<c:if test="${not empty requestScope.Invalid}">
        						<div class="error-message1">${requestScope.Invalid}</div>
        				</c:if>
						<p>Password</p>
						<input type="password" name="password" placeholder="Password">
						<c:if test="${not empty requestScope.Incorrect}">
        					<div class="error-message">${requestScope.Incorrect}</div>
        				</c:if>
						<input type="submit" name="submit" value="Login">
						<div class="register-link">
        					<p>Don't have an account? <a href="index.jsp">Register</a></p>
      					</div>
					</form>
				</div>
			</div>
		</div>



</body>
</html>