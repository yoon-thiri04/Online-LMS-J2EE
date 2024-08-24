<%@ page import="java.sql.*" import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.lectureDAO"
import="java.util.*" import="model.*" import="util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
  %>
  <%lectureDAO lectdao=new lectureDAO();
  List<Lect> lectList = lectdao.get();
pageContext.setAttribute("lectlist", lectList,PageContext.PAGE_SCOPE); 
%>
<!DOCTYPE html>
<html>
<head>
<script>
  function show(){
    var a=confirm("Are you sure to delete?");
    if(a==true){
      document.write("");
    }
    else{
      document.write("");
    }
  }
</script>
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
body {
   background-color:#DDF2FD;
   color:black;
   font-family: 'Quicksand', sans-serif;
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
  	background: #427D9D;
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

/*Table Title*/
#title{
	height:60px;
	width:1250px;
	margin-left:250px;
	margin-top:10px;
	display:flex;
	align-items:center;
}
/*table head*/
#alltable{
	margin-left:270px;
}
#tablehead .th{
	border:2px solid black;
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
	border:2px solid black;
}
#tbo td .delete{
  display:inline-block;
  padding:5px;
  border-radius:5px;
  border:2px solid black;
  background-color:#164863;
  margin-right:3px;
  color:white;
  transition: all 0.3s ease 0s;
}

/*Add button*/
.btn{
	width:210px;
	height:70px;
	color:black;
	display:flex;
	align-items:center;
	transition: all 0.5s ease 0s;
}
.btn i{
	font-size:20px;
	margin-left:10px;
	color:white;
}
#Addbtn{
	display:flex;
	align-items:center;
	margin-left:1050px;
	margin-top:20px;
	margin-bottom:25px;
	background-color:#427D9D;
	height:40px;
	width:90px;
	padding-left:5px;
	padding-right:5px;
	border:1px solid black;
	transition: all 0.5s ease 0s;
	border-radius:20px;
}
#Addbtn h3{
	color:white;
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
	        <i class="fa-solid fa-circle-user"></i>
	        <h3><%= username %></h3>
    	</div>
    </div>
  </header>
 
  <div style="height:60px;">------------</div>
  <div class="sidebar">
	    	<ul>
				<li><a href="Admin.jsp"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
			    <li><a href="CourseAdmin.jsp"><i class="fa-solid fa-book-open"></i>Courses</a></li>
			    <li><a href="lectures.jsp"><i class="fa-solid fa-chalkboard-user"></i>Lecturers</a></li>
			    <li><a href="AdminUserlist.jsp"><i class="fa-solid fa-users"></i>Register Users</a></li>
				<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
			</ul>
		</div>
	<div id="title">
		<h2>Lectures</h2>
		<div id="Addbtn">
			<a href="LecturesAddForm.jsp" class="btn">
				<h3>Add</h3><i class="fa-solid fa-user-plus"></i>
	    	</a>
	    </div>
    </div>
    <div id="alltable">
        <table id="tablehead">
            <tr>
                <td class="th" style="width:160px;"><h3>Name</h3></td>
                <td class="th" style="width:70px;"><h3>Photo</h3></td>
                <td class="th" style="width:240px;"><h3>Email</h3></td>
                <td class="th" style="width:180px;"><h3>Qualification</h3></td>
                <th class="th" style="width:230px;"><h3>Course Title</h3></th>
                <th class="th" style="width:230px;"><h3>Started On</h3></th>
                <th class="th" style="width:230px;"><h3>Enrollment Deadline</h3></th>
                <td class="th" style="width:140px;"><h3>Action</h3></td>
            </tr>
            
            <c:forEach items="${lectlist}" var="lect">
            <table id="tbo">
            <tr>
                <td style="width:160px;">${lect.name}</td>
                <td style="padding-top:5px;width:70px;"><img src="${lect.filename}" width="51" height="50"/></td>
               
                <td style="width:240px;">${lect.email}</td>
                <td style="width:180px;">${lect.qualification }</td>
                <c:set var="course_id" value="${lect.course_id}"></c:set>
                 <% int course_id = (Integer)pageContext.getAttribute("course_id");
    				  
    				  String course_name=null;
    				  String start_date=null;
    				  String enrollment_deadline=null;
                      String sql= "select title,start_date,enrollment_deadline from courses where course_id="+course_id;
	                  Connection connection = DBConnection.openConnection();
	                  Statement statement = connection.createStatement();
	                  ResultSet resultSet = statement.executeQuery(sql);
                      if(resultSet.next()){
	                  course_name=resultSet.getString("title");
	                  start_date=resultSet.getString("start_date");
	                  enrollment_deadline=resultSet.getString("enrollment_deadline");
    }
%>
                <td style="width:230px;"><%= course_name %></td>
                <td style="width:230px;"><%= start_date %></td>
                <td style="width:230px;"><%= enrollment_deadline %></td>
                <td style="width:140px;">
                	<a href="${pageContext.request.contextPath}/lecturersController?action=EDIT&email=${lect.email}&courseName=<%=course_name%>" class="delete"><b>Edit</b></a>
                	<a href="${pageContext.request.contextPath}/DeleteLectureServlet?action=DELETE&email=${lect.email}"  class="delete"><b>Delete</b></a>
                </td>
            </tr>
            </table>
            </c:forEach>
            </table>
           
    </div>
</body>
</html>
