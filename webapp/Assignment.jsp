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
	padding-right:90px;
	border:2px solid black;
	background-color:#C6E377 ;
	height:60px;
}
.row table td{
font-size:18px;
padding:15px;
}
 .row table td:hover{
  background-color:#C6E377 ;
  }
.row table .twotd td{
 font-size:17px;
 height:50px;
 padding-right:80px;
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
      <li><a href="#"><i class="fa-solid fa-calendar-week"></i>Assignment</a></li>
       <li><a href="QuizStudent.jsp"><i class="fa-solid fa-calendar-week"></i>Quiz</a></li>
       
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
            <h4>Assignment</h4>
            </th>
           
            <th style="padding-right:80px;padding-bottom:15px;" ></th>
            <th >
            </th>
          </tr>
            
           <tr>
           
            <td class="th"><h4>Title</h4></td>
            <td class="th"><h4>Deadline</h4></td>
            
            <td class="th"><h4>Status</h4></td>
            
            <td class="th"><h4>Operations</h4></td>
         
           </tr>
            <c:forEach items="${mList}" var="ml">
            <c:set var="mat_id" value="${ml.id}" />
            
              <tr class="twotd">
				<td>${ml.title}</td>
                <td>${ml.deadline}</td>
                
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
                <td>
                 
            <c:choose>
                <c:when test="${not submissionExists}">
                   <a href="#"> Not Submitted Yet</a>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${submissionExists and pageContext.getAttribute('score') == 0}">
                            <a href="#">Submitted For Evaluation</a>
                        </c:when>
                        <c:otherwise>
                            <a href="#">Evaluated</a>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
    
             </td>    
                <td>
                	<a href = "${pageContext.request.contextPath}/MaterialController?action=DOWNLOAD&id=${ml.id}&title=${ml.title}&ftype=${ml.ftype}" class="button1">Download</a>
                	<c:choose>
    <c:when test="${not submissionExists && not deadlineReached}">
        <a href="#" onclick="add(${ml.id})" class="button1">Add Submission</a>
    </c:when>
    <c:when test="${not submissionExists && deadlineReached}">
        <a href="#" class="button1" onclick="miss()">Missing Submission</a>
    </c:when>
    <c:when test="${submissionExists}">
        <a href="#" onclick="viewSubmission(${ml.id})" class="button1">View Submission</a>
    </c:when>
    
</c:choose>
                </td>
             </tr>
            </c:forEach>
          </table>
          </div>
</div>

</body>
</html>