<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="javax.servlet.http.HttpSession"  import="dao.UserDAO"%>
    <% 
    
    session = request.getSession(); 
    String userEmail = (String) session.getAttribute("userEmail"); 
    UserDAO udao=new UserDAO();
    String username=udao.getName(userEmail);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<style>
*{

 margin: 0;
 padding: 0;
 box-siziing: border-box;
 font-family: "Poppins",sans-serif;
}


body{
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: hsla(212, 100%, 50%, 1);
  	background: linear-gradient(225deg, hsla(212, 100%, 50%, 1) 0%, hsla(203, 62%, 85%, 1) 100%);
  	background: -moz-linear-gradient(225deg, hsla(212, 100%, 50%, 1) 0%, hsla(203, 62%, 85%, 1) 100%);
  	background: -webkit-linear-gradient(225deg, hsla(212, 100%, 50%, 1) 0%, hsla(203, 62%, 85%, 1) 100%);
  	filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#0077FF", endColorstr="#C0DEF0", GradientType=1 );  	
	background-size: cover;
	background-position: center;
}

.wrapper{
	width: 350px;
	height: 350px;
	background: transparent;
	border: 2px solid rgba(255, 255, 255, .2);
	backdrop-filter: blur(20px);
	box-shadow: 0 0 10px rgba(0,0,0,.2);
	color: black;
	border-radius: 10px;
	padding: 30px 40px;
	
}
.wrapper h2{
	font-size: 36px;
	text-align: center;
}
.wrapper .input-box{
	position: relative;
	width: 100%;
	height:50px;
	
	margin: 30px 0;
	
}
.wrapper h2{
	font-size: 36px;
	text-align: center;
}


.input-box input{

	width: 81%;
	height: 5px;
	background: transparent;
	border: none;
	outline: none;
	border: 2px solid rgba(255,255,255,.2);
	/*border: 1px solid black;*/
	border-radius: 40px;
	font-size: 16px;
	color: black;
	padding: 20px 45px 20px 20px;
	
}

.input-box input::placeholder{
	color: black;
	
}
.input-box ion-icon{
	position: absolute;
	right: 20px;
	top : 50%;
	transform: translateY(-50%);
	font-size: 20px;
	
}

.wrapper .button{
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

.error-message {
    display: none;
    padding: 10px;
    margin-top: 10px;
    border: 1px solid ;
    background-color: #ff4d4d;
    color:red;
    border-radius: 10px;
    width: 230px;
    text-align: center;
}



/*.newPassword{
	width: 100%;
	height: 30px;
	border-radius: 10px;
	border: 2px solid;
	margin-top: 10px;
}

.retypePassword{
	width: 100%;
	height: 30px;
	border-radius: 10px;
	border: 2px solid;
	margin-top: 10px;
}*/
	
</style>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>  
</head>
<body>
	
	<div class="wrapper">
		<c:if test="${not empty requestScope.Success}">
			<div class="error-message1">${requestScope.Success}</div>
		</c:if>
		<form action="${pageContext.request.contextPath}/changePassword" method="post">
			<h2>Change Password</h2>
			<div class="input-box">
				<input type="text" name="name" value="<%=username%>"/>
			</div>
			<div class="input-box">
				<input type="text" name="email" value="<%=userEmail%>" required/>
			</div>
			<div class="input-box">
				<input type="password" name="newPwd" class="newPassword" placeholder="New Password" required/>
			</div>
			<div class="input-box">
				<input type="password" name="reTypePwd" class="retypePassword" placeholder="RetypePassword" required/>
			</div>
			<c:if test="${not empty requestScope.notMatch}">
            	<div class="error-message1">${requestScope.notMatch}</div>
     		</c:if>
			<input type="submit" value="change" class="button"/>
		</form>
		<button onclick="history.back()">Back</button>
	</div>
</body>
</html>