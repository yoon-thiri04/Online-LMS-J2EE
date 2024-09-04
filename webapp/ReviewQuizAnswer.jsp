<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*" import="model.*" import="java.sql.*" import="util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    session = request.getSession(); 
    String username=null;
    
    String userEmail = (String) session.getAttribute("stuEmail"); 
    UserDAO udao=new UserDAO();
    username=udao.getName(userEmail);
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
  font-family: Poppins, Helvetica, sans-serif;
}
body{
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
 	margin-top:-20px;
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

.correct-answer{
    border: 2px solid white;
    box-shadow: 5px 30px 56.1276px rgb(50 50 55 / 12%);
    border: 1px solid #111;
    border-radius: 15px 15px ;
    cursor: pointer;
    background-color: #DDF2FD; 
    padding-left:50px;
    font-size:17px;
    padding-top:20px;
    margin-top:10px;
    height:70px;
    width:880px;
}
.grid-container{
    margin-left:350px;
    margin-top:20px;
    margin-bottom:20px;
    padding-bottom:10px;
    
   }
.grid-item .quest h3{
font-size:18px;
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
    padding-top:15px;
    height:300px;
    width:880px;
    background:#fff;
}
.grid-item #cAns{
margin-top:20px;
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
	font-weight:500;
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
       
    }
    input[type="text"]:focus {
        border-color: #4CAF50;
        outline: none;
    }
.input-data{
margin-left:900px;

}
.input-data  .pretty-button {
         background-color: #427D9D;  
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
         background-color: #164863;
    }

   
.input-data  .pretty-button:focus {
         outline: none; 
        box-shadow: 0 0 5px #4CAF50;
        }
        
.input-data  .pretty-button:active {
         background-color: #427D9D;
        box-shadow: 0 5px #666; 
        transform: translateY(4px); /* Move the button down a bit */
    }
.input-container .correct-input {
            background-color: #387F39;
            color: white;
        }
.input-container .incorrect-input {
            background-color:  #BF3131;
            color: white;
        }
  .correct {
            color: #387F39;
  }
        .incorrect {
            color:  #BF3131;
        }
</style>
<body>
<header class="header">
	    <div class="logo">
	      <a href="#"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a></div>
	    
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
    <p><%=course_title%><br><%=request.getAttribute("title") %>  Total Quizzes - <%=request.getAttribute("total") %></p>      
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