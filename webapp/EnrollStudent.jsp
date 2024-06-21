<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.EnrollStudentDAO" import="dao.*"%>
<%@ page import="model.EnrollStudent" %>
<%@ page import="java.util.List" %>
<% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);%>
<%
   	int course_id=(int) session.getAttribute("course_id");
    EnrollStudentDAO edao=new EnrollStudentDAO();
    List<EnrollStudent> stu = edao.get_enroll(course_id);
    pageContext.setAttribute("stuList",stu,PageContext.PAGE_SCOPE); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enroll Students</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<style> @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
*{
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: Arial, Helvetica, sans-serif;
  
}
body {
   background-color:#E6E6E6;
   color:black;
   /*font-family: 'Comic Sans MS', cursive;*/
   line-height: 1.5;
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
  	background: #14279B;
  	box-shadow: 0px 0px 10px 0px grey;
  	color:white;
}

.header b{
	font-size:40px;
	color:white;
	font-family: 'Comic Sans MS', cursive;
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
	background:#3D56B2;
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
	margin-top:20px;
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
	background-color:#3D56B2;
	height:60px;
	color:white;
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
.row table  td .button1{
  display:inline-block;
  padding:5px;
  border-radius:4px;
  background-color:#3D56B2;
  color:white;
  margin-right:3px;
}
.row table  td .button1.edit{
padding-left:8px;
padding-right:8px;
}
.row table  td .button1:hover{
background-color:   #14279B;
color:;
}

    </style>
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
	      <li><a href="lectureProfile.jsp"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
          <li><a href="MaterialLecture.jsp"><i class="fa-solid fa-book-open"></i>Materials</a></li>
          <li><a href="QuizLecture.jsp"><i class="fa-solid fa-book-open"></i>Quiz</a></li>
          
          <li><a href="EnrollStudent.jsp"><i class="fa-solid fa-users"></i>Students</a></li>
          <li><a href="AnnouncementLecture.jsp"><i class="fa-solid fa-bullhorn"></i>Announcements</a></li>
          <li><a href="SubmissionAllLecture.jsp"><i class="fa-solid fa-book-open"></i>Submissions</a></li>
          <li><a href="QuizResultAllLecture.jsp"><i class="fa-solid fa-book-open"></i>Quiz Result</a></li>
            
            <li><a href="changePwdLecture.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
        <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
      </ul>
	</div>
	
	<div class="main-body">
		<h2>Enrolled Students</h2>
        	<div class="row">
          		<table>
              		<tr>
                		<td class="th">Name</td>
						<td class="th">Email</td>
						<td class="th">Operations</td>
					</tr>
				<tbody id="tbo">
        		<c:forEach items="${stuList}" var="stu">   
              		<tr>
		                <td>${stu.name}</td>
		                <td>${stu.email}</td>
		                <td><a href = "${pageContext.request.contextPath}/enrollController?action=Delete&email=${stu.email}" class="button1">Delete</a>               
                   </td>
              		</tr>
            	</c:forEach>
            	</tbody>
          		</table>
        	</div>
	</div>
</body>
</html>