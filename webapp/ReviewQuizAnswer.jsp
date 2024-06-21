<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*" import="model.*" import="java.sql.*" import="util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    session = request.getSession(); 
    String username=null;
    
    String userEmail = (String) session.getAttribute("stuEmail"); 
    lectureDAO udao=new lectureDAO();
    username=udao.getNameLecture(userEmail);

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
<title> Re View Quiz Result Answers </title>
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
 	margin-top:-20px;
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


.grid-container{
    margin-left:370px;
    margin-top:20px;
    margin-bottom:30px;
    padding-bottom:20px;
   }
.grid-item .quest h5{
margin-bottom:10px;
font-size:16px;
}
.correct-answer{
    border: 2px solid white;
    box-shadow: 5px 30px 56.1276px rgb(50 50 55 / 12%);
    border: 1px solid #111;
    border-radius: 15px 15px ;
    cursor: pointer;
    background-color:#F6FAB9; 
    padding-left:50px;
    font-size:large;
    padding-top:20px;
    margin-top:10px;
    height:70px;
    
    width:880px;
}
.grid-item{
   display:flex;
	border: 2px solid white;
    box-shadow: 5px 30px 56.1276px rgb(50 50 55 / 12%);
    border: 1px solid #111;
    border-radius: 15px 30px ;
    transition: all .3s cubic-bezier(.445, .05, .55, .95);
    background-color:#E6FF94;
    transition: all 1s ease 0s;
    cursor: pointer;
    padding-left:50px;
    padding-top:20px;
    height:280px;
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
	margin-top:120px;	
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
margin-left:900px;

}
.input-data  .pretty-button {
        background-color: #4CAF50; 
        border: none; 
        font-weight:bold;
        font-family: font-family: Arial, Helvetica, sans-serif;
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
        background-color: #388E3C;
    }

   
.input-data  .pretty-button:focus {
        outline: none; 
        box-shadow: 0 0 5px #4CAF50;
        }
        
.input-data  .pretty-button:active {
        background-color: #3e8e41;
        box-shadow: 0 5px #666; /* Shadow effect when button is pressed */
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
  max-width: 500px;
  width: 500px;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
  border-radius: 0.5em;
  background: hsla(280, 84%, 41%, 1);

background: linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);

background: -moz-linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);

background: -webkit-linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);
filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#8711c1", endColorstr="#2472fc", GradientType=1 );
}
.popup {
   position: fixed;
   padding: 10px;
   max-width: 820px;
   border-radius: 0.5em;
   top: 50%;
   left: 50%;
   color: #000;
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
   color: #000;
   transition: color .3s;
   font-size: 2em;
   line-height: 1.5;
   font-weight: 700;
}
.popup .close:hover {
   color: #f00;
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
.input-container .correct-input {
            background-color: green;
            color: white;
        }
.input-container .incorrect-input {
            background-color: red;
            color: white;
        }
  .correct {
            color: green;
  }
        .incorrect {
            color: red;
        }
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
    
    <% int quizNo=0;
    double Mark=0.00;
    int score=0;
    String flag="Incorrect";
    %>
    <div style="margin-top:80px;">
         <input type="hidden" name="id" value="<%=request.getAttribute("quiz_id")%>">
    
    <c:forEach items="${quizzList}" var="quiz">
    <c:set var="id" value="${quiz.id }"/>
    <%quizNo+=1; %>
    <div class="grid-container">
       <div id="b1" class="grid-item">
          <div class="quest"> <h3>Question <%=quizNo %></h3><br>
            <h3>${quiz.question}</h3><br>
            <c:set var="result" value="${answerList[quiz.quiz_id]}" />
            <c:choose>
            <c:when test="${quiz.type eq 'multiple'}">
                <c:forEach items="${quiz.answer}" var="answer">
                <c:choose>
                <c:when test="${result != null && result.answer == answer}">
                    <c:if test="${result.isCorrect == 'T'}">
                        <div class="correct">
                            <input type="radio" name="quiz_${quiz.quiz_id}" value="${answer}" checked disabled><strong> ${answer}</strong> <br><br>
                        </div>
                        <% Mark=1.00;
                        score+=1;
                        flag="Correct";
                        %>
                    </c:if>
                      <c:if test="${result.isCorrect == 'F'}">
                        <div class="incorrect">
                            <input type="radio" name="quiz_${quiz.quiz_id}" value="${answer}" checked disabled> <strong>${answer}</strong> <br><br>
                        </div>
                       <% Mark=0.00;
                    flag="Incorrect";
                    %>
                    </c:if>
                </c:when>
                 <c:otherwise>
                    <input type="radio" name="quiz_${quiz.quiz_id}" value="${answer}" disabled> ${answer} <br><br>      
                </c:otherwise>
                </c:choose>
                </c:forEach>
            </c:when>
            <c:when test="${quiz.type eq 'true' }">
                 <c:choose>
                    <c:when test="${result != null && result.answer == 'True'}">
                 		<c:if test="${result.isCorrect == 'T'}">
                    		<div class="correct">
                              <input type="radio" name="quiz_${quiz.quiz_id}" value="True" checked disabled><strong> True</strong><br><br>
                   			 </div>
                    		 <% Mark=1.00;
                    		 score+=1;
                    		 flag="Correct";
                    		 %>
                         </c:if>
                		<c:if test="${result.isCorrect == 'F'}">
                    		<div class="incorrect">
                        	 <input type="radio" name="quiz_${quiz.quiz_id}" value="True" checked disabled> <strong>True</strong><br><br>
                            </div>
                            <% Mark=0.00;
                            flag="Incorrect";
                    %>
                        </c:if>
                   <input type="radio" name="quiz_${quiz.quiz_id}" value="False" disabled> False<br><br>
                 </c:when>
            <c:when test="${result != null && result.answer == 'False'}">
            <input type="radio" name="quiz_${quiz.quiz_id}" value="True" disabled>True<br><br>
          
              <c:if test="${result.isCorrect == 'T'}">
                    <div class="correct">
                        <input type="radio" name="quiz_${quiz.quiz_id}" value="False" checked disabled><strong>False</strong><br><br>
                    </div>
                    <% Mark=1.00;
                    score+=1;
                    flag="Correct";
                    %>
                </c:if>
                <c:if test="${result.isCorrect == 'F'}">
                    <div class="incorrect">
                        <input type="radio" name="quiz_${quiz.quiz_id}" value="False" checked disabled><strong>False</strong><br><br>
                    </div>
                    <% Mark=0.00;
                    flag="Incorrect";
                    %>
                </c:if>
              </c:when>
              <c:otherwise>
              <input type="radio" name="quiz_${quiz.quiz_id}" value="True" checked disabled>True<br><br>
              <input type="radio" name="quiz_${quiz.quiz_id}" value="False" checked disabled> False<br><br> 
              <% Mark=0.00;
                    flag="Incorrect";
                    %>         
              </c:otherwise>
        </c:choose>
            </c:when>
            <c:otherwise>
            <c:choose>
                <c:when test="${result != null}">
                   <c:if test="${result.isCorrect == 'T'}">
                  <div class="input-container">
                  <input type="text" name="quiz_${quiz.quiz_id}" value="${result.answer}" class="correct-input">
                  </div>
                  <% Mark=1.00; 
                  score+=1;
                  flag="Correct";
                  
                  %>
                  </c:if>
                  <c:if test="${result.isCorrect=='F'}">
                  <div class="input-container">
                  <input type="text" name="quiz_${quiz.quiz_id}" value="${result.answer}" class="incorrect-input">
                  </div>
                  <% Mark=0.00;
                    flag="Incorrect";
                    %>
                  </c:if>
                  </c:when>
                  <c:otherwise>
                  <input type="text" name="quiz_${quiz.quiz_id}" disabled class="incorrect-input">
                  <% Mark=0.00;
                    flag="Incorrect";
                    %>
                  </c:otherwise>
                  </c:choose>
            </c:otherwise>
            </c:choose>
           </div>
           <div class="ahref">
           <p style="font-weight:bold;font-size:large;"><strong><%=flag %></strong></p>Mark <%=Mark %> out of 1.0<br>
           </div></div>
           <div class="correct-answer">
           The correct answer is <b><i>"${quiz.correct_answer}"</i></b>
           </div>
        </div>
        </c:forEach>
        <%
        int idValue = (Integer)pageContext.getAttribute("id");
		  
		int tot=0;
        String sql1= "select total_quizes from quiz where id=?";
        Connection connection1 = DBConnection.openConnection();
        PreparedStatement preparedStatement = connection1.prepareStatement(sql1);
		preparedStatement.setInt(1,idValue); 
		ResultSet resultSet1 = preparedStatement.executeQuery();
        if(resultSet1.next()){
        tot =resultSet1.getInt("total_quizes");
        }
        %>
        <div class="input-data">
        <a href="QuizStudent.jsp" class="pretty-button">Back</a>
        <div class="pretty-button">Total Score : <%=score %> / <%=tot %></div>
    </div>
        <br><br>
       </div>
</body>
</html>