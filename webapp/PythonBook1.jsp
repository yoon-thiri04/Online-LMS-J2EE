<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.util.List" %>
<%@page import="model.Lect" %>
<%@page import="dao.lectureDAO" import ="dao.courseDAO"
import="java.util.ArrayList" import="model.CourseInstructor"%>

<%

lectureDAO lecturerdao=new lectureDAO();
List<CourseInstructor> courses = new ArrayList<>();
courses = lecturerdao.get1("Python");
pageContext.setAttribute("lectd", courses,PageContext.PAGE_SCOPE);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Python</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


<script>
function loginFirst() {
	window.location.href="login.jsp";
}

</script>

<style>
 @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
 
*{

	margin: 0;
    padding: 0;
    border: none;
  	outline: none;
	text-decoration: none;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
	  
}
/*header*/
.header{
  	display: flex;
  	align-items: center;
  	justify-content: space-between;
  	height: 60px;
  	width:100%;
 	padding: 20px;
  	background: #387ADF;
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
    padding-right: 10px;
    line-height: 30px;
}

.header-icons .account ul li a:hover{
    color: orange;
}
/*Java Photo*/
#ja{
	background-image:url("python.jpg");
	background-repeat:no-repeat;
	background-size:100%;
	height:650px;
	
}
/*Java Text*/
#javatext{
	margin-left:150px;
	margin-right:800px;
	font-size:20px;
	color:white;
	padding-top:80px;
}
#javatext h1{
	font-size:150px;
	color:white;
}
/*cards*/
.mainmain{
    display: flex;
    flex-wrap: wrap;
    margin-left:60px;
}

.grid-container{
    
     flex: 0 0 calc(33.333% - 60px);
    margin-top:80px;
    margin-bottom:80px;
     
    
}

.grid-item{
	border: 2px solid white;
    box-shadow: 10px 4px 8px 0 rgba(0, 0, 0, 0.2), 2px 2px 2px 0 rgba(229, 194, 41, 0.264);
    border-radius: 15px 50px ;
    transition: all .3s cubic-bezier(.445, .05, .55, .95);
    background-image:url("yui.jpg");
    background-size:fixed;
    border: 1px solid #f0eded;
    transition: all 1s ease 0s;
    cursor: pointer;
   margin-right:50px;
    display:flex;
    
    
    width:660px;
}
.grid-item:hover{
    box-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
    border: 1px solid #111;
    transform: translateY(-3px);
}
.grid-item .title{
	margin-top:20px;
	margin-left:11px;
	margin-bottom:10px;
}
.grid-item table {
	padding-bottom:20px;
}
.grid-item table td{
	text-align:left;
	padding-left:10px;
}
}
.grid-item table{
	margin-bottom:10px;
	padding:20px;
	width:800px;
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
	margin-right:30px;
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
/*Enroll Button*/
.viewmaterial {
    padding: 10px 30px;
    color:black;
    text-decoration: none;
    border: 1px solid #999;
    border-radius: 4px;
    margin-bottom:20px;
    margin-left:30px;
    transition: all 0.3s ease 0s;
    background:white;
}

.viewmaterial:hover {
    color: #fff;
    background: #748dff;
    border: 1px solid #748dff;
}
</style>
</head>
<body>
<!-- Header -->
	<header class="header">
	    <div class="logo">
	      <a href="sourceHome.jsp"><b>Smart Learn</b></a>
	    </div>
	    
	    <div class="header-icons">
	    	<div class="account">
		        <ul>
	            	<li><a href="sourceHome.jsp">Home</a></li>
	                <li><a href="Courses.jsp">Courses</a></li>
	                <li><a href="login.jsp">Login</a></li>
	                <li><a href="sourceHome.jsp#aboutUs">About Us</a></li>
	            </ul>
	    	</div>
	    </div>
	</header>

    
<!-- About Java -->
    <div id="ja">
	    <div id="javatext">
	    	<h1>PYTHON</h1>
	    	<p>
	    		Python is a high-level, interpreted programming language known for its simplicity, readability, and versatility. It was created by Guido van Rossum and first released in 1991. Python emphasizes code readability and clarity, making it accessible to beginners while also being powerful enough for experienced developers.
	    	</p><br><br>
	    </div>
    </div>
   <div class="mainmain">
<%
try {
    // Establishing the connection
    Connection con = DBConnection.openConnection();
    
    // Query to get course IDs for category C#
    String courseQuery = "SELECT course_id FROM courses WHERE category='Python'";
    Statement courseStatement = con.createStatement();
    ResultSet courseResultSet = courseStatement.executeQuery(courseQuery);

    while (courseResultSet.next()) {
        int courseId = courseResultSet.getInt("course_id");
        
        // Query to get lecture information for each course
        String lectureQuery = "SELECT filename, name FROM lectures WHERE course_id=" + courseId;
        Statement lectureStatement = con.createStatement();
        ResultSet lectureResultSet = lectureStatement.executeQuery(lectureQuery);
        
        // Query to get course information for each course
        String courseQuery1 = "SELECT * FROM courses WHERE course_id=" + courseId;
        Statement courseStatement1 = con.createStatement();
        ResultSet courseResultSet1 = courseStatement1.executeQuery(courseQuery1);
        
        // Processing lectures for the current course
        while (lectureResultSet.next()) {
            String filename = lectureResultSet.getString("filename");
            String lectureName = lectureResultSet.getString("name"); // Storing name in variable
            
            // Processing course details
            if (courseResultSet1.next()) {
                String title = courseResultSet1.getString("title");
                String level = courseResultSet1.getString("level");
                String category = courseResultSet1.getString("category");
                String description = courseResultSet1.getString("description");
                String duration = courseResultSet1.getString("duration");
                String start_date=courseResultSet1.getString("start_date");
                String enroll_deadline=courseResultSet1.getString("enrollment_deadline");
               
%>
                <div class="grid-container">
                    <div id="b1" class="grid-item">
                        <div>
                            <img src="<%=filename%>" alt="Image">
                        </div>
                        <div>
                            <h2 class="title"><%=title%></h2>
                            <table>
                            	<tr>
                            		<td><b>Name:</b></td>
                            		<td><%=lectureName%></td>
                            	</tr>
                            	<tr>
                            		<td><b>Level:</b></td>
                            		<td><%=level%></td>
                            	</tr>
                            	<tr>
                            		<td><b>Category:</b></td>
                            		<td><%=category%></td>
                            	</tr>
                            	<tr>
                            	 <td><b>Start Date</b></td>
                            		<td><%=start_date%></td>
                            	</tr>
                            	<tr>
                            	 <td><b>Enroll Deadline</b></td>
                            		<td><%=enroll_deadline%></td>
                            	</tr>
                            	<tr>
                            		<td><b>Duration:</b></td>
                            		<td><%=duration%></td>
                            	</tr>
                            	<tr style="height:30px;">
                            		<td style="display:flex;"><b>Description:</b></td>
                            		<td><%=description%></td>
                            	</tr>
                            	
   
                            </table>
                            <div style="display:flex;align-item:center;gap:20px;">
                            	<button  class="viewmaterial" onclick="loginFirst()" type="button">Enroll</button>
                            </div>
                        </div>
                    </div>
                </div>
<%
            }
        }
       lectureResultSet.close();
        lectureStatement.close();
        courseResultSet1.close();
        courseStatement1.close();
    }
    
    courseResultSet.close();
    courseStatement.close();
    con.close();
    
} catch (Exception e) {
    out.println(e);
}
%>

</div>
</body>
</html>