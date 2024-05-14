<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="dao.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Course Edit</title>
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
   background: hsla(145, 83%, 74%, 1);

background: linear-gradient(90deg, hsla(145, 83%, 74%, 1) 0%, hsla(204, 77%, 76%, 1) 100%);

background: -moz-linear-gradient(90deg, hsla(145, 83%, 74%, 1) 0%, hsla(204, 77%, 76%, 1) 100%);

background: -webkit-linear-gradient(90deg, hsla(145, 83%, 74%, 1) 0%, hsla(204, 77%, 76%, 1) 100%);

filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#87F4B5", endColorstr="#93CBF1", GradientType=1 );
   
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
.header-icons .account img{
  width: 35px;
  height: 35px;
  margin-right:10px;
  cursor: pointer;
  border-radius: 50%;
}
/*Pop Up Form*/
.container{
  max-width: 800px;
  background: #DDF2FD/*#fff*/;
  width: 800px;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
  border-radius: 0.5em;
  margin-left:360px;
  margin-top:70px;
  margin-bottom:99px;
  height:500px;
  background: hsla(270, 94%, 25%, 1);
  background: linear-gradient(90deg, hsla(270, 94%, 25%, 1) 0%, hsla(158, 94%, 49%, 1) 100%);
  background: -moz-linear-gradient(90deg, hsla(270, 94%, 25%, 1) 0%, hsla(158, 94%, 49%, 1) 100%);
  background: -webkit-linear-gradient(90deg, hsla(270, 94%, 25%, 1) 0%, hsla(158, 94%, 49%, 1) 100%);
  filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#42047e", endColorstr="#07f49e", GradientType=1 ); 
}
.container .text{
  text-align: center;
  font-size: 41px;
  font-weight: 600;
  background:white;
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
  -webkit-background-clip: text;
  color:white;
}
.input-data input:focus ~ label, .textarea textarea:focus ~ label,
.input-data input:valid ~ label, .textarea textarea:valid ~ label{
  transform: translateY(-20px);
  font-size: 14px;
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
  color:white;
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
  width:320px;
}
.input-data .underline:before{
  position: absolute;
  content: "";
  height: 2px;
  width: 100%;
  background: #07F49E;
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
  background:-webkit-linear-gradient(right, #42047e, #32c4c0, #9bf8f4, #6f7bf7);
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
/*closecross*/
.popup .close {
   position: absolute;
   right: 400px;
   top: 150px;
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
	        <h3><%= username %></h3>
    	</div>
    </div>
  </header>
  <div style="height:60px;">------------</div>
	<div id="popup" class="container popup">
       <a href="CourseAdmin.jsp" class="close">&times;</a>
    	<div class="text">
         	Course Edit Form
      	</div>
      <form action="${pageContext.request.contextPath}/coursesController" method="post">
         <div class="form-row">
            <div class="input-data">
               <input type="text" name="title"   value = "${course.title}" required>
               <div class="underline"></div>
               <label for="">Title</label>
            </div>
            <div class="input-data">
               <input type="text" name="level" value = "${course.level}" required>
               <div class="underline"></div>
               <label for="">Level</label>
            </div>
         </div>
         <div class="form-row">
            <div class="input-data">
               <input type="text" name="category" value = "${course.category}" required>
               <div class="underline"></div>
               <label for="">Category</label>
            </div>
           <div class="input-data">
               <input type="text" name="duration" value = "${course.duration}" required>
               <div class="underline"></div>
               <label for="">Duration</label>
            </div>
         </div>
         <div class="form-row">
           <div class="input-data">
               <input type="text" name="description" value = "${course.description}" required>
               <div class="underline"></div>
               <label for="">Description</label>
            </div>
            <div class="input-data">
	         
               <input type="date" name="startDate" value="${course.start_date}"  required>
               <div class="underline"></div>
               <label for="">Start on</label>
            </div>
          </div>
          <div class="form-row"> 
	         <div class="input-data">
               <input type="date" name="deadLine" style="width:320px;" value="${course.enrollment_deadline}" required>
               <div class="underline"></div>
               <label for="">Enrollment Deadline</label>
            </div>
         </div>
           <input type="hidden" name="course_id" value="${course.course_id}"/>
            <div class="form-row submit-btn">
               <div class="input-data">
                  <div class="inner"></div>
                  <input type="submit" value="Save">
               </div>
            </div>
</form>
	</div> 
	<a href="#" class="close-popup"></a>

</body>
</html>
