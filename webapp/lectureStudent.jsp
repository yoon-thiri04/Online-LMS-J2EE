<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.EnrollStudentDAO"  import="dao.lectureDAO" %>
<%@ page import="model.EnrollStudent" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DBConnection" import ="java.sql.Connection" import="java.sql.*" %>

<% 
   int course_id=(int) session.getAttribute("course_id");
    lectureDAO dao=new lectureDAO();
    List<EnrollStudent> stu = dao.getEnrollmentDetails(course_id);
    pageContext.setAttribute("stu",stu,PageContext.PAGE_SCOPE);
    
%>
<% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);
    %>
<span style="font-family: verdana, geneva, sans-serif;">
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Instructor</title>
  
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
  <style> 
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
    * {
      margin: 0;
      padding: 0;
      border: none;
      outline: none;
      text-decoration: none;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }
    body {
      background: rgb(219, 219, 219);
    }
    .header b{
	font-size:40px;
	color:white;
}
.header{
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 60px;
  padding: 20px;
  background:#427D9D;
  color:white;
  position:fixed;
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
  margin: 2rem 8rem 2rem 1rem;
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
.header-icons .account img{
  width: 35px;
  height: 35px;
  margin-right:10px;
  cursor: pointer;
  border-radius: 50%;
}
    /*.profile-card {
      max-width: 700px;
      background-color: beige;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin-left:650px;
      margin-top: 30px;
      padding-right: 10px;
      padding-top: 10px;
      display: flex;
      flex-align:row;
      align-items: center;
    }
    .profile-picture {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      margin-bottom: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .profile-picture img {
      border-radius: 50%;
      max-width: 100%;
      max-height: 100%;
    }
    .profile-card h2 {
      font-size: 20px;
      text-align: center;
    }
    .profile-card .contact-info {
    }
    .profile-card .contact-info table td {
      height: 10px;
    }
 */   
.container{
  display: flex;
  margin-right:200px;
  justify-content: space-between;
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
/*#check{
	display:none;
}*/
label /*#btn*/,label #cancel{
	position:absolute;
	cursor:pointer;
	background:black;
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

/* Side menubar section */

/* Main Body Section */
.main-body {
	margin-left:60px;
	margin-top:30px;
}
.dashboard{
	background-color:#7C96AB;
	margin-top:30px;
	padding-bottom:30px;
	display:inline-block;
}
.block{
	margin-top:30px;
	width:270px;
	height:100px;
	display:inline-block;
	margin-right:30px;
	text-align:center;
	padding-top:20px;
	border:1px solid black;
	font-size:20px;
	cursor:pointer;
	transition: all 1s ease 0s;
}
.block i{
	font-size:30px;
}
#first{
	background-color:#C8E6C9 ;
	margin-left:180px;
}
#first:hover{
	background-color:#58D68D;
}
#second{
	background-color:#B3E5FC;
}
#second:hover{
	background-color:#3498DB;
}
#third{
	background-color:#FFE0B2;
}
#third:hover{
	background-color:#F5B041;
}
    html {
  line-height: 1.15;
  -webkit-text-size-adjust: 100%;
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

:root {
  --small-green-circle: #78eea6;
  --main-accent-color: #9b45e4;
  --secondary-accent-color: #e13a9d;
}

a {
  background-color: transparent;
}

img {
  border-style: none;
}

button {
  font-family: inherit;
  font-size: 100%;
  line-height: 1.15;
  margin: 0;
  overflow: visible;
  -webkit-appearance: button;
}

button::-moz-focus-inner,
[type="button"]::-moz-focus-inner {
  border-style: none;
  padding: 0;
}

body {
  margin: 0;
  background: #e6b2c6;
  background: -webkit-linear-gradient(to right, #e6b2c6, #d6e5fa);
  background: linear-gradient(to right, #e6b2c6, #d6e5fa);
  font-family: "Lato", sans-serif;
  font-weight: normal;
  background-repeat: no-repeat;
}

.container1 {
  text-align: center;
}

.card {
  padding: 1em;
  margin-left:20em;
  margin-bottom:12em;
  border-radius: 0.8em;
  background-color: #fefefe;
  box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.02),
    0 6.7px 5.3px rgba(0, 0, 0, 0.028), 0 12.5px 10px rgba(0, 0, 0, 0.035),
    0 22.3px 17.9px rgba(0, 0, 0, 0.042), 0 41.8px 33.4px rgba(0, 0, 0, 0.05),
    0 100px 80px rgba(0, 0, 0, 0.07);
  position: relative;
  width:400px;
  height:500px;
}

.card:after {
  content: "";
  position: absolute;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background-color: var(--small-green-circle);
  /*top: 25px;
  right: 96px;*/
  border: 2px solid white;
}
.card__image {
  width: 100px;
  border-radius: 50%;
}
.card__info {
  margin: 1em 0;
  list-style-type: none;
  padding: 0;
}
.card__info li {
  display: inline-block;
  text-align: center;
  padding: 0.5em;
}
/*.card__info__stats {
  color: var(--main-accent-color);
  font-weight: bold;
  font-size: 1.2em;
  display: block;
}
*/
.card__info__stats + span {
  color: #969798;
  text-transform: uppercase;
  font-size: 0.8em;
  font-weight: bold;
}

.card__text h2 {
  margin-bottom: 0.3em;
  font-size: 1.4em;
  color: #6f6f6f;
}

.card__text p {
  margin: 0;
  color: #999;
  font-size: 0.90em;
}
.card__text ul {
    list-style-type: none;
  }
  .card__text ul{
    text-align: left;
    margin-left:50px;
  }
  .card__text ul li{
   padding:4px;
  }
  

@media (min-width: 425px) {
	.card {
		padding: 3em;
	}
	.card:after {
	    top: 50px;
	    right: 160px;
	}
	.card__info li {
		padding: 1em;
	}
}
</style>
</head>
<body>
	<header class="header">
	    <div class="logo">
	      <a href="#"><b>Smart Learn</b></a>
	    </div>

	    <div class="header-icons">
	    	<div class="account">
	        	<img src="image/profileicon.png" alt="">
	        	<h4><%= username %></h4>
	      	</div>
	    </div>
	</header>
	<div style="height:60px;">---------------</div>
	<div class="sidebar">
    	 <ul>
      <li><a href="lectureProfile.jsp"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
      <li><a href="MaterialLecture.jsp"><i class="fa-solid fa-link"></i>Material</a></li>
      <li><a href="lectureStudent.jsp"><i class="fa-solid fa-bars-staggered"></i>Student</a></li>
      <li><a href="AnnouncementLecture.jsp"><i class="fa-solid fa-calendar-week"></i>Announcements</a></li>
    <li><a href="changePwdLecture.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
      <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
    </ul>
	</div>

	<div class="container">
	  <h2>Student List</h2>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Date</th>
        </tr>
        <c:forEach var="student" items="${stu}">
            <tr>
                <td>${student.name}</td>
                <td>${student.email}</td>
                <td>${student.date}</td>
            </tr>
        </c:forEach>
    </table>
    
</div>
  
</body>
</html>
</span>
