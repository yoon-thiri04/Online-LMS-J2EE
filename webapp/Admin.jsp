<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="util.DBConnection" import ="java.sql.Connection" import="java.util.Date" import="java.text.*" import="java.sql.*"  
import="dao.UserDAO" import="java.util.ArrayList"%>
<% 
    
     session = request.getSession(); 
    String userEmail = (String) session.getAttribute("userEmail"); 
    UserDAO udao=new UserDAO();
    String username=udao.getName(userEmail);
    
%>
<% int tot=0;
String sql= "select count(*) as total from userlist";
	Connection connection = DBConnection.openConnection();
	Statement statement = connection.createStatement();
	ResultSet resultSet = statement.executeQuery(sql);
    if(resultSet.next()){
	tot =resultSet.getInt("total");
    }
%>

<% int lec=0;
String sql1= "select count(*) as total from lectures";
	Connection connection1 = DBConnection.openConnection();
	Statement statement1 = connection1.createStatement();
	ResultSet resultSet1 = statement1.executeQuery(sql1);
    if(resultSet1.next()){
	lec =resultSet1.getInt("total");
    }
%>
<% int courses=0;
String sql2= "select count(*) as total from courses";
	Connection connection2 = DBConnection.openConnection();
	Statement statement2 = connection2.createStatement();
	ResultSet resultSet2 = statement2.executeQuery(sql2);
    if(resultSet2.next()){
	courses =resultSet2.getInt("total");
 }
    int runCourses =0;
    int otherCourses= 0;
    String deadline = null;
    try {
        String sql_ = "SELECT enrollment_deadline FROM courses";
        Connection connection3 = DBConnection.openConnection();
        Statement statement3 = connection3.createStatement();
        ResultSet resultSet3 = statement3.executeQuery(sql_);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date tdyDate = new Date();
        String date = sdf.format(tdyDate);
        Date TodayEnrollDate = sdf.parse(date);

        while (resultSet3.next()) {
            
            deadline = resultSet3.getString("enrollment_deadline");
            Date DeadlineDate = sdf.parse(deadline);

            if (TodayEnrollDate.compareTo(DeadlineDate) <= 0) {
            	otherCourses+=1;
            	
            } else {
            	runCourses+=1;
            }

        }
    }catch(Exception e){
    	e.printStackTrace();
    }
 
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Admin</title>
  <link rel="stylesheet" href="style.css" />
  <!-- Font Awesome Cdn Link -->
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
  align-items: center;
  justify-content: space-between;
  height: 60px;
  padding: 20px;
  background:#427D9D;
  color:white;
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
.dashboard{
	margin-top:30px;
	margin-left:50px;
	padding-bottom:30px;
	display:grid;
	grid-template-columns:300px 300px 300px;
	gap:50px;
}
.card-single{
	display:flex;
	justify-content:space-between;
	background:#fff;
	padding:2rem;
	border-radius:15px;
	cursor:pointer;
	transition: all 0.3s;
}
.card-single div:last-child span{
	font-size:3rem;
	color:#164863;
}
.card-single div:first-child span,h1{
	color:#164863;
	padding-bottom:3px;
}
.card-single:hover {
	background-color:#164863;
}
.card-single:hover div:first-child span{
	color:white;
}
.card-single:hover div:first-child h1{
	color:white;
}
.card-single:hover div:last-child span{
	color:white;
}

.account i{
	font-size:40px;
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
	        	<i class="fa-solid fa-circle-user"></i>
	        	<h3><%=username %></h3>
	      	</div>
	    </div>
	</header>
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
    	<h2>Admin Dashboard</h2>
    	<div class="dashboard">
    	
    		<div class="card-single">
    			<div>
    				<h1><%out.println(tot);%></h1>
    				<span>Register Users</span>
    			</div>
    			<div>
    				<span class="fa-solid fa-users"></span>
    			</div>
    		</div>
    		<div class="card-single">
    			<div>
    				<h1><%out.println(lec);%></h1>
    				<span>Lectures</span>
    			</div>
    			<div>
    				<span class="fa-solid fa-chalkboard-user"></span>
    			</div>
    		</div>
    		<div class="card-single">
    			<div>
    				<h1><%out.println(courses);%></h1>
    				<span>Total Course</span>
    				
    			</div>
    			<div>
    				<span class="fa-solid fa-book-open"></span>
    			</div>
    		</div>
    		
    		<div class="card-single">
    			<div>
    				<h1><%=runCourses%></h1>
    				<span>Running Course</span>
    				<a href="coursesController?action=SELECTION&type=run">View</a>
    				
    			</div>
    			<div>
    				<span class="fa-solid fa-book-open"></span>
    			</div>
    		</div>
    		<div class="card-single">
    			<div>
    				<h1><%=otherCourses%></h1>
    				<span>Other Course</span>
    				<a href="${pageContext.request.contextPath}/coursesController?action=SELECTION&type=other">View</a>
    			</div>
    			<div>
    				<span class="fa-solid fa-book-open"></span>
    			</div>
    		</div>
    		
    	</div>
      	
	</div>
      
</body>
</html>
