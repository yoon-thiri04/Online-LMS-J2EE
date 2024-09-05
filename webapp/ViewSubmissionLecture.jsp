<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.*" %>
<%@ page import="model.Submission" %>
<%@ page import="java.util.List" import="java.sql.*" import="util.*"%>
    
<% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 

lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);

int sub_id=Integer.parseInt(request.getParameter("s_id"));
submitDAO sdao=new submitDAO();
Submission mySubmission=sdao.getmySumission(sub_id);
int mat_id=mySubmission.getId();

pageContext.setAttribute("mySubmission", mySubmission);
int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
String title=null;
Connection connection=DBConnection.openConnection();
String sql = "SELECT title FROM material WHERE id = ?";
PreparedStatement statement = connection.prepareStatement(sql);
statement.setInt(1, mat_id);
ResultSet resultSet = statement.executeQuery();

if(resultSet.next()) {
     title = resultSet.getString("title");
    } else {
    System.out.println("No course found with course_id " + course_id);
}
%>
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
body {
   background-color: #DDF2FD;
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
    background:#427D9D;
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
  display: flex;
  align-items: center;
}
.header-icons .account i{
  font-size:29px;
	margin-right:15px;
}
.header-icons .account img{
  width: 35px;
  height: 35px;
  margin-right:10px;
  cursor: pointer;
  border-radius: 50%;
}
/*Pop Up Form*/
.container{
  color:white;
  max-width: 700px;
  background:#427D9D;
  width: 800px;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
  border-radius: 0.5em;
  margin-left:420px;
  margin-top:70px;
  margin-bottom:99px;
  height:470px;
 }
.container .text{
  text-align: center;
  font-size: 35px;
  font-weight: 600;
  background:white;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  color:white;
}

.grid-item .title{
	margin-top:30px;
	margin-left:11px;
	margin-bottom:20px;
}
.grid-item table td{
	text-align:left;
	
	
	color:white;
}
.grid-item table{
	margin-bottom:10px;
	padding:20px;
	width:700px;
}
.grid-item table tr{
	height:30px;
}

.grid-item table td a{
color:skyblue;
}
.grid-item table td a:hover{
color:blue;
}.popup .close {
   position: absolute;
   right: 450px;
   top: 150px;
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
</style>
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
	    <div id="popup" class="container popup">
    	<a href="SubmissionLecture.jsp?id=<%=mySubmission.getId() %>" class="close">&times;</a>
    	<div class="text">
      		Submission Status
        </div>
        
		 <div class="grid-item">
               <h2 class="title"><%=title%></h2>
                    <table>
                        <tr>
                          <td><b>Name</b></td>
                           <td><%=mySubmission.getStudent_name() %></td>
                           </tr>
                           <tr>
                            		<td><b>Submission Status</b></td>
                            		<td><%=mySubmission.getStatus()%></td>
                            	</tr>
                            	<tr>
                            		<td><b>Score</b></td>
                            		<c:choose>
    <c:when test="${mySubmission.score eq 0}">
     <td>-</td>
    </c:when>
    <c:otherwise>
        <td><%=mySubmission.getScore()%></td>
    </c:otherwise>
</c:choose>
                
                            	</tr>
                            	<tr>
                            		<td><b>File</b></td>
                            		<td ><a href = "${pageContext.request.contextPath}/SubmissionController?action=DOWNLOAD&id=<%=mySubmission.getSubmission_id() %>&title=<%=mySubmission.getTitle() %>&f_type=<%=mySubmission.getF_type() %>"><%=mySubmission.getTitle() %></a>
                	</td>
                            	</tr>
                            	<tr>
                            		<td><b>Submission Made</b></td>
                            		<td><%=mySubmission.getSubmission_date() %></td>
                            	</tr>
                            	<tr>
                            	
                          <td><b>Submission Comment</b></td>
                           <td><c:choose>
    <c:when test="${mySubmission.comment eq Null}">
     No Comment
    </c:when>
    <c:otherwise>
       <%=mySubmission.getComment() %>
    </c:otherwise>
</c:choose></td>
                           </tr>
                            </table>
                           
                        </div>
                        </div>
  	<a href="Material.jsp?course_id=<%=(int)session.getAttribute("course_id") %>" class="close-popup"></a>
 
</body>
</html>
