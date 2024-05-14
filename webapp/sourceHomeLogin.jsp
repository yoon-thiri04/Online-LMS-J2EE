<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*"%>
    <%
    session = request.getSession(); 
    String userEmail = (String) session.getAttribute("userEmail"); 
    UserDAO udao=new UserDAO();
    String username=udao.getName(userEmail);%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Font/css/fontawesome.min.css">
<link rel="stylesheet" type="text/css" href="Font/css/all.min.css">
<meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='contact.css'>
        <script src='main.js'></script>
        <link rel="stylesheet" 
        href="https://fonts.googleapis.com/css?family=fantasy&effect=outline|shadow-multiple">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
<style>
*{
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: Arial, Helvetica, sans-serif;
}
/*header*/
.header{
  	display: flex;
  	align-items: center;
  	justify-content: space-between;
  	height: 60px;
  	width:100%;
 	padding: 20px;
  	background: #387ADF;
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
#wrapper{
  background-color: #D0D9FC ;
  width: 100%;         
}

hr{
    width : 100px;
    color: #FF8A65;
    margin-left: 30%;
}

body{      
  background-color:#dfe6fd;
  user-select: none;
  scroll-behavior: smooth;
}

#image{
  width: 100%;
   height:44em;
  background-repeat: no-repeat;
  background-image: url("h3.jpg"); 
}


*{
  margin: 0;
  padding: 0;
  font-family: Verdana;      
}

span{
  color:black;
}

.hero-box{
  display:flex;
  align-items:center;
  justify-content:space-evenly;
  padding:150px 160px;
}

.left-box{
  margin-left:40px;
  padding:50px 0;
}

.ready{
  color:black;
  margin-bottom:8px;
  font-weight:550;
}

.left-box h1{
  font-size:34px;
  margin-bottom:8px;
  line-height:44px;
}

.left-para{
  margin-bottom:30px;
}

.right-img{
  width:700px;
  margin-top:-50px;
}


.reviews{
  max-width:1200px;
  padding:0 20px;
  display:flex;
  align-items:center;
  justify-content:space-between;
  height:200px;
  margin-left: 150px;
}

.reviews1{
  max-width:1200px;
  padding:0 20px;
  display:flex;
  align-items:center;
  justify-content:space-between;
  height:400px;
  margin-left: 150px;
}

.topic{
  font-size:30px;
  margin-bottom:20px;
  line-height:44px;
  margin-left:175px;
}

.box{
  background:#fff;
  border-radius:30px;
  padding:25px;
  width:calc(33% - 10px);    
}  

i.quote{
  font-size:20px;
  color:blue;
}

.content{
  padding-top:10px;
  display:flex;
  align-items:center;
  justify-content:space-between;
}

.info{
  margin-right:130px;
}

.info1{
  margin-right:160px;
}

.info2{
  margin-right:150px;
}

.info3{
  margin-right:150px;
}

.info4{
  margin-right:175px;
}

.info5{
  margin-right:190px;
}

/*.name{
  font-size:17px;
  font-weight:600;
  color:blue;
}*/

.job{
  color:blue;
  font-size:16px;
  font-weight:500;
}

.image{
  height:35px;
  width:35px;
  padding:3px;
  /*background:blue;*/
  border-radius:50%;
}

.image img{
  height:100%;
  width:100%;
  object-fit:cover;
  border-radius:50%;
  border:2px solid #fff;
}  

* {
    margin: 0;
    padding: 0;
   box-sizing: border-box;  
}
.form {
    max-width: 1300px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow:  rgba(0, 0, 0, 0.5 ) 0 2px 6px 0;
    z-index: 100;
    overflow: hidden;
    margin-left: 110px;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
  height:600px;
}

.contact-form {
    background-color:#153678;
    position: relative;
}  

.circle {
    border-radius: 50%;
    background: linear-gradient(135deg, transparent 20%,#5089FD );
    position: absolute;
}

.circle.one {
    width: 130px;
    height: 130px;
    top: 130px;
    right: -40px;
}

.circle.two {
    width: 80px;
    height: 80px;
    top: 10px;
    right: 30px;
}


form {
    padding: 2.3rem 2.2rem;
    z-index: 10;
    overflow: hidden;
    position: relative;  
}

.contact-info {
    padding: 2.3rem 2.2rem;
    position: relative;
}

.contact-info .title {
    color: #1abc9c;
}

.text {
  color: black;
  font-size: 17px;
  text-transform:;
  font-family:unset;
   margin: 1.5rem 0 2rem 0;
}

.information p{
    padding-left: 20px;
}

.information p a{
    color: black;
}

.information  p1{
    padding-left:10px;
    color: black;
}

.information {
    display: flex;
    color: #555;
    margin: 0.7rem 0;
    align-items: center;
    font-size: 0.95rem;
}

.icon {
    width: 28px;
    margin-right: 0.7rem;
}

@import url("https://fonts.googleapis.com/css2?family=Roboto&display=swap");
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: "Roboto", sans-serif;
}

.wrapper {
    max-width: 100%;
  margin-right:160px;
}

.wrapper > p,
.wrapper > h1 {
    margin: 1.5rem 0;
    text-align: center;
}

.wrapper > h1 {
    letter-spacing: 2px;
  margin-left:140px;
}

.accordion {
    background-color: white;
    color: rgba(0, 0, 0, 0.8);
    cursor: pointer;
    font-size: 0.9rem;
    width: 100%;
    padding: 2rem 2.5rem;
    border: none;
    outline: none;
    transition: 0.4s;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-weight: bold;
    height:5px;
    text-align:justify;
}

.accordion i {
    font-size: 0.9rem;
}

.active,
.accordion:hover {
    background-color:#dfe6fd ;
}

.pannel{
    padding: 0 2rem 2.5rem 2rem;
    background-color: white;
    overflow: hidden;
    background-color:#dfe6fd ;
    display: none;
}

.pannel p {
    color: rgba(0, 0, 0, 0.7);
    font-size: 0.9rem;
    line-height: 1.4;
}

.faq {
    border: 1px solid rgba(0, 0, 0, 0.2);
    margin: 10px 0;
    margin-left:30px;
    width:120%;
}

.faq.active {
    border: none;
}

section a:hover{
    color:#D0D9FC;
    text-decoration: none;
}

.heading{
  text-align:center;
  margin-top:25px;
}

.heading h1{
  font-size:30px;
  color:#fff;
  margin-bottom:10px;
}

.about-us{
  display:flex;
  align-items:center;
  width:85%;
  margin:auto;
}

/*.about-us img{
  flex:0 50%;
  max-width:20%;
  height:auto;
}*/

.about{
  padding:35px;
}

.about p{
  color:#fff;
  font-size:20px;
  line-height:1.5;
  margin:15px 0px;
}

.read-more-btn{
  display:inline-block;
  color:#fff;
  background-color:#0884ff;
  border:none;
  border-radius:5px;
  padding:12px 20px;
  font-size:10px;
  cursor:pointer;
  transition:0.2s ease;
}

.read-more-btn:hover{
  background-color:#006dd6;
}


.ss-footer{
    width:100%;
    height:30vh;
    background-color: #111111;
    padding-right: 30px;
    color:azure;
    text-align:center;
    margin-top:3%;
}

a {
    text-decoration: none;
    color:#838383;
    font-family: Arial, Helvetica, sans-serif;
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
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    line-height: 5rem;
}
  
.footer1{
    font-size: 20px;
    margin-left: 10px;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}

.name{
	
	font-size:17px;
  	font-weight:600;
	color:black;
}
</style>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
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
  <div id="wrapper">
    <div id="image">      
      <div class="hero-box">
          <div class="left-box">
            <p class="ready">Are you ready to learn?</p>
            <h1>Learn with fun<br>on <span>any schedule</span></h1>
            <p class="left-para">Study any topic,anytime. Explore thousands of course for free!</p>
        </div>
         
        <div class="right-box">
              <img src="teach.jpg" alt="header images" class="right-img">
        </div>   
      </div>       
    </div>
    <div class="topic">Learners Love Smart Learn</div>
    <div class="reviews">
      <div class="box">
      <i class="fas fa-quote-left quote"></i>
        <p>It's a very nice program, but also challenging.
        There are useful references and professors who explain well, when I submit the projects I catch what I've been missing out on 
        It was a very wonderful experience and I am definitely honored to have a certificate from them. </p>
        <div class="content">
          <div class="image">
        <img src="icon.svg" alt="">
        </div>
        <div class="info">
          <div class="name">Alex Smith</div>
          <div class="job">Designer | Developer</div>
        </div>
      </div>      
      </div>
    
      <div class="box">
      <i class="fas fa-quote-left quote"></i>
        <p>I found that program very useful for me which give me  the opportunity to apply my theoretical learning to 
        a real project including more tactics of digital marketing, freelancing, and  career with applied projects 
        relevant to the learning journey.</p>
        <div class="content">
          <div class="image">
        <img src="icon.svg" alt="">
        </div>
        <div class="info1">
          <div class="name">Ben</div>
          <div class="job">Business Analyst</div>
        </div>
      </div>
      </div>
    
      <div class="box">
      <i class="fas fa-quote-left quote"></i>
        <p>Very well put together and clear.  I actually used Project 1 for a real world 2023 strategy.  Worth it!  
        I work in digital media sales and actively recruit candidates with these skills.  The projects creat an 
        environment to do the work, and really absorb the skills.</p>
        <div class="content">
          <div class="image">
        <img src="icon.svg" alt="">
        </div>
        <div class="info2">
          <div class="name">Mahmoud</div>
          <div class="job">Android Developer</div>
        </div>
      </div>      
      </div>
    </div>
    
    <div class="reviews1">
      <div class="box">
      <i class="fas fa-quote-left quote"></i>
      <p>Amazing, I was thinking "it's a tough topic" to learn, but the way the course materials and the exercises, 
        and the projects laid out simplify everything for me, The projects are real-world scenarios and they cover 
        everything .THANK YOU VERY MUCH.</p>
        <div class="content">
          <div class="image">
        <img src="icon.svg" alt="">
        </div>
        <div class="info3">
          <div class="name">Matthew</div>
          <div class="job">Machine Learning</div>
        </div>
      </div>      
      </div>
    
      <div class="box">
      <i class="fas fa-quote-left quote"></i>
        <p> It's been great so far.Though there were moments when it all seemed overwhelming, I kept moving and I'm 
        glad I finished the first project. And I'm ready to learn more and face the next challenge.it was grateful
        and helpful for any one need for  </p>
        <div class="content">
          <div class="image">
        <img src="icon.svg" alt="">
        </div>
        <div class="info4">
          <div class="name">Matt Mahood</div>
          <div class="job">Student</div>
        </div>
      </div>
      </div>
    
      <div class="box">
      <i class="fas fa-quote-left quote"></i>
        <p>The program is extremely good, it is exactly what I required in my developers journey. It is very hands on 
        and the perfect experience for someone with the self drive to learn. You are introduced to concepts that 
        would have taken longer to come across as a self-taught.</p>
        <div class="content">
          <div class="image">
        <img src="icon.svg" alt="">
        </div>
        <div class="info5">
          <div class="name">Amr</div>
          <div class="job">Data Analyst</div>
        </div>
      </div>
      </div>
    </div>
    <div id="aboutUs">       
    <div class="form">
      <div class="wrapper">
        <h1>Frequently asked questions</h1>
        
        <div class="faq">
              <button class="accordion">
                  What are the technology requirements to take an online course?
                <i class="fa-solid fa-chevron-down"></i>
              </button>
              <div class="pannel">
                  <p>
                     You will need a computer, a high speed Internet connection, a newer version of a web browser, and access to common
                     tools and software like word processors, email, etc.
            </p>
              </div>
            </div>

            <div class="faq">
              <button class="accordion">
                  Can I find out more about these courses?
                <i class="fa-solid fa-chevron-down"></i>
              </button>
              <div class="pannel">
                  <p>
              The courses are detailed in the course offerings. For further information, please contact Online Learning.
                  </p>
              </div>
        </div>

        <div class="faq">
          <button class="accordion">
            How do I contact my course instructor?
            <i class="fa-solid fa-chevron-down"></i>
           </button>
          <div class="pannel">
            <p>
              Instructors stay in touch with their Online Learning students in a variety of ways, depending on the course design.
              Your instructor will explain the best way to reach him or her within the course home pages.
            </p>
          </div>
        </div>

        <div class="faq">
           <button class="accordion">
            How old do I have to be to take an online class?
          <i class="fa-solid fa-chevron-down"></i>
          </button>
          <div class="pannel">
            <p>
                    You must be at least a high school sophomore, junior, or senior.
                  </p>
              </div>
            </div>
<div class="faq">
              <button class="accordion">
                  How do I enroll and register?
                <i class="fa-solid fa-chevron-down"></i>
              </button>
              <div class="pannel">
                  <p>
                     If you are a high school student, see the online courses page on the Precollege Studies website. Otherwise please 
                     visit the registration page.
                  </p>
              </div>
            </div>
        </div>

        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
              acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                this.parentElement.classList.toggle("active");

                var pannel = this.nextElementSibling;

                  if (pannel.style.display === "block") {
                    pannel.style.display = "none";
                  } else {
                    pannel.style.display = "block";
                  }
              });
            }
          </script>
    
         <div class="contact-form">
              <span class="circle one"></span>
              <span class="circle two"></span>
              <div class="heading">
    <h1>About Us</h1>
  </div>
  <section class="about-us">
    
    <div class="about">
      <p>
        Welcome to our online learning system, where knowledge meets innovation. At our platform, we are 
              dedicated to revolutionizing education by providing a dynamic and accessible learning environment for all. 
              Whether you're a student seeking to expand your horizons or a professional aiming to enhance your skills, 
              we offer a diverse range of courses tailored to meet your needs. With cutting-edge technology and expert 
              instructors, we empower learners to thrive in an ever-evolving world. Join us on a journey of discovery, 
              where learning knows no bounds.
      </p>
      
    </div>
  </section>
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
            <p >Copyright@2024;Designed By The Smart Learn</p>
          </div>
       
    </section>
  </div>
</body>
</html>