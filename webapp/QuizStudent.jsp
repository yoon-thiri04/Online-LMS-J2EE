<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.*" %>
<%@ page import="model.Quiz" %>
<%@ page import="java.util.List" import="java.sql.*" import="util.*"%>


<%
session = request.getSession(); 
String userEmail = (String) session.getAttribute("stuEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);

    int course_id = (int)session.getAttribute("course_id");
    quizDAO qdao=new quizDAO();
    List<Quiz> quizList = qdao.get(course_id);
    pageContext.setAttribute("qList", quizList,PageContext.PAGE_SCOPE);  
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Quiz</title>
</head>
<script>
function miss(){
	alert("Quiz Deadline is Reached. You missed to attempt!!")
}
function start(quiz_id) {
                window.location.href="${pageContext.request.contextPath}/QuizStartController?quiz_id="+quiz_id;
}
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<style> @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");       
*{
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: Arial, Helvetica, sans-serif;
}
body{
  background:#FBFAD3;
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
  	background: #36622B;
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
}
.sidebar{
  margin-top:0px;
  position:fixed;
  width: 230px;
  height:100%;
  background:#729D39;
  /*transition:all .5s ease;*/
}
.sidebar header{
  font-size:22px;
  color:white;
  text-align:center;
  line-height:70px;
  background:#0A6EBD  ;
  user-select:none;
}
.sidebar ul a{
  display:block;
  height:100%;
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
/*#check{
  display:none;
}*/
label /*#btn*/,label #cancel{
  position:absolute;
  cursor:pointer;
 
  border-radius:3px;
}
label /*#btn*/{
  left:35px;
  top:20px;
  font-size:25px;
  color:white;
  padding:6px 12px;
  transition:all .5s;
}
label #cancel{
  z-index:1111;
  left:-195px;
  top:17px;
  margin-left:30px;
  font-size:15px;
  color:white;
  padding:4px 5px;
}

/* Main Body Section */
.main-body{
  width: 83%;
}
.row{
  font-size:20px;
  margin-left:280px;
  color:red;
}
.row table {
padding-left:0px;
 background:transparent;
 padding-bottom:0px;
 color:black  ;
 
}
.row table .th {
	padding-right:80px;
	border:2px solid black;
	background-color:#C6E377 ;
	height:60px;
}
.row table td{
font-size:18px;
padding:10px;
}
 .row table td:hover{
  background-color:#C6E377 ;
  }
.row table .twotd td{
 font-size:17px;
 height:50px;
 
 border:2px solid black;
 background-color:#fff;
 cursor: pointer;
}
 
.row table .twotd td .button1{
  display:inline-block;
  padding:5px;
  border-radius:4px;
  background-color:#36622B;
  color:white;
  margin-right:3px;
}
.row table .twotd td .button1.edit{
padding-left:8px;
padding-right:8px;
}
.row table .twotd td .button1:hover{
background-color: #C6E377  ;
color:;
}

</style>
</head>
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
	<div style="height:60px;">------------</div>
  <div class="sidebar">
    <ul>
      <li><a href="student1.jsp"><i class="fa-solid fa-link"></i>Enrolled Courses</a></li>
      <li><a href="Material.jsp?course_id=<%=course_id%>"><i class="fa-solid fa-calendar-week"></i>Course Materials</a></li>
      <li><a href="#"><i class="fa-solid fa-calendar-week"></i>Quiz</a></li>
      <li><a href="Announcements.jsp"><i class="fa-solid fa-calendar-week"></i>Announcements</a></li>
      <li><a href="changePwd.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
      <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
    </ul>  
  </div>
  <div class="container">
       <div class="row">
          <table>
          <tr>
          <th style="padding-right:80px;padding-bottom:15px; padding-top:10px" >
            <h3>Quiz</h3>
            </th>
           
            <th style="padding-right:80px;padding-bottom:15px;" ></th>
            <th >
            </th>
          </tr>
            
           <tr>
           
            <td class="th"><h4>Quiz Title</h4></td>
            <td class="th"><h4>Total Quizzes</h4></td>
            
            <td class="th"><h4>Deadline Date</h4></td>
            <td class="th"><h4>State</h4></td>
            <td class="th"><h4>Operations</h4></td>
         
           </tr>
            <c:forEach items="${qList}" var="quiz">
            <c:set var="quiz_id" value="${quiz.quiz_id}" />
            
           <tr class="twotd">
				<td>${quiz.title}</td>
                <td>${quiz.total_quizes}</td>
                
                <td>${quiz.deadline}</td>
                 <%
boolean quizResultExists = false;
int result_id=0;
PreparedStatement statement = null;
ResultSet resultSet = null;
PreparedStatement statement1 = null;
ResultSet resultSet1 = null;
Connection connection=DBConnection.openConnection();
Connection connection1=DBConnection.openConnection();
int quiz_id=(int)pageContext.getAttribute("quiz_id");

try {
    String query = "SELECT EXISTS (SELECT 1 FROM quizresult WHERE student_email = ?  AND quiz_id = ?)";
    statement = connection.prepareStatement(query);
    statement.setString(1, userEmail);
    statement.setInt(2,quiz_id );
    resultSet = statement.executeQuery();
    if (resultSet.next()) {
        quizResultExists = resultSet.getBoolean(1);
        if(quizResultExists){
        	String sql="Select result_id from quizresult where student_email=? and quiz_id=?";
        	statement1=connection1.prepareStatement(sql);
        	statement1.setString(1,userEmail);
        	statement1.setInt(2,quiz_id);
        	resultSet1=statement1.executeQuery();
        	if(resultSet1.next()){
        		result_id=resultSet1.getInt("result_id");
        	}
        }
    }
} catch(Exception e){
	e.printStackTrace();
}

pageContext.setAttribute("result_id",result_id);
pageContext.setAttribute("quizResultExists", quizResultExists);
Boolean deadlineReached=qdao.DeadlineReached(quiz_id);
pageContext.setAttribute("deadlineReached",deadlineReached);
%>
         <c:choose>
                <c:when test="${not quizResultExists}">
                <td>Not Started</td>
                </c:when>
                <c:otherwise>
                 <td>Finished</td>
                 </c:otherwise>
                 
                 </c:choose>
                  <td>
                	 <c:choose>
        
        <c:when test="${not quizResultExists && not deadlineReached}">
       <a href="#" onclick="start(<%=quiz_id%>)" class="button1">Start Now</a>
    </c:when>
    <c:when test="${not quizResultExists && deadlineReached}">
        <a href="#" class="button1" onclick="miss()">Missed</a>
    </c:when>
        <c:otherwise>
            <a href="QuizResultController?action=REVIEW&quiz_id=${quiz.quiz_id}&result_id=<%=pageContext.getAttribute("result_id") %>&title=${quiz.title}" class="button1">Review Quiz</a>
            <a href="QuizResultController?action=RESULT&quiz_id=${quiz.quiz_id}&result_id=${result_id}" class="button1">View Result</a>
        </c:otherwise>
    </c:choose>
    </td>
             </tr>
            
            </c:forEach>
          </table>
          </div>
         
        
    
</div>
                
<body>

</body>
</html>