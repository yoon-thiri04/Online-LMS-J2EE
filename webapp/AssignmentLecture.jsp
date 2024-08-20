<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.*" %>
<%@ page import="model.Material" %>
<%@ page import="java.util.List" import="javax.servlet.http.HttpServlet"%>
<% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);%>
<%
    int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
    uploadDao mDAO = new uploadDao();
    List<Material> matList = mDAO.getforAssignment(course_id);
    pageContext.setAttribute("mList", matList,PageContext.PAGE_SCOPE);
   
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
<meta charset="UTF-8" />
<title>Assignment lecture</title>
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
  font-family:Arial,Helvetica, sans-serif;
}
body{
  background-color:#E6E6E6;
  color:black;
  line-height:1.5;
}
/*Header*/
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
	font-family:'Comic Sans MS',cursive;
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
	display:flex;
	align-items:center;
}
.header-icons .account i{
  font-size:29px;
  margin-right:15px;
}
/*sidebar*/
.sidebar{
  position:fixed;
  width: 230px;
  height:100%;
  background:#3D56B2 ;
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
.side_navbar .active{
	border-left:2px solid rgb(100,100,100);
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
#title p{
	font-weight:bold;
	font-size:25px;
	width:500px;
}
/*Add Button*/
.btn{
	width:210px;
	height:70px;
	color:black;
	display:flex;
	align-items:center;
	transition:all 0.5s ease 0s;
}
#Addbtn i{
	font-size:20px;
	margin-left:10px;
	color:white;
}
#mybtn i{
font-size:20px;
	margin-left:10px;
	margin-bottom:30px;
	color:white;
}
#Addbtn{
	display:flex;
	align-items:center;
	margin-left:400px;
	margin-top:20px;
	margin-bottom:25px;
	background-color:#3D56B2;
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
#mybtn{
	
	align-items:center;
	margin-left:20px;
	margin-top:20px;
	margin-bottom:25px;
	background-color:#3D56B2;
	height:40px;
	width:300px;
	padding-left:10px;
	padding-right:10px;
	border:1px solid black;
  transition: all 0.5s ease 0s;
  border-radius:20px;
}
#mybtn h3{
  color:white;
  margin-bottom:30px;
}
.main-body{
  width: 83%;
 
}
.row{
  font-size:20px;
  margin-left:280px;
}
.row table {
padding-left:0px;
 background:transparent;
 padding-bottom:0px;
 color:black  ;
 
}
 .row table th {
 font-size:20px;
 
 padding:10px;
 }
.row table td{
font-size:18px;
padding:10px;
}
.row table .twotd td{
 font-size:17px;
}
 
.row table .twotd td .button1{
  display:inline-block;
  padding:5px;
  border-radius:4px;
  background-color:#3D56B2;
  color:white;
  margin-right:3px;
}
.row table .twotd td .button1.edit{
padding-left:8px;
padding-right:8px;
}
.row table .twotd td .button1:hover{
background-color:  #14279B ;
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
  max-width: 500px;
  width: 500px;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
  border-radius: 0.5em;
  background: hsla(280, 84%, 41%, 1);

background: linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);

background: -moz-linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);

background: -webkit-linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);
filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#8711c1", endColorstr="#2472fc", GradientType=1 );
}
.container .text{
  text-align: center;
  font-size: 30px;
  font-weight: 600;
  background: white;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
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
  color:white;
}
form .form-row .textarea{
  height: 70px;
  color:white;
  
}
.form-row .photoupload{
  width:360px;
  margin-left:20px;
  color:white;
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
  color: white;
}
.textarea textarea{
  resize: none;
  padding-top: 10px;
  color:white;
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
  background: white;
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
  background: #faff89;
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
  background:-webkit-linear-gradient(right, #56d8e4, #9f01ea, #26c5f3, #b429f9);
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
            <h4><%= username %></h4>
        </div>
      </div>
  </header>
 
    <div style="height:60px;">------------</div>
    <div class="sidebar">
        <ul>
        <li><a href="lectureProfile.jsp"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
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
  
  <div id="title">
    <p>Assignment</p>
    <div id="Addbtn">
      <a href="#popup" class="btn">
        <h3>Add</h3><i class="fa-solid fa-user-plus"></i>
        </a>
      </div>
      
    </div>
    
    <div class="row">
    	<table>
        	<tr>
          		<td style="padding-right:80px; border:2px solid black ;background-color:#3D56B2;color:white;"><h4>Title</h4></td>
				<td style="padding-right:80px; border:2px solid black; background-color:#3D56B2 ;color:white;"><h4>Deadline Date</h4></td>
                <td style="padding-right:125px; border:2px solid black ;background-color:#3D56B2 ;color:white;"><h4>Operations</h4></td>
            </tr>
            <c:forEach items="${mList}" var="ml">
            <tr class="twotd">
            	<td style="padding-right:80px; border:2px solid black ;background-color:#fff ;cursor: pointer;">${ml.title}</td>
                <td style="padding-right:80px; border:2px solid black ;background-color:#fff ;cursor: pointer;">${ml.deadline}</td>
                <td style="padding-right:125px;margin-right:180px; border:2px solid black ;background-color:#fff ;"> 
                	<a href = "${pageContext.request.contextPath}/MaterialLectureController?action=DOWNLOAD&id=${ml.id}&title=${ml.title}&ftype=${ml.ftype}" class="button1">Download</a>               
                    <a href = "${pageContext.request.contextPath}/MaterialLectureController?action=DELETE&id=${ml.id}&type=${ml.type}"  class="button1 delete">Delete</a>
                </td>
            </tr>
            </c:forEach>   
		</table>
	</div>

	<div id="popup" class="container popup">
    	<a href="#" class="close">&times;</a>
    	<div class="text">
      		Assignment Add Form
        </div>
		<form action="MaterialLectureController" method="post" enctype="multipart/form-data"> 
      		
      		<input type="hidden" name="mtype" value="Assignment">
      		
      		<div class="form-row">
	        	<div class="input-data">
		            <input type="text" name="title" required>
		            <div class="underline"></div>
		            <label for=""> Title</label>
	            </div>
         	</div>
            <div class="form-row"> 
            	<div class="input-data">
                	<input type="date" name="deadline" required>
                 	<div class="underline"></div>
                 	<label for="">Deadline</label>
              	</div>
      		</div>                 	
            <div class="form-row" > 
            	<div class="photoupload">
             		
             		<input type="file" name="file"/>
        		</div>
           </div>
           <div class="form-row submit-btn">
				<div class="input-data">
	                <div class="inner"></div>
	                <input type="submit" value="Upload">
                </div>
          </div>
		</form>
	</div>
  	
</body>
</html>