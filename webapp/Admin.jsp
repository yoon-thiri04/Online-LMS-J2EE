<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="util.DBConnection" import ="java.sql.Connection" import="java.util.Date" import="java.text.*" import="java.sql.*"  
import="dao.UserDAO" import="dao.courseDAO" import="java.util.ArrayList" import="java.util.List" import="model.Course"%>
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
    
    courseDAO coursedao=new courseDAO();
    List<Course> run_course= coursedao.getRunCourse();
    pageContext.setAttribute("run_course", run_course);
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
  font-family: Poppins, Helvetica, sans-serif;
}
body{
  background-color: #DDF2FD;
}/*header*/
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
#title{
	height:60px;
	width:1250px;
	margin-left:50px;
	
	display:flex;
	align-items:center;
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
	width:160px;
}
.col3{
	width:250px;
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
	     <a href="#"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a>
	    
	      </div>

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
    	<h2>Dashboard</h2>
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
    		
    	</div>
    	<div id="title">
		<h2>Running Courses</h2>
		
    </div>
      	<div id="alltable">
        	<table id="tablehead">
            	<tr>
	                <td class="th col1"><h3>Course Name</h3></td>
	                <td class="th col2"><h3>Lecturer</h3></td>
	                <td class="th col3"><h3>Total Enrolled Students </h3></td>
	                <td class="th col4"><h3>Action</h3></td>
	                
            	</tr>
            </table>   
                    
            <c:forEach items="${run_course}" var="rc">
            <table id="tbo">
            <tr> 
                   <td class="td col1">${ rc.course_title}</td> 
	                <td class="td col2">${ rc.lecture_name}</td>
	                <td class="td col3">${ rc.student_count}</td>
	                
	                <td class="td col4"><a href="enrollController?action=View&course_id=${rc.course_id}&course_name=${rc.course_title}" class="action view">
	                View  <i class="fa-solid fa-arrow-up-right-from-square"></i></a>
	                </td>
	                
            </tr>
            </table>
            </c:forEach>
               </div>
	</div>
      
</body>
</html>
