<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="util.DBConnection"
    import="java.sql.Connection" import="dao.*" 
    import="java.sql.*" import="model.*"  import="java.util.*" import="java.time.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

session = request.getSession();
String username=null;
String userEmail = (String) session.getAttribute("userEmail"); 

lectureDAO udao=new lectureDAO();
username=udao.getNameLecture(userEmail);

int quiz_id=(int)request.getAttribute("quiz_id");
String quiz_title=null;
String sql= "select title from quiz where id="+quiz_id;
Connection connection = DBConnection.openConnection();
Statement statement = connection.createStatement();
ResultSet resultSet = statement.executeQuery(sql);
if(resultSet.next()){
quiz_title=resultSet.getString("title");
}

int result_id=(int)request.getAttribute("result_id");
quizDAO qdao=new quizDAO();
QuizResult result=qdao.getQuizResult(result_id);
pageContext.setAttribute("result", result);

int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
String title=null;
Connection connection1=DBConnection.openConnection();
String sql1 = "SELECT title FROM courses WHERE course_id="+course_id;
Statement statement1 = connection1.createStatement();
ResultSet resultSet1 = statement1.executeQuery(sql1);
if(resultSet1.next()) {
     title = resultSet1.getString("title");
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
	/*position:fixed;*/
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
  font-size:39px;
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
  margin-top:30px;
  margin-bottom:99px;
  height:450px;
 }
.container .text{
  text-align: center;
  font-size: 29px;
  font-weight: 500;
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
color:black;
}
.grid-item table td a:hover{
color:blue;
}.popup .close {
   position: absolute;
   right: 450px;
   top: 160px;
   padding: 5px;
   color: white;
   transition: color .3s;
   font-size: 2em;
   line-height: 1.5;
   font-weight: 700;
}
.popup .close:hover {
   color:skyblue;
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
     <a href="#"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a></div>
    <div class="header-icons">
    	<div class="account">
	        <i class="fa-solid fa-circle-user"></i>
	        <h3><%= username %></h3>
    	</div>
    </div>
  </header>
 
  <div style="height:60px;"></div>
	    <div id="popup" class="container popup">
    	<a href="QuizResultController?action=LectureView&quiz_id=<%=result.getQuiz_id() %>" class="close">&times;</a>
    	<div class="text">
      		Summary of previous Quiz attempt
        </div>
        
		 <div class="grid-item">
               <h2 class="title"><%=quiz_title%></h2>
                    <table>
                        <tr>
                          <td><b>Name</b></td>
                          <%
                          String email=result.getStudent_email();
                          String stud_name=null;
                          String sql_a= "select user_name from userlist where email=?";
                          Connection connection_a = DBConnection.openConnection();
                          PreparedStatement preparedStatement_a = connection_a.prepareStatement(sql_a);
                  		  preparedStatement_a.setString(1,email); 
                  		  ResultSet resultSet_a = preparedStatement_a.executeQuery();
                          if(resultSet_a.next()){
                          stud_name=resultSet_a.getString("user_name");
                          }
                          %>
                           <td><%=stud_name %></td>
                           </tr>
                           <% String start_time=qdao.formatDateTime(result.getStartTime());
                           String end_time=qdao.formatDateTime(result.getEndTime());
                           %>
                           <tr>
                              <td><b>Started On</b></td>
                            		<td><%=start_time %></td>
                            	</tr>
                           <tr>
                              <td><b>State</b></td>
                            		<td><%= result.getState() %></td>
                            	</tr>
                            	<tr>
                            	<td><b>Completed on</b></td>
                            		<td><%=end_time
                            		%></td>
                            	</tr>
                           <tr>
                            	<td><b>Time Taken</b></td>
                            		<td><%= result.getTime_taken() %></td>
                            	</tr>
                <%
        int idValue = result.getQuiz_id();
		  
		int tot=0;
        String sql2= "select total_quizes from quiz where id=?";
        Connection connection2 = DBConnection.openConnection();
        PreparedStatement preparedStatement = connection2.prepareStatement(sql2);
		preparedStatement.setInt(1,idValue); 
		ResultSet resultSet2 = preparedStatement.executeQuery();
        if(resultSet2.next()){
        tot =resultSet2.getInt("total_quizes");
        }
        %>
                            	<tr>
                            		<td><b>Score</b></td> 		
                                   <td><%=result.getScore() %>/<%=tot %></td>
                            	</tr>
                            </table>
                           
                        </div>
                        </div>
  	<a href="QuizStudent.jsp?" class="close-popup"></a>
 
</body>
</html>