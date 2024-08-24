<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement" import="java.sql.PreparedStatement "%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.util.List" %>
<%@page import="model.Lect" %>
<%@page import="dao.*" import="dao.courseDAO" import="java.util.ArrayList" import="model.CourseInstructor"%>
<%
session = request.getSession(); 
String userEmail = (String) session.getAttribute("stuEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Courses Enrolled</title>
<script>
	function enroll(course_id) {
	        window.location.href = "Material.jsp?course_id=" + course_id;
	}
</script>
<!-- Font Awesome Cdn Link -->
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
  font-family: Arial, Helvetica, sans-serif;
}
body{
  background: #FBFAD3;
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
  	background: #36622B;
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
	margin-right:30px;
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
/* Side menubar section */
.sidebar{
	position:fixed;
	width: 230px;
	height:100%;
	background:#729D39;
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
	border-bottom:1px solid white;
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
	margin-left:150px;
	margin-top:30px;
    margin-right:30px;
}

/*cards*/
.mainmain{
    display: flex;
    flex-wrap: wrap;
    margin-left:150px;
}

.grid-container{
    flex: 0 0 calc(33.333% - 60px);
    margin-top:30px;
    margin-bottom:50px;
    
}

.grid-item{
	border: 2px solid white;
    box-shadow: 10px 4px 8px 0 rgba(0, 0, 0, 0.2), 2px 2px 2px 0 rgba(229, 194, 41, 0.264);
    border-radius: 15px 50px ;
    transition: all .3s cubic-bezier(.445, .05, .55, .95);
    border: 1px solid #f0eded;
    transition: all 1s ease 0s;
    cursor: pointer;
   margin-right:30px;
    display:flex;
    width:1200px;
}
.grid-item:hover{
    box-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
    border: 1px solid #111;
}
.grid-item .title{
	margin-top:30px;
	margin-left:30px;
	margin-bottom:20px;
}
.grid-item table td{
	text-align:left;
	padding-left:30px;
	padding-right:50px;
	font-size:18px;
}
.grid-item table{
	margin-bottom:10px;
	padding:5px;
	width:800px;
}
.grid-item table tr{
	height:30px;
}
.course{
  	padding-top:30px;
  	padding-bottom:20px;
  	padding-left:300px;
  	background-color:#D6EAF8;
  	border-top:1px solid black;
  	margin-bottom:30px;
}
img{
	width:180px;
	height:180px;
	border-radius:100px;
	margin-top:50px;
	margin-left:30px;
}
.basicduration {
	margin-top:6px;
	padding-top:2px;
	text-align:center;
	width:80px;
	height:20px;
	border:2px solid black;
	border-radius:15px;
	margin-bottom:10px;
	background-color:white;
}
.protext{
	margin-top:20px;
	margin-left:10px;
	color:black;
	margin-bottom:20px;
}
.protext h2{
	margin-bottom:5px;
	margin-top:20px;
}
.aboutcourse{
	width:1000px;
	color:black;
	font-size:20px;
	padding-bottom:10px;
}
/*view materials Button*/
.viewmaterial {
    padding: 10px 30px;
    color:black;
    text-decoration: none;
    border: 1px solid #36622B;
    border-radius: 4px;
    margin-top:20px;
    margin-bottom:30px;
    margin-left:30px;
    transition: all 0.3s ease 0s;
    background:white;
}

.viewmaterial:hover {
    color: #fff;
    background: #36622B;
    border: 1px solid #748dff;
}
</style>
</head>
<body>
<header class="header">
	    <div class="logo">
	      <a href="sourceHomeLogin.jsp"><b>Smart Learn</b></a>
	    </div>
	    
	    <div class="header-icons">
	    	<div class="account">
		        <ul>
	            	<li><a href="sourceHomeLogin.jsp">Home</a></li>
	                <li><a href="CoursesLogin.jsp">Course</a></li>
	                <li><a href="sourceHomeLogin.jsp#aboutUs">About Us</a></li>
	            </ul>
	    	</div>
	    	<div class="profile">
		        <a href="student1.jsp"><i class="fa-solid fa-circle-user"></i></a>
		        <h4><%= username %></h4>
		    </div>
	    </div>
	</header>
	<div style="height:60px;">------------</div>
	
	
	<div class="main-body">
	<h1>Your Enrolled Courses </h1>
	</div>
	<div class="mainmain">
	<%
		ResultSet resultSet=null;
		PreparedStatement preparedstatement=null;
		
		int courseId=0;
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004");
		    Statement st = con.createStatement();
		    String sql = "SELECT course_id FROM enrollment where email=?";
		    preparedstatement = con.prepareStatement(sql);
		    preparedstatement.setString(1, userEmail);
		    resultSet = preparedstatement.executeQuery(); 
		    
		    while (resultSet.next()) {
		    	
		      courseId=resultSet.getInt("course_id");
		      lectureDAO lecturerdao=new lectureDAO();
		
		      List<CourseInstructor> courses = new ArrayList<>();
		      courses = lecturerdao.get(courseId);
		      pageContext.setAttribute("lectd", courses,PageContext.PAGE_SCOPE); 

		%>
		<%
				String file="";	
				try {
					PreparedStatement preparedStatement = null;
					Connection con1 = DBConnection.openConnection();
					Statement st1 = con1.createStatement();
					String sql1 = "SELECT filename FROM lectures where course_id=?";
					preparedStatement = con1.prepareStatement(sql1);
				    preparedStatement.setInt(1,courseId);
					ResultSet rs1 = preparedStatement.executeQuery();
					if (rs1.next()) {
						 file=rs1.getString("filename");
		%>
				 <c:forEach items="${lectd}" var="lect">
					<div class="grid-container">
                    <div id="b1" class="grid-item">
                        <div style="width:250px;">
                            <img src="<%=file%>" alt="Image"/>
                        </div>
                        <div>
                            <h2 class="title">Course - ${lect.title}</h2>
                            <table>
                            	<tr>
                            		<td><b>Instructor</b></td>
                            		<td>${lect.instructor_name}</td>
                            	</tr>
                            	<tr>
                            		<td><b>Level</b></td>
                            		<td>${lect.level}</td>
                            	</tr>
                            	<tr>
                            		<td><b>Category</b></td>
                            		<td>${lect.category}</td>
                            	</tr>
                            	<tr>
                            		<td><b>Duration</b></td>
                            		<td>${lect.duration}</td>
                            	</tr>
                            	<tr>
                            		<td><b>Description</b></td>
                            		<td>${lect.description}</td>
                            	</tr>
                            </table>
                            <div style="display:flex;align-item:center;gap:20px;">
                            	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                            	   </div>
                        </div>
                    </div>
                </div>
				</c:forEach>    
			<%
				} 
					}catch (Exception e) {
				    out.println(e);
				    }
				}}catch (Exception e) {
				    out.println(e);
				}
			%>	
</div>

</body>
</html>
