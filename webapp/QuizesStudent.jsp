<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*" import="java.util.*" import="model.Quizes" import="java.sql.*" import="util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <%
session = request.getSession(); 
String userEmail = (String) session.getAttribute("stuEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
    int course_id = (int)session.getAttribute("course_id");
    String course_title=null;
    Connection connection=DBConnection.openConnection();
    String sql = "SELECT title FROM courses WHERE course_id = ?";
    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setInt(1, course_id);
    ResultSet resultSet = statement.executeQuery();
   if(resultSet.next()) {
         course_title = resultSet.getString("title");
        }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Student Quizzes Attempt Form </title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

</head>
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
}
/*header*/
.header{
	/*position:fixed;*/
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
	margin-right:30px;
}
.header-icons .account ul{
  display: flex;
  align-items: center;
  gap:40px;
}

.header-icons .account ul li{
	list-style-type: none;
}

.header-icons .account ul li a{
    color: white;
    text-decoration: none;
    font-size: 17px;
    padding-top: 20px;
    padding-bottom: 10px;
    padding-left: 10px;
    padding-right: 20px;
    line-height: 30px;
}

.header-icons .account ul li a:hover{
    color: orange;
}
.header-icons .profile{
	display:flex;
	align-items:center;
	margin-left:20px;
	font-size:20px;
	cursor:pointer;
}
.header-icons .profile i{
	font-size:29px;
	margin-right:15px;
	color:white;
}.grid-container{
    margin-left:350px;
    margin-top:20px;
    margin-bottom:20px;
    padding-bottom:20px;
   }
.grid-item .quest h5{
margin-bottom:10px;
font-size:16px;
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
}
.grid-item #cAns{
margin-top:20px;
}

.grid-item:hover{

    transform: translateY(-5px);
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
    background: #748dff;
    border: 1px solid #748dff;
}

/*Table Title*/
#title{
	height:60px;
	width:1050px;
	margin-left:330px;
	margin-top:20px;
	display:flex;
	align-items:center;
}
#title p{
	font-weight:bold;
	font-size:25px;
	width:500px;
}
.input-container {
        display: flex;
        flex-direction: column;
        width: 300px; /* Set a fixed width or use a percentage */
        margin: 10px 0;
    }
     input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        font-family: Arial, sans-serif;
    }
    input[type="text"]:focus {
        border-color: #4CAF50;
        outline: none;
    }
.input-data{
margin-left:980px;
margin-bottom:40px;
}
.input-data  .pretty-button {
        background-color: #14279B; 
        border: none; 
        font-weight:bold;
        color: white; 
        padding: 15px 32px; 
        text-align: center; 
        text-decoration: none; 
        display: inline-block;
        font-size: 18px;
        margin: 4px 2px; 
        cursor: pointer; 
        border-radius: 4px; 
        transition: background-color 0.3s ease; 
    }

.input-data .pretty-button:hover {
        background-color: #387ADF;
    }

.input-data  .pretty-button:focus {
        outline: none; 
        box-shadow: 0 0 5px #4CAF50;
        }
        
        
.input-data  .pretty-button:active {
        background-color: #14279B;
        box-shadow: 0 5px #666; 
        transform: translateY(4px); /* Move the button down a bit */
    }
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
.container{
	color:white;
  max-width: 500px;
  background: #3D56B2;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
  border-radius: 0.5em;
  margin-left:80px;
  margin-top:40px;
  
  height:250px;
  font-size:18px;
  text-align:center;
  }
.popup {
   position: fixed;
   padding: 10px;
   
   border-radius: 10px;
   top: 50%;
   left: 45%;
   color: white;
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
   color: white;
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
.b11{
	padding: 8px;
	color: white;
}
.b12{
	margin-left:45px;
	width: 200px;
	height: 40px;
	font-size:18px;
	font-weight:600;
	color:white;
	background-color:#9DBDFF;
	border-radius:5px;
	
}
.b13{
	width: 150px;
	color:white;
	height: 40px;
	background-color:#9DBDFF;
	border-radius:5px;
	margin-left:40px;
	font-weight:600;
	padding-top:8px;
	text-align:center;
	}
.b13:hover{
background-color:#D1E9F6;
color:black;
}
.b12:hover{
background-color:#D1E9F6;
color:black;
}
.but1{
display: flex;}
</style>
<body>
<header class="header">
	    <div class="logo">
	      <a href="sourceHomeLogin.jsp"><b>Smart Learn</b></a>
	    </div>
	    
	    <div class="header-icons">
	    	<div class="account">
		        <ul>
	            	<li><a href="sourceHomeLogin.jsp">Home</a></li>
	                <li><a href="CoursesLogin.jsp">Course</a></li>
	                <li><a href="sourceHomeLogin.jsp#aboutUs">About Us</a></li>
	            </ul>
	    	</div>
	    	<div class="profile">
		        <a href="student1.jsp"><i class="fa-solid fa-circle-user"></i></a>
		        <h4><%= username %></h4>
		    </div>
	    </div>
	</header>
	
  <div id="title">
    <p><%=course_title%><br><%=request.getAttribute("title") %> - Total Quizzes(<%=request.getAttribute("total") %>)</p>      
    </div>
    
    <% int quizNo=0; %>
    <form action="QuizResultController" method="post">
         <input type="hidden" name="id" value="<%=request.getAttribute("quiz_id")%>">
    
    <c:forEach items="${quizzlist}" var="quiz">
    <%quizNo+=1; %>
    <div class="grid-container">
       <div id="b1" class="grid-item">
          <div class="quest"> <h3>Question <%=quizNo %></h3><br>
            <h3>${quiz.question}</h3><br>
            <c:choose>
               <c:when test="${quiz.type eq 'multiple'}">
            <c:forEach items="${quiz.answer}" var="answer">
                <input type="radio" name="quiz_${quiz.quiz_id}" value="${answer}"> ${answer}<br><br>
            </c:forEach>
            </c:when>
            <c:when test="${quiz.type eq 'true' }">
            <input type="radio" name="quiz_${quiz.quiz_id}" value="True">True<br><br>
            <input type="radio" name="quiz_${quiz.quiz_id}" value="False">False
            </c:when>
            <c:otherwise>
            <div class="input-container">
                  <input type="text" name="quiz_${quiz.quiz_id}" placeholder="Type your answer here...">
             </div>
            </c:otherwise>
            </c:choose>
           </div>
           <div class="ahref">
           Mark 1.00
           </div></div>
        </div>
        </c:forEach>
        <div class="input-data">
        <a href="#popuphere" class="pretty-button">Submit</a>
    </div>
        <div id="popuphere" class="container popup">
    	<p class="b11">Once you submit, you will no longer be able to change your answers for this attempt.</p><br><br>
        <div class=" but1">
        <input type="submit" class="b12" value="Submit">
        <a href="#" class="b13">Cancel</a>
          </div>
          </div>
        </form>
        <br>
</body>
</html>