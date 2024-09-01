<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
  background-color:#E6E6E6;
  color:black;
  line-height:1.5;
  position: fixed;
  /*position: fixed;*/
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

.card__image {
  width: 400px;
  height: 400px;
  margin-left: 700px;
  /*margin-top: 10px;*/
}

/*Table Title*/
#title{
	height:10px;
	width:1050px;
	margin-left:720px;
	/*margin-top: 2px;*/
	display:flex;
	align-items:center;
}
#title p{
	font-weight:bold;
	font-size:25px;
	width:500px;
}
#t1{
  height:60px;
  width:1050px;
  margin-left:810px;
  margin-top:10px;
  display:flex;
  align-items:center;
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
	
	margin-top:20px;
  margin-left: 25px;
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

</style>
<meta charset="ISO-8859-1">
<title> Quizzes Lecture</title>
</head>
<body>
 <header class="header">
    <div class="logo">
        <a href="#"><b>Smart Learn</b></a>
      </div>
      <div class="header-icons">
        <div class="account">
            <i class="fa-solid fa-circle-user"></i>
            <h4>Name</h4>
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
	<%
	int total=0;
	if(total==0){
	%>
	<br><br>
    <div class="img1">
      
        <img src="img/quiz.png" class="card__image" />
     </div>
     <div id="title">
    
    You have no quizzes yet. Start Create one!</div><br>
    <div id=t1>
    <div id="Addbtn">
    
      <a href="#" class="btn">
        <h3>Create</h3><i class="fa-solid fa-paint-roller"></i>
        </a>
      </div>
      
    </div>
    <%} %>
     
   
  
    
</body>
</html>