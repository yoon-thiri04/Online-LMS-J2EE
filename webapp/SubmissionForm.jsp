<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*" import="javax.servlet.http.HttpServlet"%>
<%

session = request.getSession(); 
String userEmail = (String) session.getAttribute("stuEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);


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
   background: url(https://i.pinimg.com/736x/fd/78/c7/fd78c7534ed69af190d268a14e2f6a9a.jpg);
   background-size: cover;
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
  background: #427D9D;
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
  font-size: 41px;
  font-weight: 600;
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
  width:320px;
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
  width: 25%!important;
  color:white;
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
   right: 420px;
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
   right:20;
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
.container .text{
  text-align: center;
  font-size: 36px;
  font-weight: 600;
  background:white;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  color:white;
}
.container .text1{
  margin-top:5px;
  text-align: center;
  font-size: 20px;
  font-weight: 600;
  background: white;
  color:black;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
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
    	<a href="Assignment.jsp" class="close">&times;</a>
    	<div class="text">
      		Assignment Submission Form
        </div>
        <div class="text1">
      		Submit your assignment  file here.
        </div>
		<form action="SubmissionController" method="post" enctype="multipart/form-data">
		     <input type="hidden" name="mat_id" value="<%= request.getParameter("mat_id")%>">
		           
			<div class="form-row">
	        	<div class="input-data">
		            <input type="text" name="title" required/>
		            <div class="underline"></div>
		            <label for="">Your Assignment file Title</label>
	            </div>
         	</div>
          	
            <div class="form-row" > 
            	<div class="photoupload">
             		<label for="">Add File</label>
             		<input type="file" name="myfile"/>
        		</div>
           </div>
              
           <div class="form-row submit-btn">
				<div class="input-data">
	                <div class="inner"></div>
	                <input type="submit" value="Submit"/>
                </div>
          </div>
		</form>
	</div>
  	<a href="Material.jsp?course_id=<%=(int)session.getAttribute("course_id") %>" class="close-popup"></a>
 
</body>
</html>