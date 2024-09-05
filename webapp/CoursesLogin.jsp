<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dao.uploadDao" %>
<%@ page import="model.Material" %>
<%@ page import="java.util.List" import="dao.UserDAO"%>
<%

session = request.getSession(); 
String userEmail = (String) session.getAttribute("userEmail"); 
UserDAO udao=new UserDAO();
String username=udao.getName(userEmail);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>course</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style type="text/css"> @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
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

/*header*/
.header{
	
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
        
        
        /*footer */
footer {
 	margin-top:0px;
    background: #164863;
    color: #fff;
    padding: 10px 0;
    text-align: center;
    margin-bottom: 0;
    height:250px;
    font-size:30px;
}

.footer-container {
    display: flex;
    justify-content: space-around;
    padding: 20px 0;
}

.footer-section {
    width: 30%;
}

.footer-section h3 {
    margin-bottom: 15px;
    font-size: 20px;
    color: #fff;
}

.footer-section p, .footer-section ul {
    margin: 10px 0;
    font-size: 16px;
    line-height: 1.6;
}

.footer-section ul {
    list-style-type: none;
    padding: 0;
}

.footer-section ul li {
    margin-bottom: 8px;
}

.footer-section ul li a {
    color: #fff;
    text-decoration: none;
}

.footer-section ul li a:hover {
    text-decoration: underline;
}

.footer-section a {
    color: #fff;
    text-decoration: none;
}

.footer-section a:hover {
    text-decoration: underline;
}

.footer-section img {
    margin: 0 10px;
}

.footer-bottom {
    background-color: #427D9D;
    padding: 10px 0;
    text-align:center;
    color:white;
   
}
.footer-bottom p {
    margin: 0;
    font-size: 16px;
    margin-bottom: 0;
}
.frequentlyclass{
	background-color:#dfe6fd;
	padding-top:10px;
	padding-bottom:100px;
}
.contact-us{
	text-align:left;
	margin-left:150px;
}
.quick-links{
text-align:left;
}
.follow-us{
text-align:left;
}
/*Youtube ka har*/
.container{
   background-color: #DDF2FD;
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
            .accordion {
                background-color: #444;
                color: #fff;
                cursor: pointer;
                padding: 15px;
                width: 100%;
                text-align: left;
                border: none;
                outline: none;
                transition: 0.4s;
                font-size: 22px;
                border-radius: 5px;
            }

            .active, .accordion:hover {
                background-color: #666;
            }

            .panel {
                padding: 0 18px;
                display: none;
                background-color: white;
                overflow: hidden;
                margin-top: 15px;
                border-radius: 5px;
            }

            .panel img {
                height: 80px;
                margin-bottom: 15px;
            }

            .panel p {
                color:#777;
                font-size: 15px;
                line-height: 1.8;
                margin-bottom: 15px;
            }

            .panel .btn {
                background:#333;
                color:#fff;
                font-size: 17px;
                border-radius: 5px;
                padding: 8px 25px;
            }

            .panel .btn:hover {
                letter-spacing: 1px;
            }
        }
        
</style>
</head>
<body>
	<header class="header">
	    <div class="logo">     
 <a href="sourceLogin.jsp"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a>
	     </div>
	    
	    <div class="header-icons">
	    	<div class="account">
		        <ul>
	            	<li><a href="sourceLogin.jsp">Home</a></li>
	                <li><a href="#">Course</a></li>
	                <li><a href="sourceLogin.jsp#ourfaq">FAQ</a></li>
	                <li><a href="login.jsp">Log Out</a></li>
	            </ul>
	    	</div>
	    	<div class="profile">
		        <a href="student1.jsp"><i class="fa-solid fa-circle-user"></i></a>
		        <h4><%= username %></h4>
		    </div>
	    </div>
	</header>
	
<div class="container">
    <h1 class="heading" style="color:black;">Our Courses</h1>

    <div class="box-container">

        <div class="box">
            <img src="htmlhtml.jpg" alt="">
            <h3>Web Development</h3>
            <p>Web Development is the standard markup language used...</p>
            <a href="WebDev.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="csscss.jpg" alt="">
            <h3>PHP</h3>
            <p>PHP is a style sheet language used to define the ...</p>
            <a href="phpBook.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="js.jpg" alt="">
            <h3>JavaScript</h3>
            <p>JavaScript is a scripting language that enables you to create dynam...</p>
            <a href="JavaScript.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="py.jpg" alt="">
            <h3>Python</h3>
            <p>Python is an interpreted, object-oriented, high-level programming lang...</p>
            <a href="pythonBook.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="sqlsql.jpg" alt="">
            <h3>SQL</h3>
            <p>Structured query language (SQL) is a programming language for sto...</p>
            <a href="sqlBook.jsp" class="btn">View</a>
        </div>

        <div class="box">
            <img src="cc1.jpg" alt="">
            <h3>C#</h3>
            <p>C# (pronounced "C sharp") is a programming language developed by Microsoft ...</p>
            <a href="CBook.jsp" class="btn">View</a>
        </div>
        
        <div class="box">
            <img src="cc.jpg" alt="">
            <h3>C++</h3>
            <p>C++ is a high-level, general-purpose programming language created by...</p>
            <a href="CBook1.jsp" class="btn">View</a>
        </div>
        
        <div class="box">
            <img src="ja.jpg" alt="">
            <h3>Java</h3>
            <p>Java is a popular, high-level programming language developed by Sun ...</p>
            <a href="javaBook.jsp" class="btn">View</a>
        </div>

    </div>

</div>

       <section class="ss-footer">

        <footer>
        <div class="footer-container">
            <div class="footer-section contact-us">
                <h3>Contact Us</h3>
                <p>Email: <a href="mailto:info@example.com">Info@example.com</a></p>
                <p>Phone: +121 56556 565556</p>
                <p>Address: Your Address 123 street</p>
            </div>
            <div class="footer-section quick-links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Course</a></li>
                    <li><a href="#">About Us</a></li> 
                </ul>
            </div>
            <div class="footer-section follow-us">
                <h3>Follow Us</h3>
                <a href="#"><img src="https://img.icons8.com/ios-glyphs/30/ffffff/facebook-new.png" alt="Facebook"></a>
                <a href="#"><img src="https://img.icons8.com/ios-glyphs/30/ffffff/twitter--v1.png" alt="Twitter"></a>
                <a href="#"><img src="https://img.icons8.com/ios-glyphs/30/ffffff/instagram-new.png" alt="Instagram"></a>
                <a href="#"><img src="https://img.icons8.com/ios-glyphs/30/ffffff/linkedin.png" alt="LinkedIn"></a>
            </div>
        </div>
        
    </footer>
<div class="footer-bottom">
            <p>2024 Smart Learn Online Learning. All rights reserved</p>
        </div>
      
   </section>   
      
      
      
      <script>
        document.addEventListener('DOMContentLoaded', function() {
            const boxes = document.querySelectorAll('.box');
            const observer = new IntersectionObserver(entries => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            }, {
                threshold: 0.1
            });

            boxes.forEach(box => {
                observer.observe(box);
            });
        });
    </script>
</body>
</html>