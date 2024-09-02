<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.lectureDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList" %>
<%@ page  import="java.util.List" %>
<%@ page import ="model.Lect" import="dao.UserDAO" import ="model.User"%>
<%
UserDAO userdao = new UserDAO();
List<User> userList = userdao.get();
request.setAttribute("userlist", userList);

%>
<% 
    // Retrieve the username from the session attribute 
     session = request.getSession(); 
    String userEmail = (String) session.getAttribute("userEmail");
    UserDAO udao=new UserDAO();
    String username=udao.getName(userEmail);
%>

<%
  lectureDAO dao= new lectureDAO();
  List<Lect> lec= dao.get();
  pageContext.setAttribute("lect",lec,PageContext.PAGE_SCOPE);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Lecturer</title>
  <link rel="stylesheet" href="style.css" />
  <!-- Font Awesome Cdn Link -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

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
#title{
	height:60px;
	width:1250px;
	margin-left:300px;
	margin-top:10px;
	display:flex;
	align-items:center;
}
/*table head*/
#alltable{
	margin-left:300px;
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

/*Add button*/

/*Table*/
.col1{
	width:100px;
	padding: 5px 5px;
}
.col2{
	width:250px;
}
.col3{
	width:250px;
}
.col4{
	width:300px;
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
	       <a href="#"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a>
</div>

	    <div class="header-icons">
	    	<div class="account">
	        	<i class="fa-solid fa-circle-user"></i>
	        	<h3><%= username %></h3>
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
	
    <div id="title">
		<h2>Register Users</h2>
		
    </div>
	
  
    <div id="alltable">
        	<table id="tablehead">
            	<tr>
	                <td class="th col1"><h3>Profile</h3></td>
	                <td class="th col2"><h3>User Name</h3></td>
	                <td class="th col3"><h3>Email </h3></td>
	                <td class="th col4"><h3>Total Enrolled Courses</h3></td>
	                
            	</tr>
            </table>            
            <c:forEach items="${userlist}" var="user"> 
            <table id="tbo">
            <tr> 
                   <td class="td col1"><img src="avatar.jpeg" width="80" height="60"/></td> 
	                <td class="td col2">${user.user_name}</td>
	                <td class="td col3">${user.email}</td>
	                <c:set var="email" value="${user.email}"></c:set>
	               <%
	               String email=(String) pageContext.getAttribute("email");
	               int total=udao.getTotal(email); 
	               %>
	                <td class="td col4"><%=total %></td>
	                
            </tr>
            </table>
            </c:forEach>
               </div>

</body>
</html>