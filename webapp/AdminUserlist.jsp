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
<span style="font-family: verdana, geneva, sans-serif;">


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
  font-family: Arial, Helvetica, sans-serif;
}
body{
  background-color: #DDF2FD;
}
.header b{
	font-size:40px;
	color:white;
	font-family: 'Comic Sans MS', cursive;
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
.logo{
  display: flex;
  align-items: center;
}
.logo a{
  color: #000;
  font-size: 18px;
  font-weight: 600;
  margin: 2rem 8rem 2rem 2rem;
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
.row{
	font-size:20px;
  	margin-top:20px;
  	margin-left:30px;
}
.row table {
	padding-left:0px;
 	background:transparent;
 	padding-bottom:0px;
 	color:black  ;
 	width:80%;
}
.row table .th{
	border:2px solid black;
	background-color:#9BBEC8;
	height:60px;
	color:black;
}
.row table td{
	font-size:18px;
	padding:10px;
	height:50px;
	border:2px solid black;
}
#tbo{
  	background-color:white;
}
/*.row table .twotd td{
 	font-size:17px;
} 
.row table .twotd td .button1{
  	display:inline-block;
  	padding:5px;
  	border-radius:4px;
  	background-color:#90C6F6;
  	color:black;
  	margin-right:3px;
}
.row table .twotd td .button1.edit{
	padding-left:8px;
	padding-right:8px;
}
.row table .twotd td .button1:hover{
	background-color:  #3B9AF5 ;
	color:white;
}
#tbo td .button1{
  display:inline-block;
  padding:5px;
  border-radius:10px;
  background-color:#90C6F6;
  color:black;
  margin-right:3px;
}

#tbo td .edit{
  padding-left:8px;
  padding-right:8px;
  color:green;
}

#tbo td .delete{
  color:red;
}*/
</style>
</head>
<body>
	<header class="header">
	    <div class="logo">
	      <a href="#"><b>Smart Learn</b></a>
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
	
    <div class="main-body">
    	<h2>Register Users</h2>
		<div class="row">
        	<table>
            	<tr>
                	<td class="th"><h4>Name</h4></td>
                	<td class="th"><h4>Password</h4></td>
                	<td class="th"><h4>Email</h4></td>
                </tr>
                	<!--<form action ="enrollInstructor.jsp"> 
       <td>
    <button class="icon-btn add-btn">
      <div class="add-icon"></div>
      <div class="btn-txt">Add</div>     
    </button>
    </td>
    
    </form>-->
            <tbody id="tbo">
				<c:forEach items="${userlist}" var="user"> 
            		<tr>
         				<td>${user.user_name}</td>
        				<td>${user.password}</td>
        				<td>${user.email}</td> 
        			</tr>               
      			</c:forEach>
            </tbody>

    	</table>
    </div>
    </div>
  
    

</body>
</html>