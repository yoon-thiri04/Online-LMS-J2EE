<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.*" %>
<%@ page import="model.Submission" import="java.sql.*" %>
<%@ page import="java.util.List" import="util.*" %>
    
    <% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);%>
<%
quizDAO qdao=new quizDAO();
int course_id = Integer.parseInt(session.getAttribute("course_id").toString());

int quiz_id = Integer.parseInt(request.getParameter("quiz_id"));
String title=null;
int total=0;
Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
try {
    connection = DBConnection.openConnection();
    String sql = "SELECT title,total_quizes FROM quiz WHERE id=?";
    statement = connection.prepareStatement(sql);
    statement.setInt(1, quiz_id);
    resultSet = statement.executeQuery();

    if (resultSet.next()) {
        title = resultSet.getString("title");
        total=resultSet.getInt("total_quizes");
    }
} catch (SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Student Who completed the related quiz</title>
</head>
<script>

function viewSubmission(id){
	window.location.href="ViewSubmissionLecture.jsp?s_id="+id;

}
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

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
/*Table Title*/
#title{
	height:60px;
	width:1250px;
	margin-left:280px;
	margin-top:20px;
	margin-bottom:10px;
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
	width:150px;
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
	margin-left:300px;
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
	height:150px;
	width:900px;
	border-radius:30px;
	margin-left:270px;
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
	font-size:22px;	
}
.action{
    display:inline-block;
    padding:10px 5px;
    margin-right:3px;
    color:black;
    transition: all 0.3s ease 0s;
}
.review:hover{
  color:#3D56B2;
}
.view:hover{
color:#3D56B2;
}
</style>
</head>
<body>
	<header class="header">
    <div class="logo">
        <a href="#"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a></div>
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
    <p>Quiz Result of <%=title %></p>
    <div id="Addbtn">
      <a href="QuizResultAllLecture.jsp" class="btn">
        <h3>Back</h3><i class="fa-solid fa-up-right-from-square"></i>
        </a>
      </div>
    </div>
    
    
            <c:forEach items="${resultList}" var="result">
            <c:set var="stud_email" value="${result.student_email}" />
            
            <%
        String email=(String)pageContext.getAttribute("stud_email");
		String stud_name=null;
        String sql1= "select user_name from userlist where email=?";
        Connection connection1 = DBConnection.openConnection();
        PreparedStatement preparedStatement = connection1.prepareStatement(sql1);
		preparedStatement.setString(1,email); 
		ResultSet resultSet1 = preparedStatement.executeQuery();
        if(resultSet1.next()){
        stud_name=resultSet1.getString("user_name");
        }
        %>
           <div class="block">
		<table style="width:800px;">
			<tr>
				<td>
					<div class="assign">
						<b><%=stud_name %></b></div>
					<p>Email : ${result.student_email}</p>
					<p>State : ${result.state}</p>	
					<p> Score : ${result.score}</p>
					
				</td>
				
				<td>
				
					<a href ="QuizResultController?action=REVIEWLECT&quiz_id=${result.quiz_id}&result_id=${result.result_id}&title=<%=title %>"
					class="action review">Review <i class="fa-solid fa-arrow-up-right-from-square"></i></a>
                	<a href="QuizResultController?action=RESULTLECT&quiz_id=${result.quiz_id}&result_id=${result.result_id}" 
                	class="action view">Result <i class="fa-solid fa-arrow-up-right-from-square"></i></a>         
                	</td>
			<tr>
		</table>
	</div>
            
            </c:forEach>


	



</body>
</html>