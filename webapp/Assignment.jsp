<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.*" %>
<%@ page import="model.Material" %>
<%@ page import="java.util.List" import="java.sql.*" import="util.*"%>
<%
    session = request.getSession(); 
    String userEmail = (String) session.getAttribute("stuEmail"); 
    UserDAO udao = new UserDAO();
    String username = udao.getName(userEmail);
    int course_id = (int) session.getAttribute("course_id");
    uploadDao mDAO = new uploadDao();
    
    List<Material> matList = mDAO.getforAssignment(course_id);
    pageContext.setAttribute("mList", matList, PageContext.PAGE_SCOPE);
    
%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8" />
<title>Assignment Student</title>
<script>
function add(mat_id) {
                window.location.href="SubmissionForm.jsp?mat_id="+mat_id;
}
function miss(){
	alert("You missed Assignment!You are not available to make submission.");
}
function viewSubmission(id){
	window.location.href="ViewSubmission.jsp?mat_id="+id;

}
</script>
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
  background:#E6E6E6;
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
  background:#3D56B2;
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
.container{
margin-top:40px;
}
.block{
	background-color:white/*#71c7ec*/;
	height:150px;
	width:900px;
	border-radius:30px;
	margin-left:auto;
	margin-right:auto;
	margin-top:15px;
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
	margin-left:40px;
	margin-right:30px;
	font-size:20px;
	width:500px;
  	white-space: nowrap; /* Prevents text from wrapping to the next line */
  	overflow: hidden; /* Hides the overflow text */
  	text-overflow: ellipsis;
  	padding-right:20px;
}
.block p{
	margin-left:40px;
	margin-top:5px;
}
h1{
margin-left:320px;
margin-top:10px;
}
.fa-download{
	margin-left:30px;
	margin-right:20px;
	font-size:25px;
	color:black;
}
.fa-download:hover{
	color:#14279B;
}
.fa-arrow-up-right-from-square{
	font-size:25px;
	color:black;
}
.fa-arrow-up-right-from-square:hover{
	color:#14279B;
}

.fa-paperclip{
	font-size:25px;
	
	color:black;
}
.fa-paperclip:hover{
	color:#14279B;
}
.fa-triangle-exclamation{
   font-size:25px;
	
	color:red;
}
.fa-triangle-exclamation:hover{
color:pink;
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
      <li><a href="#"><i class="fa-solid fa-calendar-week"></i>Assignment</a></li>
       <li><a href="QuizStudent.jsp"><i class="fa-solid fa-calendar-week"></i>Quiz</a></li>
       
      <li><a href="Announcements.jsp"><i class="fa-solid fa-bullhorn"></i>Announcements</a></li>
      <li><a href="changePwd.jsp"><i class="fa-solid fa-sliders"></i>Change Password</a></li>
      <li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
    </ul>  
  </div>
    
                
  <div class="container">
       
       <c:forEach items="${mList}" var="ml">
       <c:set var="mat_id" value="${ml.id}" />
       <%
boolean submissionExists = false;
PreparedStatement statement = null;
ResultSet resultSet = null;
PreparedStatement statement1 = null;
ResultSet resultSet1 = null;
Connection connection=DBConnection.openConnection();
int mat_id=(int)pageContext.getAttribute("mat_id");
int score=0;
try {
    String query = "SELECT EXISTS (SELECT 1 FROM submission WHERE student_email = ?  AND id = ?)";
    statement = connection.prepareStatement(query);
    statement.setString(1, userEmail);
    statement.setInt(2,mat_id );
    resultSet = statement.executeQuery();

    if (resultSet.next()) {
        submissionExists = resultSet.getBoolean(1);
    }
} finally {
    
    if (resultSet != null) {
        resultSet.close();
    }
    if (statement != null) {
        statement.close();
    }
}
if (submissionExists) {
    String query1 = "SELECT score FROM submission WHERE student_email = ? AND id = ?";
    statement1 = connection.prepareStatement(query1);
    statement1.setString(1, userEmail);
    statement1.setInt(2, mat_id);
    resultSet1 = statement1.executeQuery();

    if (resultSet1.next()) {
       score = resultSet1.getInt("score");
    }
}
pageContext.setAttribute("submissionExists", submissionExists);
pageContext.setAttribute("score", score);
Boolean deadlineReached = mDAO.DeadlineReached(mat_id);
pageContext.setAttribute("deadlineReached",deadlineReached);
%>
       <div class="block">
		<table style="width:800px;">
			<tr>
				<td>
					<div class="assign">
						<b>${ml.title}</b></div>
					<p>Deadline Date : ${ml.deadline}</p>
			<c:choose>
                <c:when test="${not submissionExists}">
                   <p> <a href="#"> Not Submitted Yet</a></p>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${submissionExists and pageContext.getAttribute('score') == 0}">
                           <p> <a href="#">Submitted For Evaluation</a><p>
                        </c:when>
                        <c:otherwise>
                            <p><a href="#">Evaluated</a></p>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>	
				</td>
				
				<td>
					<a href = "${pageContext.request.contextPath}/MaterialLectureController?action=DOWNLOAD&id=${ml.id}&title=${ml.title}&ftype=${ml.ftype}" class="button1">              
                    <i class="fa-sharp fa-solid fa-download fa-sm"></i></a>
					<c:choose>
                    <c:when test="${not submissionExists && not deadlineReached}">
                      <a href="#popup" onclick="add(${ml.id})" class="button1" title="Add Submission"><i class="fa-solid fa-paperclip"></i></a>
                   </c:when>
                   <c:when test="${not submissionExists && deadlineReached}">
                      <a href="#" class="button1" onclick="miss()"><i class="fa-solid fa-triangle-exclamation"></i></a>
                   </c:when>
                  <c:when test="${submissionExists}">
                      <a href="#" onclick="viewSubmission(${ml.id})" class="button1" title="View Submission"><i class="fa-solid fa-arrow-up-right-from-square"></i></a>
                  </c:when>
    
</c:choose>
				</td>
			<tr>
		</table>
	</div>
    </c:forEach>
            </div>
            

</body>
</html>