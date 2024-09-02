<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="javax.servlet.http.HttpSession"  import="dao.*"%>
    <% 
    
    session = request.getSession(); 
    String userEmail = (String) session.getAttribute("userEmail"); 
    lectureDAO udao=new lectureDAO();
    String username=udao.getNameLecture(userEmail);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password Lecture</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");

*{
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: Poppins, Helvetica, sans-serif;
}
body {
   background-color: #DDF2FD;
}
/*header*/
.header{
	position:fixed;
  	display: flex;
  	align-items: center;
  	justify-content: space-between;
  	height: 60px;
  	width:100%;
 	padding: 20px;
  	background: #427D9D;
  	box-shadow: 0px 0px 10px 0px grey;
  	color:white;
}

.header b{
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
  display: flex;
  align-items: center;
}
.header-icons .account i{
  font-size:29px;
	margin-right:15px;
}
.header-icons .account img{
  width: 35px;
  height: 35px;
  margin-right:10px;
  cursor: pointer;
  border-radius: 50%;
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
	    background: url(https://st3.depositphotos.com/6837936/19487/v/450/depositphotos_194871882-stock-illustration-e-learning-online-education-design.jpg);
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
</head>
<body>
	<header class="header">
    <div class="logo">
     <a href="#"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a>
     </div>
    <div class="header-icons">
    	<div class="account">
	        <i class="fa-solid fa-circle-user"></i>
	        <h3><%=username %></h3>
    	</div>
    </div>
  </header>
  <div style="height:60px;">------------</div>
	<div class="title"><h1>Change Password</h1></div>
		<div class="container">
			<div class="left"></div>
			<div class="right">
				<div class="formBox">
					
					<form action="${pageContext.request.contextPath}/changePassword" method="post">
					<input type="hidden" name="email" value="<%=userEmail %>">
        				<p>New Password</p>
						<input type="password" name="newPwd" class="newPassword" placeholder="New Password" required/>
			
						<p>RetypePassword</p>
						<input type="password" name="reTypePwd" class="retypePassword" placeholder="RetypePassword" required/>
			
						<c:if test="${not empty requestScope.notMatch}">
            	<div class="error-message1">${requestScope.notMatch}</div>
     		</c:if>
						<input type="submit" name="submit" value="Change">
					</form>
				</div>
			</div>
		</div>
	
</body>
</html>