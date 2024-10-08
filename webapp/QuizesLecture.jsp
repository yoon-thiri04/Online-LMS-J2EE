<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Quizes" import="util.*" import="dao.*" import="java.util.*" import="java.sql.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <% 
session = request.getSession(); 
 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
quizDAO qdao=new quizDAO();
String username=udao.getNameLecture(userEmail);
int id=(int)session.getAttribute("quiz_id");
List<Quizes> quizesList=qdao.getQuizes(id);
pageContext.setAttribute("qList", quizesList,PageContext.PAGE_SCOPE);

int total=0;
try{
	String sql= "select count(*) as total from quizz where id="+id;
Connection connection = DBConnection.openConnection();
Statement statement = connection.createStatement();
ResultSet resultSet = statement.executeQuery(sql);
if(resultSet.next()){
total =resultSet.getInt("total");
}
}catch(SQLException e) {
	e.printStackTrace();
	}
String quiz_title=null;
String sql= "select title from quiz where id="+id;
Connection connection = DBConnection.openConnection();
Statement statement = connection.createStatement();
ResultSet resultSet = statement.executeQuery(sql);
if(resultSet.next()){
quiz_title=resultSet.getString("title");
}
%>
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
 background-color: #DDF2FD;
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
  	background: #427D9D;
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
.grid-container{
    margin-left:350px;
    margin-top:20px;
    margin-bottom:20px;
    padding-bottom:20px;
    
   }
.grid-item .quest h3{
font-size:18px;
}
.grid-item{
display:flex;
	border: 2px solid white;
    box-shadow: 5px 30px 56.1276px rgb(50 50 55 / 12%);
    border: 1px solid #111;
    border-radius: 15px 30px ;
    transition: all .3s cubic-bezier(.445, .05, .55, .95);
    transition: all 1s ease 0s;
    cursor: pointer;
    padding-left:50px;
    padding-top:20px;
    height:290px;
    width:880px;
    background:#fff;
}
.grid-item #cAns{
margin-top:20px;
}

.grid-item .ahref{
     padding:0.7rem;
     margin-left:auto;
flex: 0 0 calc(27.33% - 20px);
}
.grid-item .ahref a{
   
    padding-bottom: 10px ;
    padding-top:10px;
    padding-left:10px;
    padding-right:10px;
    color:black;
    text-decoration: none;
    border: 1px solid #999;
    border-radius: 4px;
    transition: all 0.3s ease 0s;
    background:white;
}

.grid-item .ahref a:hover {
    color: #fff;
    background: #427D9D;
    border: 1px solid #748dff;
}
/*Table Title*/
#title{
	height:60px;
	width:1050px;
	margin-left:350px;
	margin-top:20px;
	display:flex;
	align-items:center;
}
#title p{
	font-weight:500;
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

#Addbtn{
	display:flex;
	align-items:center;
	margin-left:270px;
	margin-top:20px;
	margin-bottom:25px;
	background-color:#427D9D;
	height:40px;
	width:95px;
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
	padding:7px;
	margin-left:2px;
    transition: all 0.5s ease 0s;
    border-radius:10px;
    align-items:center;
}
</style>
<meta charset="ISO-8859-1">
<title> Quizzes Lecture</title>
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
	<%if(total==0){ %>
	<div class="empty">
	 <img src="logrem.png" />
	
	 <p style="text-align:center;">There is no Quizzes yet. <a href="QuizTypeChoose.jsp">Create <i class="fa-solid fa-arrow-up-from-bracket"></i></a> </p>
	 
	 </div>
	<%}else{ %>
     <div id="title">
    <p><%=quiz_title %><br>
    Total Quizzes(<%=total %>)</p>
    <div id="Addbtn">
      <a href="QuizTypeChoose.jsp" class="btn">
        <h3>Add</h3><i class="fa-solid fa-paint-roller"></i>
        </a>
      </div>
      
    </div>
    <% int quizNo=0; %>
    <c:forEach items="${qList}" var="quiz">
    <%quizNo+=1; %>
    <div class="grid-container">
       <div id="b1" class="grid-item">
          <div class="quest"> <h3>Question <%=quizNo %></h3>
           <h4>Mark 1.00</h4>
            <h3>${quiz.question}</h3>
            <c:forEach items="${quiz.answer}" var="answer">
                <input type="radio" name="quiz_${quiz.id}" value="${answer}"> ${answer} <br>
            </c:forEach>
           <h4 id="cAns">The correct answer is <i>"${quiz.correct_answer}"</i></h4>
           </div>
           <div class="ahref">
          
           <a  href="QuizesController?action=EDIT&quiz_id=${quiz.quiz_id}&type=${quiz.type}">Edit</a>
           <a  href="QuizesController?action=DELETE&quiz_id=${quiz.quiz_id}&type=${quiz.type}">Delete</a>
          </div></div>
        </div>
        </c:forEach>
        
    <%} %>
</body>
</html>