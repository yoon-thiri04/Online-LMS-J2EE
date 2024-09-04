<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import="dao.*" %>
<%@ page import="model.Material"  import="util.DBConnection" import ="java.sql.Connection" import="java.sql.*"%>
<%@ page import="java.util.List" %>
    <% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);%>
<%
int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
submitDAO sdao=new submitDAO();
List<Material> matList=sdao.get(course_id,"Assignment");
pageContext.setAttribute("mList", matList,PageContext.PAGE_SCOPE);
int total=matList.size();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submission of all Assignment Lecture</title>

</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>
<script>
function redirectToDetails(id, title) {
    window.location.href = "SubmissionLectureController?action=View&id="+id;
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
	margin-left:270px;
	margin-top:20px;
	display:flex;
	align-items:center;
}
#title p{
	font-weight:500;
	font-size:25px;
	width:500px;
}.main-body {
    display: flex;
    flex-wrap: wrap;
    margin-left:250px;
}

.card-single{
	flex: 0 0 calc(27.333% - 20px); /* Adjust the width according to your preference */
    margin: 10px;
    padding: 20px;
    box-sizing: border-box;
	justify-content:space-between;
	background:#fff;
	padding:0.8rem;
	border-radius:15px;
	cursor:pointer;
	width:200px;
	transition: all 0.3s;
	height:170px;
	border: 1px solid #36622B;
   
}
.card-single div:last-child span{
	font-size:3rem;
	
}
.card-single  p{
	color:#000;
	
}
.card-single div:first-child span,h2{
	color:#000;
	padding-bottom:3px;
}
.card-single:hover {
	background-color:#427D9D;
}
.card-single:hover p {
	color:white
}
.card-single:hover div:first-child span{
	color:white;
}
.card-single:hover div:first-child h2{
	color:white;
    
}
.card-single:hover div:last-child span{
	color:white;
}
html{
	line-height: 1.15;
  	-webkit-text-size-adjust: 100%;
  	box-sizing: border-box;
}

 
.viewmaterial {
    padding: 10px 30px;
    color:black;
    text-decoration: none;
    border: 1px solid #36622B;
    border-radius: 4px;
    margin-top:30px;
    transition: all 0.3s ease 0s;
    background:white;
}

.viewmaterial:hover {
    color: #fff;
    background:#427D9D;
    border: 1px solid #748dff;
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

.fa-stack-overflow{
font-size:20px;
font-weight:500;
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
	
	 <p style="text-align:center;">There is no Assignment Submissions yet! <i class="fa-brands fa-stack-overflow"></i></p>
	 
	 </div>
	<%}else{ %>
  <div id="title">
    <p>Assignment Submissions</p>
   
    </div>
    <div class="main-body">
    
	
	<c:forEach items="${mList}" var="ml">
	
		<div class="card-single">
    			<div>
    				<h2>${ ml.title}</h2>
    				 <c:set var="id" value="${ml.id}" />
    				  <% int idValue = (Integer)pageContext.getAttribute("id");
    				  
    				   int tot=0;
                       String sql= "select count(*) as total from submission where id="+idValue;
	                   Connection connection = DBConnection.openConnection();
	                   Statement statement = connection.createStatement();
	                   ResultSet resultSet = statement.executeQuery(sql);
                       if(resultSet.next()){
	                   tot =resultSet.getInt("total");
    }
%>
    				<p>Submission made - <%=tot %></p>
    				<button type="button" class="viewmaterial" onclick="redirectToDetails(${ml.id})">View Details</button>
</div>
    			
    	</div>
    	
</c:forEach>   
<%} %>
 
 </div>
</body>
</html>