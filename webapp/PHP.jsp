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
<%@page import="dao.*" import ="dao.courseDAO"
import="java.util.ArrayList" import="model.CourseInstructor"%>

<%
session = request.getSession(); 
String userEmail = (String) session.getAttribute("stuEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
lectureDAO lecturerdao=new lectureDAO();
List<CourseInstructor> courses = new ArrayList<>();
courses = lecturerdao.get1("PHP");
pageContext.setAttribute("lectd", courses,PageContext.PAGE_SCOPE);

/*String s_name=lecturerdao.getName(name);
pageContext.setAttribute("s_name",s_name,PageContext.PAGE_SCOPE);
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>C++</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


<script>
function enroll(course_id,email) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "${pageContext.request.contextPath}/DivClickServlet?course_id="+course_id+"&email="+email, true);
    xhr.send();

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var enrolled = xhr.responseText.trim(); 
            
            
           
            
            if (enrolled==="true") {
                window.location.href="Material.jsp?course_id="+course_id;
            } else {
                window.location.href="enrollform.jsp?course_id="+course_id;
            }
        }
    };
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
  	background: #427D9D;
  	box-shadow: 0px 0px 10px 0px grey;
  	color:white;
}

.header b{
	font-size:30px;
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

.header-icons .account ul{
  display: flex;
  align-items: center;
  gap:40px;
}

.header-icons .account ul li{
	list-style-type: none;
}

.header-icons .account ul li a{
    color: #c5c2c2;
    text-decoration: none;
    font-size: 17px;
    padding-top: 20px;
    padding-bottom: 10px;
    padding-left: 10px;
    padding-right: 10px;
    line-height: 30px;
}

.header-icons .account ul li a:hover{
    color: #FFFFFF;
}
/*Java Photo*/
#ja{
	background-image:url("C++.jpg");
	background-repeat:no-repeat;
	background-size:100%;
	height:600px;
	
}
/*Java Text*/
#javatext{
	margin-left:150px;
	margin-right:800px;
	font-family:calibri;
	font-size:20px;
	color:white;
	padding-top:80px;
}
#javatext h1{
	font-size:150px;
	color:white;
}
/*cards*/
.grid-container{
    /*display: grid;
    grid-template-columns: 450px;*/
    display:flex;
    align-items:center;
    justify-content:center;
    grid-gap: 40px;
    /*margin-left:350px;
    margin-right:100px;*/
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
    /*text-decoration:none;*/
    display:flex;
    /*margin-bottom:90px;
    margin-top:30px;*/
    padding-right:20px;
    width:1000px;
}
.grid-item:hover{
    box-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
    border: 1px solid #111;
    transform: translateY(-3px);
}
.grid-item .title{
	margin-top:20px;
	margin-left:11px;
}
.grid-item table {
	padding-bottom:20px;
}
.grid-item table td{
	text-align:left;
	padding-left:10px;
}
	padding-right:30px;
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
	width:200px;
	height:200px;
	border-radius:100px;
	margin-top:30px;
	margin-left:20px;
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
.enrollbtn{
	width:80px;
	height:30px;
	color:black;
	background-color:orange;
	border-radius:12px;
	margin-left:80px;
	margin-top:10px;
	magin-bottom:10px;
	border:1px solid green;
	background-image: linear-gradient(144deg,#AF40FF, #5B42F3 50%,#00DDEB);
	color: #FFFFFF;
	cursor: pointer;
	font-family: Phantomsans, sans-serif;
	font-size: 15px;
}

</style>
</head>
<body>
<!-- Header -->
	<header class="header">
	    <div class="logo">
	      <a href="sourceHomeLogin.jsp"><b>Smart Learn</b></a>
	    </div>
	    
	    <div class="header-icons">
	    	<div class="account">
	    	    <ul>
	            	<li><a href="sourceHomeLogin.jsp">Home</a></li>
	                <li><a href="CoursesLogin.jsp">Courses</a></li>
	                <li><a href="sourceHome.jsp"></a>Log out</li>
	                <li><a href="sourceHomeLogin.jsp#aboutUs">About Us</a></li>
	               <div class="profile">
		        <a href="student1.jsp"><i class="fa-solid fa-circle-user"></i></a>
		        <h4><%= username %></h4>
		    </div>
	            </ul>
		       
	    	</div>
	    </div>
	</header>

    
<!-- About Java -->
    <div id="ja">
	    <div id="javatext">
	    	<h1>PHP</h1>
	    	<p>
	    		 PHP is a popular server-side scripting language designed for web development. It is widely used to create dynamic web pages and can be embedded into HTML. PHP is known for its simplicity and flexibility, making it easy to learn for beginners and powerful enough for experienced developers. With a vast community and extensive documentation, PHP is a great choice for building websites and web applications.
</p><br><br>
	    </div>
    </div>
   <div class="mainmain">
<%
try {
    // Establishing the connection
    Connection con = DBConnection.openConnection();
    
    // Query to get course IDs for category C#
    String courseQuery = "SELECT course_id FROM courses WHERE category='PHP'";
    Statement courseStatement = con.createStatement();
    ResultSet courseResultSet = courseStatement.executeQuery(courseQuery);

    while (courseResultSet.next()) {
        int courseId = courseResultSet.getInt("course_id");
        
        // Query to get lecture information for each course
        String lectureQuery = "SELECT filename, name FROM lectures WHERE course_id=" + courseId;
        Statement lectureStatement = con.createStatement();
        ResultSet lectureResultSet = lectureStatement.executeQuery(lectureQuery);
        
        // Query to get course information for each course
        String courseQuery1 = "SELECT title, level, category, description, duration FROM courses WHERE course_id=" + courseId;
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
         
                // Displaying lecture and course information
%>
                <div class="grid-container">
                    <div id="b1" class="grid-item">
                        <div style="margin-bottom:20px;">
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
                            		<td><b>Duration:</b></td>
                            		<td><%=duration%></td>
                            	</tr>
                            	<tr style="height:30px;">
                            		<td style="display:flex;"><b>Description:</b></td>
                            		<td><%=description%></td>
                            	</tr>
                            	
   
                            </table>
                            <div style="display:flex;align-item:center;gap:20px;">
                            	<button  class="viewmaterial" onclick="enroll(<%= courseId %>,'${stuEmail}')" type="button">Enroll</button>
                            </div>
                        </div>
                    </div>
                </div>
<%
            }
        }
        
        // Closing result sets and statements for lectures and courses
        lectureResultSet.close();
        lectureStatement.close();
        courseResultSet1.close();
        courseStatement1.close();
    }
    
    // Closing result set and statement for courses
    courseResultSet.close();
    courseStatement.close();
    
    // Closing the database connection
    con.close();
    
} catch (Exception e) {
    out.println(e);
}
%>
</div>
</body>
</html>