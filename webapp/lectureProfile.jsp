<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*" %>
<%@ page import="model.EnrollStudent" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DBConnection" import ="java.sql.Connection" import="java.sql.*" %>
<% 
    // Retrieve the username from the session attribute 
    session = request.getSession(); 
    String userEmail = (String) session.getAttribute("userEmail"); 
    lectureDAO udao=new lectureDAO();
    String username=udao.getNameLecture(userEmail);
%>
<% 
   int course_id=(int) session.getAttribute("course_id");
    EnrollStudentDAO edao=new EnrollStudentDAO();
    List<EnrollStudent> stu = edao.get_enroll(course_id);
    pageContext.setAttribute("stuList",stu,PageContext.PAGE_SCOPE);
%>
<% int tot=0;
String sql= "select count(*) as total1 from enrollment where course_id="+course_id;
	Connection connection = DBConnection.openConnection();
	Statement statement = connection.createStatement();
	ResultSet resultSet = statement.executeQuery(sql);
    if(resultSet.next()){
	tot =resultSet.getInt("total1");
    }
%>

<% int mat=udao.material_count(course_id);
    
   int quiz=0;
   String sql_q= "select count(*) as quiz from quiz where course_id="+course_id;
	Connection connection_q = DBConnection.openConnection();
	Statement statement_q = connection_q.createStatement();
	ResultSet resultSet_q = statement_q.executeQuery(sql_q);
   if(resultSet_q.next()){
	quiz=resultSet_q.getInt("quiz");
   }
   int assignment=0;
   PreparedStatement preparedStatement = null;
   String sql_assign = "SELECT count(*) as assignment FROM material where course_id=? and m_type = 'Assignment' ";
   Connection connection_as = DBConnection.openConnection();
    preparedStatement = connection_as.prepareStatement(sql_assign);
   preparedStatement.setInt(1,course_id);
   
   ResultSet resultSet_as = preparedStatement.executeQuery(); 
   
   while(resultSet_as.next()){
	assignment=resultSet_as.getInt("assignment");
   }
%>
<%
	String filename="";
	String email="";
	String quali="";
	String l_name="";
	String password="";
	String path="";
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004");
	    Statement st = con.createStatement();
	    String sql2 = "select * from lectures where course_id="+course_id;
	    ResultSet rs = st.executeQuery(sql2);
	    while (rs.next()) {
	         password = rs.getString("password");
	         email = rs.getString("email");
	         quali = rs.getString("qualification");
	         filename= rs.getString("filename");
	         path = rs.getString("path");
	       
	    } }catch (Exception e) {
	        e.printStackTrace();
	        
	    }
%>

<%
	String category="";
	String c_name="";
	
	try {
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004");
		 String sql3 = "select * from courses where course_id="+course_id;
		
		Statement statement2 = con2.createStatement();
		ResultSet resultSet2 = statement2.executeQuery(sql3);
		while(resultSet2.next()) {
			c_name=resultSet2.getString("title");
		    category=resultSet2.getString("category");
		
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Instructor</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<style> @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
*{
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: Poppins, Helvetica, sans-serif;
  
}
body {
    background-color: #DDF2FD;
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

/* Main Body Section */
.main-body{
	margin-top:50px;
	margin-left:50px;
	padding-bottom:30px;
	display:grid;
	grid-template-columns:300px 300px;
	gap:50px;
	height:150px;
}
#body{
	display:flex;
}
.card-single{
	display:flex;
	justify-content:space-between;
	background:#fff;
	padding:2rem;
	border-radius:15px;
	cursor:pointer;
	transition: all 0.3s;
	height:130px;
}
.card-single div:last-child span{
	font-size:3rem;
	color:#427D9D;
}
.card-single div:first-child span,h1{
	color:#427D9D;
	padding-bottom:3px;
}
.card-single:hover {
	background-color:#427D9D;
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


.container{
	margin-left:330px;
	display:flex;
	align-item:center;
	margin-top:30px;
}
.card {
  border-radius: 0.8em;
  background-color: #fefefe;
  box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.02),
    0 6.7px 5.3px rgba(0, 0, 0, 0.028), 0 12.5px 10px rgba(0, 0, 0, 0.035),
    0 22.3px 17.9px rgba(0, 0, 0, 0.042), 0 41.8px 33.4px rgba(0, 0, 0, 0.05),
    0 100px 80px rgba(0, 0, 0, 0.07);
  position:;
  width:380px;
  align-item:center;
  padding-right:2em;
  padding-left:2em;
  padding-bottom:0.3em;
  color:black;
}

.card:after {
  content: "";
  position: absolute;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background-color: var(--small-green-circle);
  border: 2px solid white;
}
.card__text p{
	padding:15px;
	border:1px solid black;
	margin-bottom:1em;
	margin-top:0.3em;
}
.card__text label{
	font-size:15px;
}
.card__image {
  width: 100px;
  border-radius: 50%;
  margin-left:110px;
  
}
.card__text h2 {
	margin-top:0.1em;
  margin-bottom: 0.3em;
  font-size: 1.4em;
  color: /*#6f6f6f*/#14279B;
	text-align:center;
}
@media (min-width: 425px) {
	.card {
		padding-top: 1.5em;
	}
	.card:after {
	    top: 192px;
	    right: 970px;
	}
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
	        	<h3><%= username %></h3>
	      	</div>
	    </div>
	</header>
	<div style="height:60px;">---------------</div>
	<div class="sidebar">
    	 <ul>
      <li><a href="#"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
          <li><a href="MaterialLecture.jsp"><i class="fa-solid fa-book-open"></i>Course Materials</a></li>
          <li><a href="AssignmentLecture.jsp"><i class="fa-solid fa-book-open"></i>Assignment</a></li>
          
          <li><a href="QuizLecture.jsp"><i class="fa-solid fa-book-open"></i>Quiz</a></li>
          
          <li><a href="EnrollStudent.jsp"><i class="fa-solid fa-users"></i>Students</a></li>
          <li><a href="AnnouncementLecture.jsp"><i class="fa-solid fa-bullhorn"></i>Announcements</a></li>
          <li><a href="SubmissionAllLecture.jsp"><i class="fa-solid fa-book-open"></i>Submissions</a></li>
          <li><a href="QuizResultAllLecture.jsp"><i class="fa-solid fa-book-open"></i>Quiz Result</a></li>
            <li><a href="changePwdLecture.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
        <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
      </ul>
	</div>
<div id="body">
<div class="container">
		<div class="card">
			<img src="<%=filename%>" width="103" height="100" class="card__image" />
			<div class="card__text">
				<h2><%=username %></h2>
				<label>Email</label><br>
				<p><%=email %></p>
				<label>Qualification</label>
				<p><%=quali %></p>
				<label>Category</label>
				<p><%=category %></p>
				<label>Course Name</label>
				<p><%=c_name %></p>
			</div>
	    	
		</div>
	</div>
	<div class="main-body">
		<div class="card-single">
    			<div>
    				<h1><%=tot%></h1>
    				<span>EnrolledStudents</span>
    			</div>
    			<div>
    				<span class="fa-solid fa-users"></span>
    			</div>
    	</div>
	    <div class="card-single">
    			<div>
    				<h1><%=mat%></h1>
    				<span>Course Materials</span>
    			</div>
    			<div>
    				<span class="fa-solid fa-book-open"></span>
    			</div>
    	</div>
    	<div class="card-single">
    			<div>
    				<h1><%=assignment%></h1>
    				<span>Total Assignments</span>
    			</div>
    			<div>
    				<span class="fa-solid fa-book-open"></span>
    			</div>
    	</div>
    	<div class="card-single">
    			<div>
    				<h1><%=quiz%></h1>
    				<span>Total Quizzes</span>
    			</div>
    			<div>
    				<span class="fa-solid fa-book-open"></span>
    			</div>
    	</div>
    	
</div>	
</div>
</body>
</html>
