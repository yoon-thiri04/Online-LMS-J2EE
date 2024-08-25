<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*" import="util.DBConnection" import ="java.sql.Connection" import="java.sql.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
     <% 
session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
lectureDAO udao=new lectureDAO();
String username=udao.getNameLecture(userEmail);
int id=(int)session.getAttribute("quiz_id");
String action=(String)request.getAttribute("action");
int total=0;
try{String sql= "select count(*) as total from quizz where id="+id;
Connection connection = DBConnection.openConnection();
Statement statement = connection.createStatement();
ResultSet resultSet = statement.executeQuery(sql);
if(resultSet.next()){
total =resultSet.getInt("total");
}
}catch(SQLException e) {
	e.printStackTrace();
	}

String quiz_title=null;

String sql= "select title from quiz where id="+id;
Connection connection = DBConnection.openConnection();
Statement statement = connection.createStatement();
ResultSet resultSet = statement.executeQuery(sql);
if(resultSet.next()){
quiz_title=resultSet.getString("title");
} %>
 <!DOCTYPE html>
<html>
<head> 

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
   background-color:#E6E6E6;
   color:black;
   line-height: 1.5;  
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
  max-width: 820px;
  background: #3D56B2;
  width: 700px;
  padding: 25px 40px 10px 40px;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
  border-radius: 0.5em;
  margin-left:410px;
  margin-top:40px;
  margin-bottom:79px;
  height:550px;
  /*background: hsla(270, 94%, 25%, 1);
  background: linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);
  background: -moz-linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);
  background:  -webkit-linear-gradient(45deg, hsla(280, 84%, 41%, 1) 0%, hsla(218, 97%, 56%, 1) 100%);
 filter: progid: DXImageTransform.Microsoft.gradient( startColorstr="#8711c1", endColorstr="#2472fc", GradientType=1 );*/
}
.container .text{
  text-align: center;
  font-size: 26px;
  font-weight: 700;
  background:white;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  color:white;
}
.container form{
  padding: 30px 0 0 0;
  color:white;
}
.container form .form-row{
  display: flex;
  margin: 32px 0;
  color:white;
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
  width:615px;
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

.submit-btn .input-data{
  overflow: hidden;
  height: 45px!important;
  width: 23%!important;
  color:white;
}
.submit-btn .input-data .inner{
  height: 100%;
  width: 300%;
  position: absolute;
  left: -100%;
  background:-webkit-linear-gradient(right, #42047e, #32c4c0, #6f7bf7, #42047e);
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
  padding-left:10px;
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
   right: 480px;
   top: 120px;
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
.form-row .date{
  width:360px;
  margin-left:20px;
  color:white;
}
.form-row .photoupload{
  width:360px;
  margin-left:20px;
  color:white;
}
.input-data .underlineE{
  position: absolute;
  bottom: 0;
  height: 2px;
  width:290px;
}
.input-data .underlineE:before{
  position: absolute;
  content: "";
  height: 2px;
  width: 100%;
  background: #07F49E;
  transform: scaleX(0);
  transform-origin: center;
  transition: transform 0.3s ease;
}
.input-data input:focus ~ .underlineE:before,
.input-data input:valid ~ .underlineE:before,
.textarea textarea:focus ~ .underlineE:before,
.textarea textarea:valid ~ .underlineE:before{
  transform: scale(1);
}


</style>

<meta charset="ISO-8859-1">
<title>Quiz Multiple Choice Creation</title>
</head>
<body>
<header class="header">
    <div class="logo">
      <a href="#"><b>Smart Learn</b></a>
    </div>
    <div class="header-icons">
    	<div class="account">
	         <i class="fa-solid fa-circle-user"></i>
	        <h3><%= username %></h3>
    	</div>
    </div>
    
  </header>
   <div style="height:60px;"></div>
	    <div id="popup" class="container popup">
	    <%if(action!=null && action.equalsIgnoreCase("Edit")){ %>
	     <a href = "${pageContext.request.contextPath}/QuizLectureController?action=View&id=<%=id  %>" class="close">
                	&times;</a>
	    <%}else{ %>
	    <a href="QuizTypeChoose.jsp" class="close">&times;</a>
	    <%} %>
	    
    	<div class="text">
    	     <%if(action!=null && action.equalsIgnoreCase("Edit")){ %>
    	     <h3>Update Multiple Choice Quiz</h3>
    	     <h5>Enter "-" for Extra-Options</h5>
    	     <%}else{ %>
      		<h3>Create  Multiple Choice Quiz</h3>
      		<h5>Enter "-" for Extra-Options</h5>
      		<%} %>
        </div>
        <div class="text1">
      		<h4 style="text-align:center;">You have created <%=total %> quizzes for <%=quiz_title %>.</h4>
        </div>
		<form action="QuizMultipleAndTFContrller?action1=<%= action %>" method="post" >
		<input type="hidden" name="qtype" value="multiple">
		<input type="hidden" name="quizz_id" value="${quiz.quiz_id}">
		
		     <div class="form-row">
	        	<div class="input-data">
		            <input type="text" name="question" value="${quiz.question}" required/>
		            <div class="underline"></div>
		            <label for="">Question</label>
	            </div>
         	</div>
         	<div class="form-row">
	        	<div class="input-data">
	        	<input type="text" name="option1" value="${quiz.answer.size()>0 ? quiz.answer[0] : ''}" required/>
		            <div class="underlineE"></div>
		            <label for="">Option-1</label>
	            </div>
	            <div class="input-data">
		            <input type="text" name="option2" value="${quiz.answer.size() >1? quiz.answer[1] : ''}" required/>
		            <div class="underlineE"></div>
		            <label for="">Option-2</label>
	            </div>
         	</div>
         	
         	<div class="form-row">
	        	<div class="input-data">
		            <input type="text" name="option3" value="${quiz.answer.size() > 2 ? quiz.answer[2] : '-'}" required/>
		            <div class="underlineE"></div>
		            <label for="">Option-3</label>
	            </div>
	            <div class="input-data">
		            <input type="text" name="option4" value="${quiz.answer.size() > 3 ? quiz.answer[3] : '-'}" required/>
		            <div class="underlineE"></div>
		            <label for="">Option-4</label>
	            </div>
         	</div>
			<div class="form-row">
	        	<div class="input-data">
               <label for="" style="margin-bottom:;">Choose correct option(answer):</label>
                </div>              
				<select name="correctAns"  required>
                   <option value="op1">Option-1</option>
                      <option value="op2" >Option-2</option>
                      <option value="op3">Option-3</option>
                      <option value="op4">Option-4</option>
                      
                </select>  </div >
                <%if(action!=null && action.equalsIgnoreCase("Edit")){ %>
                 <div class="form-row submit-btn">
				<div class="input-data">
	                <div class="inner"></div>
	                <input type="submit" name="action" value="Save Quiz"/>
                </div>
             
          </div>
          <%}else{ %>
           <div class="form-row submit-btn">
				<div class="input-data">
	                <div class="inner"></div>
	                <input type="submit" name="action" value="Save Quiz"/>
                </div>
                
                <div class="input-data">
	                <div class="inner" ></div>
	                 <input type="submit" name="action"  value="Save & End"/>
                </div>
                
          </div>
          <%} %>
		</form>
	</div> 
</body>
</html>