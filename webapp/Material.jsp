<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.*" %>
<%@ page import="model.Material" %>
<%@ page import="java.util.List" import="java.sql.*" import="util.*"%>


<%
session = request.getSession(); 
String userEmail = (String) session.getAttribute("stuEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
    int course_id = Integer.parseInt(request.getParameter("course_id"));
    session.setAttribute("course_id",course_id);
    uploadDao mDAO = new uploadDao();
    List<Material> matList = mDAO.getfor(course_id);
    pageContext.setAttribute("mList", matList,PageContext.PAGE_SCOPE);
    int total=mDAO.getTotalMat(course_id);
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<title>Material Student</title>

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
body{
  background:#DDF2FD;
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
  	background:#427D9D;
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

.header-icons .account ul{
  display: flex;
  align-items: center;
  gap:40px;
}

.header-icons .account ul li{
	list-style-type: none;
}

.header-icons .account ul li a{
    color: white;
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
.header-icons .profile{
	display:flex;
	align-items:center;
	margin-left:20px;
	font-size:20px;
	cursor:pointer;
}
.header-icons .profile i{
	font-size:29px;
	margin-right:15px;
	color:white;
}
.sidebar{
  margin-top:0px;
  position:fixed;
  width: 230px;
  height:100%;
  background:#164863;
  /*transition:all .5s ease;*/
}
.sidebar header{
  font-size:22px;
  color:white;
  text-align:center;
  line-height:70px;
  background:#0A6EBD  ;
  user-select:none;
}
.sidebar ul a{
  display:block;
  height:100%;
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
/*#check{
  display:none;
}*/
label /*#btn*/,label #cancel{
  position:absolute;
  cursor:pointer;
 
  border-radius:3px;
}
label /*#btn*/{
  left:35px;
  top:20px;
  font-size:25px;
  color:white;
  padding:6px 12px;
  transition:all .5s;
}
label #cancel{
  z-index:1111;
  left:-195px;
  top:17px;
  margin-left:30px;
  font-size:15px;
  color:white;
  padding:4px 5px;
}

/* Main Body Section */
.main-body{
  width: 83%;
}
.container{
margin-top:40px;
}
.block{
	background-color:white/*#71c7ec*/;
	height:100px;
	width:900px;
	border-radius:30px;
	margin-left:auto;
	margin-right:auto;
	margin-top:10px;
	margin-bottom:20px;
	box-shadow: 0px 0px 5px 0px #6B6B6B;
	transition: all .4s ease;
}
.block:hover{
	box-shadow: 0 26px 58px 0 rgba(0, 0, 0, .22), 0 5px 14px 0 rgba(0, 0, 0, .18);
}

.block .assign{
	
	display:inline-block;
	margin-top:10px;
	margin-left:50px;
	margin-right:30px;
	font-size:20px;
	width:500px;
  	white-space: nowrap; /* Prevents text from wrapping to the next line */
  	overflow: hidden; /* Hides the overflow text */
  	text-overflow: ellipsis;
  	padding-right:20px;
}
.block p{
	margin-left:50px;
	margin-top:5px;
}
h1{
margin-left:320px;
margin-top:10px;
}
.fa-download{
	font-size:25px;
}
.action{
    display:inline-block;
    padding:10px 5px;
    color:black;
    transition: all 0.3s ease 0s;
}
.download:hover{
color:#3D56B2;
}
.empty{
  margin: 0 auto;
  margin-top:10%;
  background-color:#DDF2FD;
  width:27%;
  height:280px;
 
}
.empty img{
width:270px;
height:210px;
margin-top:10px;
margin-left:80px;
 img-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
}

.fa-stack-overflow{
font-size:20px;
font-weight:500;
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
		        <ul>
	            	<li><a href="sourceLogin.jsp">Home</a></li>
	                <li><a href="CoursesLogin.jsp">Course</a></li>
	                <li><a href="sourceLogin.jsp#ourfaq">FAQ</a></li>
	              
	            </ul>
	    	</div>
	    	<div class="profile">
		        <a href="student1.jsp"><i class="fa-solid fa-circle-user"></i></a>
		        <h4><%= username %></h4>
		    </div>
	    </div>
	</header>
	<div style="height:60px;">------------</div>
  <div class="sidebar">
    <ul>
      <li><a href="student1.jsp"><i class="fa-solid fa-link"></i>Enrolled Courses</a></li>
      <li><a href="#"><i class="fa-solid fa-calendar-week"></i>Course Materials</a></li>
      <li><a href="Assignment.jsp"><i class="fa-solid fa-calendar-week"></i>Assignment</a></li>
       <li><a href="QuizStudent.jsp"><i class="fa-solid fa-calendar-week"></i>Quiz</a></li>
      <li><a href="Announcements.jsp"><i class="fa-solid fa-bullhorn"></i>Announcements</a></li>
      <li><a href="changePwd.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
      <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
    </ul>  
  </div>
  
  <div class="container">
   <% if(total==0){
	%>
	<div class="empty">
	 <img src="logrem.png" />
	
	 <p style="text-align:center;">Opps! There is no course materials yet. <i class="fa-brands fa-stack-overflow"></i> </p>
	 </div>
   <%
   }else{ %>
   <c:forEach items="${mList}" var="ml">
            <c:set var="mat_id" value="${ml.id}" />
            
  <div class="block">
		<table style="width:800px;">
			<tr>
				<td>
					<div class="assign">
						<b>${ml.title}</b></div>
					<p>${ml.type}</p>	
				</td>
				<td>
					<a href = "${pageContext.request.contextPath}/MaterialController?action=DOWNLOAD&id=${ml.id}&title=${ml.title}&ftype=${ml.ftype}" 
					class="action download">Download <i class="fa-sharp fa-solid fa-download fa-sm"></i></a>	
				</td>
			<tr>
		</table>
	</div>
            </c:forEach>
       <%} %>
          
</div>

</body>
</html>