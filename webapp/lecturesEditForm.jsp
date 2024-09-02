<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random" import="dao.*" import="model.Lect"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
courseDAO cdao=new courseDAO();
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lectures Edit Form</title>
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
  display: flex;
  align-items: center;
}
.header-icons .account i{
  font-size:29px;
	margin-right:15px;
}

/*Pop Up Form*/
.container{
color:white;
  max-width: 800px;
 background: #427D9D;
  width: 800px;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
  border-radius: 0.5em;
  margin-left:360px;
  margin-top:70px;
  margin-bottom:99px;
  height:500px;
 }
.container .text{
  text-align: center;
  font-size: 41px;
  font-weight: 600;
  background:white;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.container form{
  padding: 30px 0 0 0;
}
.container form .form-row{
  display: flex;
  margin: 32px 0;
}
form .form-row .input-data{
  width: 100%;
  height: 40px;
  margin: 0 20px;
  position: relative;
  color:white;
}
form .form-row .textarea{
  height: 70px;
  color:white;
}
.input-data input,
.textarea textarea{
  display: block;
  width: 100%;
  height: 100%;
  border: none;
  font-size: 17px;
  border-bottom: 2px solid rgba(0,0,0, 0.12);
  -webkit-background-clip: text;
 color:white;
}
.input-data input:focus ~ label, .textarea textarea:focus ~ label,
.input-data input:valid ~ label, .textarea textarea:valid ~ label{
  transform: translateY(-20px);
  font-size: 14px;
}
.textarea textarea{
  resize: none;
  padding-top: 10px;
  color:white;
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
  background: #fff;
}
.input-data .underline{
  position: absolute;
  bottom: 0;
  height: 2px;
  width: 100%;
}
.input-data .underline:before{
  position: absolute;
  content: "";
  height: 2px;
  width: 100%;
  background: #07F49E;
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
.form-row .selectbox{
	width:150px;
	color:white;
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
   background:-webkit-linear-gradient(right, #427D9D, #164863, #DDF2FD, #427D9D);
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
/*closecross*/
.popup .close {
   position: absolute;
   right: 400px;
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
 <%
 
 Lect lecture = (Lect)request.getAttribute("lecture");
 %>
  <div style="height:60px;">------------</div>
  
<div class="container popup">
<a href="lectures.jsp" class="close">&times;</a>	   
      <div class="text">
         Lecture Edit Form
      </div>
      <form action="Edit" method="post" enctype="multipart/form-data">
      <input type="hidden" value="${lecture.course_id}" name="prev_course_id"/>
      <c:set var="course_id" value="${lecture.course_id }"/>
         <div class="form-row">
            <div class="input-data">
               <input type="text" name="name" value="${lecture.name}"required>
               <div class="underline"></div>
               <label for="">Name</label>
            </div>
            <div class="input-data">
               <input type="text" name="qualification" value="${lecture.qualification}" required>
               <div class="underline"></div>
               <label for="">Qualification</label>
            </div>
         </div>
         <div class="form-row">
            <div class="input-data">
               <input type="email" name="email" value="${lecture.email}" required>
               <div class="underline"></div>
               <label for="">Email</label>
            </div>
            <div class="input-data">
               <input type="date" name="startDate" style="width:320px;" value="${course.start_date}" required>
               <div class="underline"></div>
               <label for="" style="margin-bottom:;">Start on</label>
            </div>
         </div>
         <div class="form-row" > 
            
			<div class="input-data">
               <input type="date" name="deadLine" style="width:320px;" value="${course.enrollment_deadline }" required>
               <div class="underline"></div>
               <label for="" style="margin-bottom:;">Enrollment Deadline</label>
            </div>
			<div class="photoupload">
			   <label for="">lecturer's photo</label>
				   <input type="file" name="file"/>
				   <br/>
				   <span id="imageName"></span>  
			</div>
       </div>
         <%
int course_id=(int)pageContext.getAttribute("course_id");
String title=cdao.getTitle(course_id);
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;
String merge="No";
try {
   
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningSystem","root","yoonthiri@2004");

    String query = "SELECT title FROM courses where merged='No'";
    stmt = conn.prepareStatement(query);
    rs = stmt.executeQuery();

    StringBuilder options = new StringBuilder();
    
%>
        
			<div class="selectbox" >
               <label for="" style="margin-bottom:;">Course Title</label>              
				<select name="course_name"  required>
				    <option><%=title%></option>
                  <% while (rs.next()) { %>
                      <option><%= rs.getString("title") %></option>
                  <% } %>
                </select>
            </div >
         
         <%
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) { /* ignored */ }
    try { if (stmt != null) stmt.close(); } catch (Exception e) { /* ignored */ }
    try { if (conn != null) conn.close(); } catch (Exception e) { /* ignored */ }
}
%>
         
            <div class="form-row submit-btn">
               <div class="input-data">
                  <div class="inner"></div>
                  <a href="lectures.jsp">
                  <input type="submit" value="Save"></a>
               </div>
            </div>
      </form>
      </div>
      <a href="#" class="close-popup"></a>
</body>
</html>