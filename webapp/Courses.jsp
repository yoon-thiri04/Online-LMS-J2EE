<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.uploadDao" %>
<%@ page import="model.Material" %>
<%@ page import="java.util.List" import="dao.UserDAO"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>course</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style >
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
*{
    margin:0;
    padding:0;
    box-sizing: border-box;
    outline: none; border:none;
    text-decoration: none;
    text-transform: capitalize;
    transition: .2s linear;
   font-family: Poppins, Helvetica, sans-serif;
}
body{
background:#E6E6E6;
}
/*header*/

/*header*/
.header{
	position:fixed;
  	display: flex;
  	align-items: center;
  	justify-content: space-between;
  	height: 60px;
  	width:100%;
 	padding: 20px;
  	background:#164863;
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


/*Footer*/
section a:hover{
    color:#D0D9FC;
    text-decoration: none;
}
.ss-footer{
    width:100%;
    height:30vh;
    background-color: #111111;
    padding-right: 30px;
    color:azure;
    text-align:center;
}

a {
    text-decoration: none;
    color:#838383;
    
    font-size: 4;
}

.icon{
    font-size: 30px;
    display: flex;
    flex: wrap;
    gap: 3rem;
    margin-left: 600px;
}
  
.footer{
     font-size: 20px;
    height: 10vh;
    display: flex;
    flex: wrap;
    gap: 3rem;
   margin-left: 430px;
    line-height: 5rem;
}
  
.footer1{
    font-size: 20px;
    margin-left: 10px;
    }
/*Youtube ka har*/
.container{
    background:linear-gradient(45deg, blueviolet, lightgreen);
    padding:15px 9%;
    padding-bottom: 100px;
}

.container .heading{
    text-align: center;
    padding-bottom: 15px;
    color:#fff;
    text-shadow: 0 5px 10px rgba(0,0,0,.2);
    font-size: 50px;
}

.container .box-container{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
    gap:15px;
}

.container .box-container .box{
    box-shadow: 0 5px 10px rgba(0,0,0,.2);
    border-radius: 5px;
    background: #fff;
    text-align: center;
    padding:30px 20px;
}

.container .box-container .box img{
    height: 80px;
}

.container .box-container .box h3{
    color:#444;
    font-size: 22px;
    padding:10px 0;
}

.container .box-container .box p{
    color:#777;
    font-size: 15px;
    line-height: 1.8;
}

.container .box-container .box .btn{
    margin-top: 10px;
    display: inline-block;
    background:#333;
    color:#fff;
    font-size: 17px;
    border-radius: 5px;
    padding: 8px 25px;
}

.container .box-container .box .btn:hover{
    letter-spacing: 1px;
}

.container .box-container .box:hover{
    box-shadow: 0 10px 15px rgba(0,0,0,.3);
    transform: scale(1.03);
}

@media (max-width:768px){
    .container{
        padding:20px;
    }
}
</style>
</head>
<body>
	<header class="header">
	    <div class="logo">
	       <a href="sourceHome.jsp"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a>
</div>
	    
	    <div class="header-icons">
	    	<div class="account">
		        <ul>
	            	<li><a href="sourceHome.jsp">Home</a></li>
	                <li><a href="Courses.jsp">Course</a></li>
	                <li><a href="sourceHome.jsp#aboutUs">About Us</a></li>
	                <li><a href="login.jsp">Login</a></li>
	                
	            </ul>
	    	</div>
	    </div>
	</header>
	<div style="height:60px;">---------------</div>
<div class="container">

    <h1 class="heading">Our Courses</h1>

    <div class="box-container">

        <div class="box">
            <img src="htmlhtml.jpg" alt="">
            <h3>Web Development Basic</h3>
            <p>Web Developer is the standard markup language used...</p>
            <a href="WebDev1.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="csscss.jpg" alt="">
            <h3>PHP</h3>
            <p>PHP is a style sheet language used to define the ...</p>
            <a href="PHP.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="js.jpg" alt="">
            <h3>JavaScript</h3>
            <p>JavaScript is a scripting language that enables you to create dynamic behavior, and...</p>
            <a href="JavaScriptBook1.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="py.jpg" alt="">
            <h3>Python</h3>
            <p>Python is an interpreted, object-oriented, high-level programming lang...</p>
            <a href="PythonBook1.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="sqlsql.jpg" alt="">
            <h3>SQL</h3>
            <p>Structured query language (SQL) is a programming language for storing and processing infor...</p>
            <a href="SQLBook1.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="cc1.jpg" alt="">
            <h3>C#</h3>
            <p>C# (pronounced "C sharp") is a programming language developed by Microsoft ...</p>
            <a href="CBook12.jsp" class="btn">View</a>
        </div>
        
        <div class="box">
            <img src="cc.jpg" alt="">
            <h3>C++</h3>
            <p>C++ is a high-level, general-purpose programming language created by Bjarne Stroustrup at Be...</p>
            <a href="CBook11.jsp" class="btn">View</a>
        </div>
        
        <div class="box">
            <img src="ja.jpg" alt="">
            <h3>Java</h3>
            <p>Java is a popular, high-level programming language developed by Sun ...</p>
            <a href="javaBook1.jsp" class="btn">View</a>
        </div>

    </div>

</div>
<section class="ss-footer">
        <br><br><br>
        <div class="icon">
        <a href="https://www.google.com/search?q=facebook&oq=facebook&aqs=chrome.0.0i271j46i131i199i433i465i512j69i64j0i67i131i433i650j0i67i650l4.10435j0j15&sourceid=chrome&ie=UTF-8"> <i class="fa-brands fa-facebook" ></i>
        </a>
        <a href="https://www.youtube.com">
        <i class="fa-brands fa-youtube"></i></a>
        <a href="https://www.google.com/search?q=instagram&sca_esv=564367827&ei=TiX_ZPrYJ4OYseMP_qC4oAM&ved=0ahUKEwj6t42446KBAxUDTGwGHX4QDjQQ4dUDCBA&uact=5&oq=instagram&gs_lp=Egxnd3Mtd2l6LXNlcnAiCWluc3RhZ3JhbTINEAAYigUYsQMYgwEYQzINEAAYigUYsQMYgwEYQzIHEAAYigUYQzIHEAAYigUYQzINEAAYigUYsQMYgwEYQzINEAAYigUYsQMYgwEYQzINEAAYigUYsQMYgwEYQzILEAAYgAQYsQMYgwEyCBAAGIAEGLEDMgsQABiABBixAxiDAUilGVDSBFjFFHABeAGQAQCYAYwBoAHHBaoBAzAuNrgBA8gBAPgBAcICChAAGEcY1gQYsAPCAgoQABiKBRiwAxhDwgIFEAAYgATiAwQYACBBiAYBkAYK&sclient=gws-wiz-serp">
        <i class="fa-brands fa-instagram"></i></a>
        <a href="https://twitter.com/">
        <i class="fa-brands fa-twitter"></i></a>
        <a href="https://www.google.com/search?q=linkedin&oq=link&aqs=chrome.0.0i67i131i355i433i650j46i67i131i199i433i465i650j69i57j69i64j46i67i131i199i433i465i650j0i67i650l2j0i67i131i433i650.7530j0j15&sourceid=chrome&ie=UTF-8">
        <i class="fa-brands fa-linkedin"></i></a>
        </div>

        <div class="footer"><br><br>
          <p>The world is a book and those who do not learn read only one page.</p>
        </div>

        <div class="footer1">
        <p >Copyright@2024;Designed By Smart Learn</p>
        </div>
      </section>
</body>
</html>