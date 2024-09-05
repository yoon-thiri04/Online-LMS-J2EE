<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConnection" %>
<%@page import="java.util.List" %>
<%@page import="model.Lect" %>
<%@page import="dao.*" import ="dao.courseDAO"
import="java.util.ArrayList" import="model.CourseInstructor"%>

<%

lectureDAO lecturerdao=new lectureDAO();
List<CourseInstructor> courses = new ArrayList<>();
courses = lecturerdao.get1("PHP");
pageContext.setAttribute("lectd", courses,PageContext.PAGE_SCOPE);
session = request.getSession(); 
String userEmail = (String) session.getAttribute("stuEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PHP</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />

    <!-- Initialize AOS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

    <script>
        // Initialize AOS when the page is loaded
        document.addEventListener('DOMContentLoaded', function() {
            AOS.init({
                duration: 1000, // Animation duration in milliseconds
                once: true, // Whether animation should happen only once
            });
        });
    </script>

<script>
function enroll(course_id) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "${pageContext.request.contextPath}/DivClickServlet?course_id="+course_id, true);
    xhr.send();

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var deadlineReached = xhr.responseText.trim(); 
            if (deadlineReached==="true") {
              alert("Enrollment Deadline is reached!Wait for another batch or choose other courses.");
            } else {
                window.location.href="enrollform.jsp?course_id="+course_id;
            }
        }
    };
}
function view(course_id) {
      window.location.href="Material.jsp?course_id="+course_id;
           
}
</script>

<style>
 @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
*{
    margin:0;
    padding:0;
    box-sizing: border-box;
    outline: none; border:none;
    text-decoration: none;
    text-transform: capitalize;
    transition: .2s linear;
   font-family: Poppins, Helvetica, sans-serif;
}
body{
background:#E6E6E6;
}
/*header*/

/*header*/
.header{
	
  	display: flex;
  	align-items: center;
  	justify-content: space-between;
  	height: 60px;
  	width:100%;
 	padding: 20px;
  	background:#164863;
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

/*Java Photo*/
#ja{
	background-image:url("https://miro.medium.com/v2/resize:fit:1000/1*k3oLLdI3ApiJXpmGAdrdhQ.jpeg");
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
.mainmain{
    display: flex;
    flex-wrap: wrap;
    margin-left:60px;
}
.grid-container{
    flex: 0 0 calc(33.333% - 60px);
    margin-top:30px;
    margin-bottom:50px;
    margin-left:100px;
    color:#000;
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
    margin-bottom:10px;
    padding-bottom:20px;
    height:320px;
}
.grid-item:hover{
    box-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
    border: 1px solid #111;
    translate: -0px -5px ;
}
.grid-container .enrollBTN {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding:15px 50px 20px 0;
}
.title{
	color:#000;
}
.grid-item table td{
	text-align:left;
	font-size:16px;
	padding-bottom:5px;
	padding:5px 0;
}
.grid-item .table1{
	width:500px;
}
.grid-item .table1 .2nd{
	background-color:yellow;
	
}
.grid-item .table2{
	margin-left:50px;
	width:550px;
}
.grid-item .description{
	text-align: justify;
	margin-left:50px;
}
.grid-item table .table1firstcol{
	width:130px;
}
.grid-item table .table2firstcol{
	width:100px;
}
img{
	width:200px;
	height:200px;
	border-radius:100px;
	margin-top:30px;
	margin-left:30px;
	margin-right:30px;
}
/*view materials Button*/
.viewmaterial {
    padding: 10px 30px;
    color:#fff;
    font-size:16px;
    text-decoration: none;
    border: 1px solid #427D9D;
    border-radius: 4px;
    margin-left:30px;
    transition: all 0.3s ease 0s;
    background:#427D9D;
}
.viewmaterial:hover {
    color: black;
    background:white;
    border: 1px solid #14279B;
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
.available {
	text-align:center;
	padding-top:30px;
	 margin: 0 auto;
}</style>

</head>
<body>
<!-- Header -->
	<header class="header">
	    <div class="logo">
     <a href="sourceLogin.jsp"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a>
     </div>
	  <div class="header-icons">
	    	<div class="account">
		        <ul>
	            	<li><a href="sourceLogin.jsp">Home</a></li>
	                <li><a href="CoursesLogin.jsp">Course</a></li>
	                <li><a href="sourceLogin.jsp#ourfaq">FAQ</a></li>
	                <li><a href="login.jsp">Log Out</a></li>
	            </ul>
	            
	    	</div>
	    	<div class="profile">
		        <a href="student1.jsp"><i class="fa-solid fa-circle-user"></i></a>
		        <h3><%= username %></h3>
		    </div>
	    </div>
	</header>
	  
<!-- About Java -->
    <div id="ja">
	    <div id="javatext">
	    	<h1>PHP</h1>
	    	<p>
	    		PHP is a popular, high-level programming language developed by Sun Microsystems (which was later acquired by Oracle Corporation). It was first released in 1995 and has since become one of the most widely used programming languages in the world.
	    	</p><br><br>
	    </div>
    </div>
   <div class="mainmain">
    <div class="available">
	<h1>Available courses</h1>
	</div>
   
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
                String start_date=courseResultSet1.getString("start_date");
                String enroll_deadline=courseResultSet1.getString("enrollment_deadline");
                // Displaying lecture and course information
%>

               
              <%
boolean enrollExists = false;
PreparedStatement statement = null;
ResultSet resultSet = null;
Connection connection=DBConnection.openConnection();

try {
    String query = "SELECT EXISTS (SELECT 1 FROM enrollment WHERE email = ?  AND course_id = ?)";
    statement = connection.prepareStatement(query);
    statement.setString(1, userEmail);
    statement.setInt(2,courseId);
    resultSet = statement.executeQuery();

    if (resultSet.next()) {
       enrollExists= resultSet.getBoolean(1);
    }
    
    
} finally {
   
    if (resultSet != null) {
        resultSet.close();
    }
    if (statement != null) {
        statement.close();
    }
}
pageContext.setAttribute("enrollExists",enrollExists);

%>
            <div class="grid-container">
    <div id="b1" class="grid-item" data-aos="fade-up">
        <div>
            <img src="<%=filename %>" alt="Image">
        </div>
        <div>
            <div class="enrollBTN">
                <h2 class="title"><%=title %><i class="fa-solid fa-code"></i></h2>
                <c:choose>
                    <c:when test="${not enrollExists}">
                        <div>
                            <button class="viewmaterial" onclick="enroll(<%= courseId %>)" type="button">Enroll</button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div>
                            <button class="viewmaterial" onclick="view(<%= courseId %>)" type="button">View</button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div style="margin-left:0px;margin-right:40px;width:880px;">
                <div style="display:flex;">
                    <table class="table1">
                        <tr>
                            <td class="table1firstcol"><b>Instructor</b></td>
                            <td class="2nd"><%=lectureName %></td>
                        </tr>
                        <tr>
                            <td class="table2firstcol"><b>Level</b></td>
                            <td class="2nd" ><%=level %></td>
                        </tr>
                        <tr>
                            <td class="table2firstcol"><b>Start Date</b></td>
                            <td class="2nd" ><%=start_date%></td>
                        </tr>
                        <tr>
                            <td class="table1firstcol"><b>Enroll Deadline</b></td>
                            <td class="2nd" ><%=enroll_deadline%></td>
                        </tr>
                        <tr>
                            <td class="table2firstcol"><b>Duration</b></td>
                            <td class="2nd" ><%=duration%></td>
                        </tr>
                    </table>
                    <div style="width:700px;">
                        <table class="table2">
                            <tr>
                                <td class="table2firstcol" style="display:flex;"><b>Description</b></td>
                                <td class="22nd" style="line-height:1.5;text-align:justify;"><%=description%></td>
                            </tr>
                        </table>
                    </div>
                </div>
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