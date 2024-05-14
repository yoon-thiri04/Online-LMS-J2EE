<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
*{
 margin: 0;
 padding: 0;
 box-siziing: border-box;
 text-decoration:none;
 font-family:Arial,Helvetica, sans-serif;
}

body{
	background: linear-gradient(45deg, hsla(177, 87%, 79%, 1) 12%, hsla(235, 89%, 70%, 1) 100%);
	background: -moz-linear-gradient(45deg, hsla(177, 87%, 79%, 1) 12%, hsla(235, 89%, 70%, 1) 100%);
	background: -webkit-linear-gradient(45deg, hsla(177, 87%, 79%, 1) 12%, hsla(235, 89%, 70%, 1) 100%);
	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#9bf8f4", endColorstr="#6f7bf7", GradientType=1 );
}
/*header*/
.header{
  	display: flex;
  	align-items: center;
  	justify-content: space-between;
  	height: 30px;
 	padding: 20px;
  	background: #387ADF;
  	box-shadow: 0px 0px 10px 0px grey;
  	color:white;
}

.header b{
	font-size:40px;
	color:white;
	font-family:'Comic Sans MS',cursive;
}

.logo{
  display: flex;
  align-items: center;
}

.logo a{
  color: #000;
  font-size: 18px;
  font-weight: 600;
  margin: 2rem 8rem 2rem 1rem;
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
.body{
	display: flex;
	justify-content: center;
	width:100%;
}
.wrapper{
  width: 350px;
  background: transparent;
  border: 2px solid rgba(255, 255, 255, .2);
  backdrop-filter: blur(20px);
  box-shadow: 0 0 10px rgba(0,0,0,.2);
  color: #fff;
  border-radius: 10px;
  padding: 30px 40px;
  height:390px;
  margin-top:100px;
  margin-bottom:126px;
}
.wrapper h1{
  font-size: 36px;
  text-align: center;
}
.wrapper .input-box{
  position: relative;
  width: 100%;
  height:50px;
  margin: 30px 0; 
}

.input-box input{
  width: 81%;
  outline: none;
  border: 2px solid rgba(255,255,255,.2);
  border-radius: 40px;
  font-size: 17px;
  padding: 20px 45px 20px 20px;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  font-weight:bold;
}

.input-box input::placeholder{
  color:white;
  font-weight:bold;
  font-size:17px;
}
.input-box ion-icon{
  position: absolute;
  right: 20px;
  top : 50%;
  transform: translateY(-50%);
  font-size: 20px;
  
}
.wrapper .remember-forgot{
  display: flex;
  justify-content: space-between;
  font-size: 14.5px;
  margin: -15px 0 15px;
}
.remember-forgot label input{
  accent-color: #fff;
  margin-right: 3px; 
}
.remember-forgot a{
  color: #fff;
  text-decoration: none;
}
.remember-forgot a:hover{
  text-decoration: underline; 
}
.wrapper .btn{
  width: 100%;
  height: 45px;
  background: #fff;
  border: none;
  outline: none;
  border-radius: 40px;
  box-shadow : 0 0 10px rgba(0,0,0,.1);
  cursor: pointer;
  font-size: 16px;
  color: #333;
  font-weight: 600;
}
.wrapper .register-link{
  font-size: 14.5px;
  text-align: center;
  margin: 20px 0 15px;
}
.register-link p a{
  color: #fff;
  text-decoration: none;
  font-weight: 600;
  
}
.register-link p a:hover{
  text-decoration: underline;
  
}
.error{
color:black;}
</style>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</head>
<body>
	<header class="header">
	    <div class="logo">
	      <a href="#"><b>Smart Learn</b></a>
	    </div>
	    
	    <div class="header-icons">
	    	<div class="account">
		        <ul>
	            	<li><a href="sourceHome.jsp">Home</a></li>
	                <li><a href="Courses.jsp">Course</a></li>
	                <li><a href="sourceHome.jsp#aboutUs">About Us</a></li>
	            </ul>
	    	</div>
	    </div>
	</header>
	<div class="body">
  	<div class="wrapper">
    	<form action="${pageContext.request.contextPath}/LoginController" method="post" >
      	<h1>Login</h1>
      	<div class="input-box">
        	<input type="text" placeholder="Username" name="name" required>
        	<ion-icon name="person"></ion-icon>
      	</div>
       	<c:if test="${not empty requestScope.Invalid}">
        	<div class="error-message1">${requestScope.Invalid}</div>
        </c:if>
      	<div class="input-box">
        	<input type="password" placeholder="Password" name="password" required>
        	<ion-icon name="lock-closed"></ion-icon>
      	</div>
       	<div class="input-box">
        	<input type="email" placeholder="Email" name="email" required>
        	<ion-icon name="lock-closed"></ion-icon>
      	</div>
       	<c:if test="${not empty requestScope.Incorrect}">
        	<div class="error-message">${requestScope.Incorrect}</div>
        </c:if>
     
      	<button type="submit" class="btn">Login</button>
      	<div class="register-link">
        	<p>Don't have an account? <a href="indexRegister.jsp">Register</a></p>
      	</div>
      
		</form>
	</div>
</div>
</body>
</html>