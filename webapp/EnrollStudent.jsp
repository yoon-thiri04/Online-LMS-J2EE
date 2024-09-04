<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.EnrollStudentDAO" import="dao.*"%>
<%@ page import="model.EnrollStudent" %>
<%@ page import="java.util.List" %>
<% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);%>
<%
   	int course_id=(int) session.getAttribute("course_id");
    EnrollStudentDAO edao=new EnrollStudentDAO();
    List<EnrollStudent> stu = edao.get_enroll(course_id);
    pageContext.setAttribute("stuList",stu,PageContext.PAGE_SCOPE); 
    int total=stu.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enroll Students</title>
</head>
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
 font-family: Poppins, Helvetica, sans-serif;
}
body{
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
/*Main body*/
#title{
	height:60px;
	width:1250px;
	margin-left:300px;
	margin-top:10px;
	display:flex;
	align-items:center;
}
/*table head*/
#alltable{
	margin-left:300px;
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

#tbo td .delete:hover{
	color:red;
}
.fa-pen-to-square,.fa-trash{
	font-size:20px;
}

/*Table*/
.col1{
	width:250px;
	padding:10px 10px;
}
.col2{
	width:300px;
}
.col3{
	width:260px;
}
.col4{
	width:260px;
}
.col5{
	width:250px;
	
}

table, th, td{
	border: 0.1px solid black;
	border-collapse: collapse;
}
.empty{
  margin: 0 auto;
  margin-top:10%;
  background-color:#DDF2FD;
  width:29%;
  height:280px;
 
}
.empty img{
width:270px;
height:210px;
margin-top:10px;
margin-left:80px;
 img-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
}
.empty img,p{

text-align:center;
}

    </style>
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
	<div style="height:60px;">------------</div>
    <div class="sidebar">
        <ul>
         <li><a href="lectureProfile.jsp"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
          <li><a href="MaterialLecture.jsp"><i class="fa-solid fa-calendar-week"></i>Course Materials</a></li>
          <li><a href="AssignmentLecture.jsp"><i class="fa-solid fa-calendar-week"></i>Assignment</a></li>
          <li><a href="QuizLecture.jsp"><i class="fa-solid fa-calendar-week"></i>Quiz</a></li>
          <li><a href="EnrollStudent.jsp"><i class="fa-solid fa-users"></i>Students</a></li>
          <li><a href="AnnouncementLecture.jsp"><i class="fa-solid fa-bullhorn"></i>Announcements</a></li>
          <li><a href="SubmissionAllLecture.jsp"><i class="fa-solid fa-book-open"></i>Submissions</a></li>
          <li><a href="QuizResultAllLecture.jsp"><i class="fa-solid fa-book-open"></i>Quiz Result</a></li>
          <li><a href="changePwdLecture.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
        <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
     </ul>
  </div>
  <%if (total==0){ %>
  <div class="empty">
	 <img src="logrem.png" />
	 <p>Opps! There is no enrolled students yet. <i class="fa-solid fa-feather"></i></p>
	 
	 </div>
  <% }else{ 
  %>
	 <div id="title">
		<h2>Enrolled Students</h2>
		
    </div>
	
  
    <div id="alltable">
        	<table id="tablehead">
            	<tr>
	               
	                <td class="th col1"><h3>User Name</h3></td>
	                <td class="th col2"><h3>Email </h3></td>
	                <td class="th col3"><h3>Enrollment Date</h3></td>
                    <td class="th col3"><h3>Action</h3></td>
            	</tr>
            </table>            
           <c:forEach items="${stuList}" var="stu">   

            <table id="tbo">
            <tr> 
                    
	                <td class="td col1">${stu.name}</td>
	                <td class="td col2">${stu.email}</td>
	                <td class="td col3">${stu.date}</td>
	                
	              
	                <td class="td col4">
	                <a href="${pageContext.request.contextPath}/enrollController?action=Delete&email=${stu.email}"  class="action delete">
                    Delete <i class="fa-solid fa-trash"></i></a>
	                             
                   </td>
	                
            </tr>
            </table>
            </c:forEach>
               </div>
	<%} %>
	
</body>
</html>