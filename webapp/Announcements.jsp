<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.DBConnection"
    import="java.sql.Connection" 
    import="java.sql.*" import="model.Announcement" import="dao.UserDAO" import="dao.announceDAO" import="java.util.*"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
    String title="";
    String userEmail = (String) session.getAttribute("stuEmail");
    UserDAO udao=new UserDAO();
    String username=udao.getName(userEmail);
    int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
    Connection connection=DBConnection.openConnection();
    String sql = "SELECT title FROM courses WHERE course_id = ?";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setInt(1, course_id);
 
    ResultSet resultSet = statement.executeQuery();

    if(resultSet.next()) {
       
         title = resultSet.getString("title");
      } else {
        System.out.println("No course found with course_id " + course_id);
    }
    announceDAO andao=new announceDAO();
    List<Announcement> announce=andao.getfor(course_id);
   
    
    pageContext.setAttribute("aList", announce,PageContext.PAGE_SCOPE);
   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Announcements Students</title>
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
  background:#E6E6E6;
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
.main-body{
  width: 83%;
}
.block{
	background-color:white/*#71c7ec*/;
	height:150px;
	width:900px;
	border-radius:30px;
	margin-left:auto;
	margin-right:auto;
	margin-top:15px;
	margin-bottom:20px;
	box-shadow: 0px 0px 5px 0px #6B6B6B;
	transition: all .4s ease;
}
.block:hover{
	box-shadow: 0 26px 58px 0 rgba(0, 0, 0, .22), 0 5px 14px 0 rgba(0, 0, 0, .18);
}

.block .assign{
	
	display:inline-block;
	margin-top:20px;
	margin-left:40px;
	margin-right:30px;
	font-size:20px;
	width:500px;
  	white-space: nowrap; /* Prevents text from wrapping to the next line */
  	overflow: hidden; /* Hides the overflow text */
  	text-overflow: ellipsis;
  	padding-right:20px;
}
.block p{
	margin-left:40px;
	margin-top:5px;
}
h1{
margin-left:320px;
margin-top:10px;
}
.container{
margin-top:40px;
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
	<div class="sidebar">
		<ul>
			 <li><a href="student1.jsp"><i class="fa-solid fa-link"></i>Enrolled Courses</a></li>
      <li><a href="Material.jsp?course_id=<%=course_id%>"><i class="fa-solid fa-calendar-week"></i>Course Materials</a></li>
      <li><a href="Assignment.jsp"><i class="fa-solid fa-calendar-week"></i>Assignment</a></li>
       <li><a href="QuizStudent.jsp"><i class="fa-solid fa-calendar-week"></i>Quiz</a></li>
      <li><a href="Announcements.jsp"><i class="fa-solid fa-bullhorn"></i>Announcements</a></li>
      <li><a href="changePwd.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
      <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
    </ul>
	</div>
   <div class="container">
	<c:forEach items="${aList}" var="al">
	 <div class="block">
		<table style="width:800px;">
			<tr>
				<td>
					<div class="assign">
						<b>${al.title}</b>
						</div>
						<p>Content : ${al.content}</p>
					<p>Date : ${al.date}</p>
					
				</td>
			<tr>
		</table>
	</div>
    </c:forEach>
      </div>           
</body>
</html>