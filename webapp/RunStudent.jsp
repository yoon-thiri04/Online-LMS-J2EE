<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="util.DBConnection" import ="java.sql.Connection" import="java.util.Date" import="java.text.*" import="java.sql.*"  
import="dao.UserDAO" import="java.util.List" import="model.Course" import="model.EnrollStudent"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <% 
     session = request.getSession(); 
    String userEmail = (String) session.getAttribute("userEmail"); 
    UserDAO udao=new UserDAO();
    String username=udao.getName(userEmail);
    
%>
<%
	List<EnrollStudent> RunStudent=(List)request.getAttribute("RunStudent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Running Courses</title>
</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<style>@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
  *{
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: Poppins, Helvetica, sans-serif;
}
body{
  background-color: #DDF2FD;
}

.header{
  display: flex;
  position:fixed;
  align-items: center;
  justify-content: space-between;
  height: 60px;
  padding: 20px;
  background:#427D9D;
  color:white;
  width:100%;
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
  margin-right:10px;
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
/* Side menubar section */
.sidebar{
	position:fixed;
	width: 230px;
	height:100%;
	background:#164863;
}
.sidebar ul a{
	display:block;
	width:100%;
	line-height:65px;
	font-size:15px;
	color:white;
	padding-left:20px;
	box-sizing:border-box;
	border-top:1px solid rgba(255,255,255,.1);
	border-bottom:1px solid black;
	transition:.4s;
}
ul li:hover a{
	padding-left:50px;
}
.sidebar ul a i{
	margin-right:16px;
}
.side_navbar a:hover{
  background: rgb(235, 235, 235);
}
.side_navbar .active{
  border-left: 2px solid rgb(100, 100, 100);
}
/*Main body*/
.main-body {
	margin-left:260px;
	margin-top:30px;
}
#title{
	height:60px;
	width:1250px;
	margin-left:50px;
	
	display:flex;
	align-items:center;
}
.btn{
	width:210px;
	height:70px;
	color:black;
	display:flex;
	align-items:center;
	transition: all 0.5s ease 0s;
}
.btn i{
	font-size:20px;
	margin-left:10px;
	color:white;
}
.btn #Addbtn:hover{
background-color:164863;
}
#Addbtn{
	display:flex;
	align-items:center;
	margin-left:10px;
	margin-top:20px;
	margin-bottom:25px;
	background-color:#427D9D;
	height:35px;
	width:90px;
	padding-left:5px;
	padding-right:5px;
	border:1px solid black;
	transition: all 0.5s ease 0s;
	border-radius:10px;
}

#Addbtn h3{
	color:white;
}

/*table head*/
#alltable{
	margin-left:50px;
}
#tablehead .th{
	background-color:#9BBEC8;
	height:60px;
	text-align:center;
	color:black;
}
/*table body or Lectures'list*/
#tbo{
	margin-left:0px;
	text-align:center;
	background-color:white;
}
#tbo td{
	background-color:white;
	
}
#tbo td .action{
  	display:inline-block;
  	padding:5px 0;
  	
  	margin-right:3px;
  	color:black;
  	transition: all 0.3s ease 0s;
}
#tbo td .view:hover{
	color:blue;
}
.fa-arrow-up-right-from-square{
	font-size:20px;
}

/*Table*/
.col1{
	width:350px;
	padding: 10px 10px;
}
.col2{
	width:350px;
}
.col3{
	width:350px;
}
.col4{
	width:250px;
}


table, th, td{
	border: 0.1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<header class="header">
	    <div class="logo">
	      <a href="#"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a> </div>

	    <div class="header-icons">
	    	<div class="account">
	        	<i class="fa-solid fa-circle-user"></i>
	        	<h3><%=username %></h3>
	      	</div>
	    </div>
	    
	</header>
	<div style="height:60px;">---------------</div>
	<div class="sidebar">
    	<ul>
			<li><a href="Admin.jsp"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
		    <li><a href="CourseAdmin.jsp"><i class="fa-solid fa-book-open"></i>Courses</a></li>
		    <li><a href="lectures.jsp"><i class="fa-solid fa-chalkboard-user"></i>Lecturers</a></li>
		    <li><a href="AdminUserlist.jsp"><i class="fa-solid fa-users"></i>Register Users</a></li>
			<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
		</ul>
	</div>
	
  <div class="main-body">
          <div id="title">
		<h2>${c_name } <i class="fa-solid fa-code"></i></h2>
		<div id="Addbtn">
			<a href="Admin.jsp" class="btn">
				<h3> Back</h3><i class="fa-solid fa-up-right-from-square"></i>
	    	</a>
	    </div>
		
    </div>
      	<div id="alltable">
        	<table id="tablehead">
            	<tr>
	                <td class="th col1"><h3>Name</h3></td>
	                <td class="th col2"><h3>Email</h3></td>
	                <td class="th col3"><h3>Enrollment Date</h3></td>
	                
	                
            	</tr>
            </table>   
                    
             <c:forEach items="${RunStudent}" var="r">
            <table id="tbo">
            <tr> 
                   <td class="td col1">${ r.name}</td> 
	                <td class="td col2">${ r.email}</td>
	                <td class="td col3">${r.date}</td>
	                
            </tr>
            </table>
            </c:forEach>
               </div>
	</div>
</body>
</html>