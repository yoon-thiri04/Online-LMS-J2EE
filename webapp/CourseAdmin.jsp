<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.courseDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList" %>
<%@ page  import="java.util.List" %>
<%@ page import ="model.Course" import="dao.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%courseDAO coursedao=new courseDAO();
List<Course> courselist = new ArrayList<>();
courselist = coursedao.get();
pageContext.setAttribute("courselist", courselist,PageContext.PAGE_SCOPE); 
%>
<% 

session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
 
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Courses</title>
<script>
function toggleDescription(course_id) {
    var descriptionTruncated = document.getElementById("description_" + course_id);
    var fullDescription = document.getElementById("fullDescription_" + course_id);
    var toggleBtn = document.getElementById("toggleBtn_" + course_id);

    if (descriptionTruncated.style.display === "none") {
        descriptionTruncated.style.display = "inline";
        fullDescription.style.display = "none";
        toggleBtn.innerHTML = "Read more";
    } else {
        descriptionTruncated.style.display = "none";
        fullDescription.style.display = "inline";
        toggleBtn.innerHTML = "Read less";
    }
}
</script>
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

</head>
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
body {
   background-color:#DDF2FD;
   color:black;
   
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
	margin-left:250px;
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
#tbo td .edit:hover{
	color:blue;
}
#tbo td .delete:hover{
	color:red;
}
.fa-pen-to-square,.fa-trash{
	font-size:20px;
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
	border-radius:10px;
}
#Addbtn h3{
	color:white;
}
/*Table*/
.col1{
	width:250px;
	padding: 5px 5px;
}
.col2{
	width:140px;
}
.col3{
	width:140px;
}
.col4{
	width:300px;
}
.col5{
	width:250px;
	padding:0 5px;
}
.col6{
	width:160px;
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
      <a href="#"><b>Smart Learn</b></a>
    </div>
    <div class="header-icons">
    	<div class="account">
	        <i class="fa-solid fa-circle-user"></i>
	        <h3><%=username %></h3>
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
		<h2>Courses</h2>
		<div id="Addbtn">
			<a href="courseAdd.jsp" class="btn">
				<h3>Add</h3><i class="fa-solid fa-arrow-up-from-bracket"></i>
	    	</a>
	    </div>
    </div>
	
<div id="alltable">
        	<table id="tablehead">
            	<tr>
	                <td class="th col1"><h3>Course Name</h3></td>
	                <td class="th col2"><h3>Level</h3></td>
	                <td class="th col3"><h3>Category</h3></td>
	                <td class="th col4"><h3>Description</h3></td>
	                <td class="th col5"><h3>Duration</h3></td>
	                
	                <td class="th col6"><h3>Action</h3></td>
            	</tr>
            </table>            
             <c:forEach items="${courselist}" var="course">
            <table id="tbo">
            <tr> 
                    <td class="td col1">${course.title}</td>
	                <td class="td col2">${course.level}</td>
	                <td class="td col3">${course.category }</td>
	                <td class="td col4">
		        	<span id="description_${course.course_id}" class="description-truncated">
		            	${fn:substring(course.description, 0, 30)}... 
		               	<button onclick="toggleDescription('${course.course_id}')" id="toggleBtn_${course.course_id}" class="readmore">Read more</button>
		            </span>
		            <span id="fullDescription_${course.course_id}" class="description-full" style="display:none;">
		            	${course.description}
		            	<button onclick="toggleDescription('${course.course_id}')" class="readless">Read less</button>
		            </span>
		        </td>
	               
	                <td class="td col5">${course.duration}</td>
	                <td class="td col6"> 
	                <a href = "${pageContext.request.contextPath}/coursesController?action=EDIT&course_id=${course.course_id}" class="action edit">
	                Edit <i class="fa-solid fa-pen-to-square"></i></a> 
					<a href = "${pageContext.request.contextPath}/coursesController?action=DELETE&course_id=${course.course_id}"  class="action delete">
					Delete <i class="fa-solid fa-trash"></i></a>
				    
	       
                </td>
            </tr>
            </table>
            </c:forEach>
               </div>
    
</body>
</html>