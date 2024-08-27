<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.*" %>
<%@ page import="model.Quiz" %>
<%@ page import="java.util.List" import="javax.servlet.http.HttpServlet"%>
<% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);%>
<%

    int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
    quizDAO qdao=new quizDAO();
    List<Quiz> quizList = qdao.get(course_id);
    pageContext.setAttribute("qList", quizList,PageContext.PAGE_SCOPE);
    String action1 = (String) request.getAttribute("action1");
    System.out.println(action1);
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
<title>Quiz lecture</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
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
	font-size:19px;
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
	margin-left:550px;
	margin-top:10px;
	display:flex;
	align-items:center;
}
#title p{
	font-weight:bold;
	font-size:25px;
	width:700px;
	
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

#Addbtn{
	display:flex;
	align-items:center;
	margin-left:500px;
	margin-top:20px;
	margin-bottom:25px;
	background-color:#3D56B2;
	height:40px;
	width:120px;
	padding-left:5px;
	padding-right:5px;
	border:1px solid black;
    transition: all 0.5s ease 0s;
    border-radius:10px;
}
#Addbtn h3{
  color:white;
}

.main-body{
  width: 83%;
 
}
.block{
	background-color:white/*#71c7ec*/;
	height:140px;
	width:900px;
	border-radius:30px;
	margin-left:auto;
	margin-right:auto;
	margin-top:10px;
	margin-bottom:20px;
	box-shadow: 0px 0px 5px 0px #6B6B6B;
	transition: all .4s ease;
}
.block:hover{
	box-shadow: 0 26px 58px 0 rgba(0, 0, 0, .22), 0 5px 14px 0 rgba(0, 0, 0, .18);
}

.block .assign{
	
	display:inline-block;
	margin-top:10px;
	margin-left:50px;
	margin-right:30px;
	font-size:20px;
	width:500px;
  	white-space: nowrap; /* Prevents text from wrapping to the next line */
  	overflow: hidden; /* Hides the overflow text */
  	text-overflow: ellipsis;
  	padding-right:20px;
}
.block p{
	margin-left:50px;
	margin-top:5px;
}
.fa-arrow-up-right-from-square{
    font-size:25px;
	color:black;
	margin-right:50px;
}
.fa-arrow-up-right-from-square:hover{
color:#14279B;
}
.fa-pen-to-square{
	margin-left:30px;
	margin-right:40px;
	font-size:25px;
	color:black;
}
.fa-pen-to-square:hover{
	color:#14279B;
}
.fa-trash-can{
	font-size:25px;
	
	color:black;
}
.fa-trash-can:hover{
	color:#14279B;
}
.fa-
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
.popup1 {
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
.popup1:target {
   visibility: visible;
   opacity: 1;
   transition-delay: 0s;
}
.popup1 .close {
   position: absolute;
   right: 10px;
   top: 5px;
   padding: 5px;
   color: #fff;
   transition: color .3s;
   font-size: 2em;
   line-height: 1.5;
   font-weight: 700;
}
.popup1 .close:hover {
   color: skyblue;
}
.close-popup1 {
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
.popup1:target + .close-popup1 {
   opacity: 1;
   visibility: visible;
   transition-delay: 0s;
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
   color: #fff;
   transition: color .3s;
   font-size: 2em;
   line-height: 1.5;
   font-weight: 700;
}
.popup .close:hover {
   color: skyblue;
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
  font-size: 38px;
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
 .container .text1{
  margin-top:5px;
  text-align: center;
  font-size: 15px;
  font-weight: 600;
  background: white;
  color:black;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
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
  
  <div id="title">
    
    <div id="Addbtn">
      <a href="#popup" class="btn">
        <h3>Create</h3><i class="fa-solid fa-paint-roller"></i>
        </a>
      </div>
      
    </div>
    
	<c:forEach items="${qList}" var="quiz">
	<div class="block">
		<table style="width:800px;">
			<tr>
				<td>
					<div class="assign">
						<b>${quiz.title}</b></div>
					<p>Deadline : ${quiz.deadline}</p>
					<p>Total Quizzes : ${quiz.total_quizes}</p>		
				</td>
				
				<td>
					
                	<a href = "${pageContext.request.contextPath}/QuizLectureController?action=EDIT&id=${quiz.quiz_id}" class="button1" title="Edit">
                	<i class="fa-solid fa-pen-to-square"></i></a> 
                	<a href = "${pageContext.request.contextPath}/QuizLectureController?action=View&id=${quiz.quiz_id}" class="button1" title="View">
                	<i class="fa-solid fa-arrow-up-right-from-square"></i></a>         
					<a href = "${pageContext.request.contextPath}/QuizLectureController?action=DELETE&id=${quiz.quiz_id}"  class="button1 delete" title="Delete">
					<i class="fa-sharp fa-solid fa-trash-can"></i></a>
				</td>
			<tr>
		</table>
	</div>
	</c:forEach>
   <script type="text/javascript">
   window.onload = function() {
       var action = "<%= action1 %>"; // Ensure this is correctly passed
       console.log("Action:", action); // Log action to console

       if (action === "EDIT") {
           var popup = document.getElementById("popup1");
           if (popup) {
               console.log("Popup found, displaying it."); // Log found popup
               popup.style.visibility = "visible";
               popup.style.opacity = "1";
           } else {
               console.log("Popup not found.");
           }
       }

       var closeButton = document.querySelector("#popup1 .close");
       if (closeButton) {
           closeButton.addEventListener("click", function(event) {
               event.preventDefault(); 
               var popup = document.getElementById("popup1");
               if (popup) {
                   popup.style.opacity = "0";
                   setTimeout(function() {
                       popup.style.visibility = "hidden";
                   }, 500);
               }
           });
       }
   }
</script>
	<div id="popup1" class="container popup1" style="visibility: hidden; opacity: 0; transition: opacity 0.5s ease;" >
    	<a href="#" class="close">&times;</a>
    	<div class="text">
      		Quiz Update  Form
        </div>
        <div class="text1">
      		Quiz Scores are fixed 1 mark per quiz.
        </div>
		<form action="QuizLectureController" method="post" > 
      		<input type="hidden" value="${quizEdit.quiz_id}" name="quiz_id">
      		<div class="form-row">
	        	<div class="input-data">
		            <input type="text" name="title" value="${quizEdit.title}" required>
		            <div class="underline"></div>
		            <label for="">Quiz Title</label>
	            </div>
         	</div> 
       <div class="form-row">
	        	<div class="input-data">
               <label for="" style="margin-bottom:;">End Date</label>
                </div>  
                <input type="date" name="deadline" value="${deadlineDate}" required>       
				  </div >
				  <div class="form-row">
	        	<div class="input-data">
               <label for="" style="margin-bottom:;">End Time</label>
                </div>  
                <input type="time" name="deadlineTime" value="${deadlineTime}" required>       
				  </div >
           <div class="form-row submit-btn">
				<div class="input-data">
	                <div class="inner"></div>
	                <input type="submit" name="submitbtn" value="update">
                </div>
          </div>
		</form>
	</div>
	<div id="popup" class="container popup">
    	<a href="#" class="close">&times;</a>
    	<div class="text">
      		Quiz Creation Form
        </div>
        <div class="text1">
      		Quiz Scores are fixed 1 mark per quiz.
        </div>
		<form action="QuizLectureController" method="post" > 
      		
      		<div class="form-row">
	        	<div class="input-data">
		            <input type="text" name="title"  required>
		            <div class="underline"></div>
		            <label for="">Quiz Title</label>
	            </div>
         	</div> 
       <div class="form-row">
	        	<div class="input-data">
               <label for="" style="margin-bottom:;">End Date</label>
                </div>  
                <input type="date" name="deadline"  required>       
				  </div >
				  <div class="form-row">
	        	<div class="input-data">
               <label for="" style="margin-bottom:;">End Time </label>
                </div>  
                <input type="time" name="deadlineTime"  required>       
				  </div>      
           <div class="form-row submit-btn">
				<div class="input-data">
	                <div class="inner"></div>
	                <input type="submit" name="submitbtn" value="create">
                </div>
          </div>
		</form>
		</div>
  	
</body>
</html>