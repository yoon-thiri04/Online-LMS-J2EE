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
    int total=matList.size();
   
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
  font-family: Poppins, Helvetica, sans-serif;
}
body{
   background-color: #DDF2FD;
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
  	background: #427D9D;;
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
.side_navbar .active{
	border-left:2px solid rgb(100,100,100);
}
/*Table Title*/
#title{
	height:60px;
	width:1250px;
	margin-left:320px;
	margin-top:10px;
	display:flex;
	align-items:center;
}
#title p{
	font-weight:bold;
	font-size:25px;
	width:390px;
	
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
	margin-left:400px;
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

.main-body{
  width: 83%;
 
}
.block{
	background-color:white/*#71c7ec*/;
	height:100px;
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
.action{
    display:inline-block;
    padding:5px 0;
    margin-right:3px;
    color:black;
    transition: all 0.3s ease 0s;
}
.download:hover{
  color:#3D56B2;
}
.delete:hover{
  color:red;
}
.fa-download{
	font-size:22px;
	
}
.fa-trash-can{
	font-size:22px;
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
  background:#427D9D;
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
  background:-webkit-linear-gradient(right, #427D9D, #164863, #DDF2FD, #427D9D);
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

.empty a{
    background-color:#427D9D;
	height:40px;
	width:90px;
	padding:6px;
	margin-left:2px;
    transition: all 0.5s ease 0s;
    border-radius:10px;
    align-items:center;
    font-size:15px;
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
  <% if(total==0){ %>
  <div class="empty">
	 <img src="logrem.png" />
	
	 <p style="text-align:center;">Opps! There is no assignment yet. <a href="#popup">Create <i class="fa-solid fa-arrow-up-from-bracket"></i></a> </p>
	 
	 </div>
  <%}else{ %>
  <div id="title">
    <p></p>
    <div id="Addbtn">
      <a href="#popup" class="btn">
        <h3>Add</h3><i class="fa-solid fa-arrow-up-from-bracket"></i>
        </a>
      </div>
      
    </div>
     <c:forEach items="${mList}" var="ml">
            <div class="block">
		<table style="width:800px;">
			<tr>
				<td>
					<div class="assign">
						<b>${ml.title}</b></div>
					<p>Deadline Date : ${ml.deadline}</p>	
				</td>
				<td>
					<a href = "${pageContext.request.contextPath}/MaterialLectureController?action=DOWNLOAD&id=${ml.id}&title=${ml.title}&ftype=${ml.ftype}" 
					class="action download">Download <i class="fa-sharp fa-solid fa-download fa-sm"></i></a>
					<a href = "${pageContext.request.contextPath}/MaterialLectureController?action=DELETE&id=${ml.id}&type=${ml.type}"  
					class="action delete">Delete <i class="fa-sharp fa-solid fa-trash-can"></i></a>
				</td>
			<tr>
		</table>
	</div>
    </c:forEach>
    <%} %>
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