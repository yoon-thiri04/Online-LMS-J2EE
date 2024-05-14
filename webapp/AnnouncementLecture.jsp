<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.DBConnection"
    import="java.sql.Connection" import="dao.*" 
    import="java.sql.*" import="model.Announcement" import="dao.announceDAO" import="dao.UserDAO" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String title="";
    String userEmail = (String) session.getAttribute("userEmail");
   lectureDAO udao=new lectureDAO();
    String username=udao.getNameLecture(userEmail);
    int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
    Connection connection=DBConnection.openConnection();
    String sql = "SELECT title FROM courses WHERE course_id = ?";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setInt(1, course_id);
    
    ResultSet resultSet = statement.executeQuery();
    
    if(resultSet.next()) {
        
         title = resultSet.getString("title");
        } else {
        System.out.println("No course found with course_id " + course_id);
    }
    announceDAO andao=new announceDAO();
    List<Announcement> announce=andao.getfor(course_id);
    pageContext.setAttribute("aList", announce,PageContext.PAGE_SCOPE);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lecturer's Announcement</title>
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
   background-color:#E6E6E6;
   color:black;
   /*font-family: 'Comic Sans MS', cursive;*/
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
  	background: #14279B;
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
	background:#3D56B2;
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
#title p{
	font-weight:bold;
	font-size:25px;
	width:800px;
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
.btn i{
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
/*Main body*/
.main-body {
	margin-left:250px;
	margin-top:0px;
}
.row{
	font-size:20px;
  	margin-left:30px;
}
.row table {
	padding-left:0px;
 	background:transparent;
 	padding-bottom:0px;
 	color:black  ;
 	width:90%;
}
.row table .th{
	border:2px solid black;
	background-color:#3D56B2;
	height:60px;
	color:white;
	padding-right:50px;
}
.row table td{
	font-size:18px;
	padding:10px;
	height:50px;
	border:2px solid black;
}
#tbo{
  	background-color:white;
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
  max-width: 550px;
  width: 550px;
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
  font-size: 35px;
  font-weight: 600;
  background: white;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  margin-bottom:20px;
}
.container form .form-row{
  display: flex;
  margin: 32px 0;
  /*margin-left:50px;*/
}
form .form-row .input-data{
  width: 100%;
  height: 40px;
  margin: 0 20px;
  position: relative;
}
form .form-row .textarea{
color:white;
  height: 70px;
}
form .form-row .date{
	margin-left:20px;
}
.input-data input,
.textarea textarea{
  display: block;
  width: 360px;
  height: 100%;
  border: none;
  color:white;
  font-size: 17px;
  border-bottom: 2px solid rgba(0,0,0, 0.12);
  -webkit-background-clip: text;
}
.input-data input:focus ~ label, .textarea textarea:focus ~ label,
.input-data input:valid ~ label, .textarea textarea:valid ~ label{
  transform: translateY(-20px);
  font-size: 14px;
  color: white;
}
.textarea textarea{
  resize: none;
  color:white;
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
  background: white;
}
.input-data .underline{
  position: absolute;
  bottom: 0;
  height: 2px;
  width: 360px;
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
label{
  cursor:pointer;
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
	<div style="height:60px;">---------------</div>
	<div class="sidebar">
		<ul>
	      	<li><a href="lectureProfile.jsp"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
          <li><a href="MaterialLecture.jsp"><i class="fa-solid fa-book-open"></i>Materials</a></li>
          <li><a href="QuizLecture.jsp"><i class="fa-solid fa-book-open"></i>Quiz</a></li>
          
          <li><a href="EnrollStudent.jsp"><i class="fa-solid fa-users"></i>Students</a></li>
          <li><a href="AnnouncementLecture.jsp"><i class="fa-solid fa-bullhorn"></i>Announcements</a></li>
          <li><a href="SubmissionAllLecture.jsp"><i class="fa-solid fa-book-open"></i>Submissions</a></li>
          
            <li><a href="changePwdLecture.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
        <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
      </ul>
	</div>
	
	<div id="title">
    <p><%=title %> Announcements </p>
    <div id="Addbtn">
      <a href="#popup" class="btn">
        <h3>Add</h3><i class="fa-solid fa-user-plus"></i>
        </a>
      </div>
    </div>
    
    <div class="main-body">
		<div class="row">
        	<table>
          		<tr>
					<td class="th"><h4>Announcement Title</h4></td>
            		<td class="th"><h4>Content</h4></td>
            		<td class="th"><h4>Date</h4></td>
            		<td class="th"><h4>Operations</h4></td>
           		</tr>
           		<tbody id="tbo">
            	<c:forEach items="${aList}" var="al">
              	<tr class="twotd">
					<td style="padding-right:80px; border:2px solid black ;background-color:#fff ;cursor: pointer;">${al.title}</td>
                	<td style="padding-right:80px; border:2px solid black ;background-color:#fff ;cursor: pointer;">${al.content}</td>
                	<td style="padding-right:80px; border:2px solid black ;background-color:#fff ;cursor: pointer;">${al.date}</td>              
                	<td style="padding-right:105px;border:2px solid black ;background-color:#fff ;">
                		<a href = "${pageContext.request.contextPath}/AnnounceController?action=DELETE&announcement_id=${al.announcement_id}" class="button1 delete">Delete</a>
                	</td>
              	</tr>
              	</c:forEach>
              	</tbody>
			</table>
	</div>
</div>
	<div id="popup" class="container popup">
    	<a href="#" class="close">&times;</a>
    	<div class="text">
      		Announcements Add Form
        </div>
		<form action="${pageContext.request.contextPath}/AnnounceController" method="post"> 
      		<input type="hidden" name="announcement_id" value="${announcement.id}"/>
      		<div class="form-row">
	        	<div class="input-data">
		            <input type="text" name="title" required>
		            <div class="underline"></div>
		            <label for="">Announcement Title</label>
		            <input type="hidden" name="course_name" value="<%= title%>"/>
	            </div>
         	</div>
          	<div class="form-row"> 
            	<div class="input-data">
                	<input type="text" name="contents" required>
                 	<div class="underline"></div>
                 	<label for="">Announcement content</label>
              	</div>
      		</div>
 
            <div class="form-row" >
            	<div class="date"> 
            		<input type="date" name="date"/>
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
  	<a href="#" class="close-popup"></a>
  	    
</body>
</html>