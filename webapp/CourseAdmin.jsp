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
<span style="font-family: verdana, geneva, sans-serif;">
    
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
 max-width:9000px;
  margin-left:270px;
  margin-right:20px;
  padding-bottom:50px;
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
  margin-left:270px;
  text-align:center;
  background-color:white;
}
#tbo td{
  background-color:white;
  border:2px solid black;
  height:100px;
}
#tbo td .actionbtn{
  display:inline-block;
  padding:5px;
  border-radius:5px;
  border:2px solid black;
  background-color:#164863;
  margin-bottom:3px;
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
/*Pop up*/
html, body {
   padding: 0;
   margin: 0;
   width: 100%;
   height: 100%;
}
a {
   color: #fff;
   text-decoration: none;
}
.popup {
   position: fixed;
   padding: 10px;
   max-width: 820px;
   border-radius: 0.5em;
   top: 50%;
   left: 50%;
   color: #000;
   transform: translate(-50%, -50%);
   visibility: hidden;
   opacity: 0;
   transition: opacity .5s, visibility 0s linear .5s;
   z-index: 1;
}
.popup:target {
   visibility: visible;
   opacity: 1;
   transition-delay: 0s;
}
.popup .close {
   position: absolute;
   right: 10px;
   top: 5px;
   padding: 5px;
   color: #000;
   transition: color .3s;
   font-size: 2em;
   line-height: 1.5;
   font-weight: 700;
}
.popup .close:hover {
   color: #f00;
}
.close-popup {
   background-color: rgba(0,0,0,.7);
   cursor: default;
   position: fixed;
   top:0;
   left:0;
   right:0;
   bottom:0;
   opacity: 0;
   visibility: hidden;
   transition: opacity .5s, visibility 0s linear .5s;
}
.popup:target + .close-popup {
   opacity: 1;
   visibility: visible;
   transition-delay: 0s;
}
/*Pop Up Form*/
.container{
  max-width: 800px;
  background: #DDF2FD/*#fff*/;
  width: 800px;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
border-radius: 0.5em;
}
.container .text{
  text-align: center;
  font-size: 41px;
  font-weight: 600;
  font-family: 'Poppins', sans-serif;
  background: #164863/*-webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea)*/;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.container form{
  padding: 30px 0 0 0;
}
.container form .form-row{
  display: flex;
  margin: 32px 0;
}
form .form-row .input-data{
  width: 100%;
  height: 40px;
  margin: 0 20px;
  position: relative;
}
form .form-row .textarea{
  height: 70px;
}
.input-data input,
.textarea textarea{
  display: block;
  width: 100%;
  height: 100%;
  border: none;
  font-size: 17px;
  border-bottom: 2px solid rgba(0,0,0, 0.12);
  background-color:#DDF2FD;
}
.input-data input:focus ~ label, .textarea textarea:focus ~ label,
.input-data input:valid ~ label, .textarea textarea:valid ~ label{
  transform: translateY(-20px);
  font-size: 14px;
  color: #3498db;
}
.textarea textarea{
  resize: none;
  padding-top: 10px;
}
.input-data label{
  position: absolute;
  pointer-events: none;
  bottom: 10px;
  font-size: 16px;
  transition: all 0.3s ease;
}
.textarea label{
  width: 100%;
  bottom: 40px;
  background: #fff;
}
.input-data .underline{
  position: absolute;
  bottom: 0;
  height: 2px;
  width: 100%;
}
.input-data .underline:before{
  position: absolute;
  content: "";
  height: 2px;
  width: 100%;
  background: #3498db;
  transform: scaleX(0);
  transform-origin: center;
  transition: transform 0.3s ease;
}
.input-data input:focus ~ .underline:before,
.input-data input:valid ~ .underline:before,
.textarea textarea:focus ~ .underline:before,
.textarea textarea:valid ~ .underline:before{
  transform: scale(1);
}
.submit-btn .input-data{
  overflow: hidden;
  height: 45px!important;
  width: 25%!important;
}
.submit-btn .input-data .inner{
  height: 100%;
  width: 300%;
  position: absolute;
  left: -100%;
  background: #164863/*-webkit-linear-gradient(right, #56d8e4, #9f01ea, #56d8e4, #9f01ea)*/;
  transition: all 0.4s;
}
.submit-btn .input-data:hover .inner{
  left: 0;
}
.submit-btn .input-data input{
  background: none;
  border: none;
  color: #fff;
  font-size: 17px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
  cursor: pointer;
  position: relative;
  z-index: 2;
}
@media (max-width: 700px) {
.container .text{
  font-size: 30px;
}
.container form{
  padding: 10px 0 0 0;
}
.container form .form-row{
  display: block;
}
  form .form-row .input-data{
    margin: 35px 0!important;
  }
  .submit-btn .input-data{
    width: 40%!important;
  }
}
label{
  cursor:pointer;
}    
#imageName{
  color:green;
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
				<h3>Add</h3><i class="fa-solid fa-user-plus"></i>
	    	</a>
	    </div>
    </div>
	<div id="alltable">
		<table id="tablehead">
    		<tr>
    			<td class="th" style="width:310px;"><h3>Course Name</h3></td>
    			<td class="th" style="width:200px;"><h3>Level</h3></td>
    			<td class="th" style="width:130px;"><h3>Category</h3></td>
    			<td class="th" style="width:380px;"><h3>Description</h3></td>
    			<td class="th" style="width:100px;"><h3>Duration</h3></td>
    			<td class="th" style="width:200px;"><h3>Start Date</h3></td>
    			<td class="th" style="width:250px;"><h3>Enrollment Deadline Date</h3></td>
    			<td class="th" style="width:140px;"><h3>Action</h3></td>
    		</tr> 
		    <c:forEach items="${courselist}" var="course">
		    <tr id="tbo">
		        <td>${course.title}</td>
		        <td>${course.level}</td>
		        <td>${course.category}</td>
		        <td>
		        	<span id="description_${course.course_id}" class="description-truncated">
		            	${fn:substring(course.description, 0, 30)}... 
		               	<button onclick="toggleDescription('${course.course_id}')" id="toggleBtn_${course.course_id}" class="readmore">Read more</button>
		            </span>
		            <span id="fullDescription_${course.course_id}" class="description-full" style="display:none;">
		            	${course.description}
		            	<button onclick="toggleDescription('${course.course_id}')" class="readless">Read less</button>
		            </span>
		        </td>
		        <td>${course.duration}</td>
		        <td>${course.start_date}</td>
		        <td>${course.enrollment_deadline}</td>
		        <td> 
		        	<a href = "${pageContext.request.contextPath}/coursesController?action=EDIT&course_id=${course.course_id}" class="actionbtn">Edit</a> 
					<a href = "${pageContext.request.contextPath}/coursesController?action=DELETE&course_id=${course.course_id}" onclick="show()" class="actionbtn">Delete</a>
				</td>
			</tr>
     		</c:forEach>   
    		</table>
    		</div> 

</body>
</html>