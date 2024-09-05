<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <meta charset="UTF-8">
    <title>Smart Learn</title> 
    <link rel="stylesheet" href="">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
    	@import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap');
*
{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: Poppins, Helvetica, sans-serif;
 
}
/*body{
	background-color:#dfe6fd;
}*/

a {
    text-decoration: none;
    color: inherit;
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

.content
{
  position: relative;
  width: 100%;
  height: 92.5vh;
  display: flex;
  justify-content: space-between;
  align-items: center;
 
}
.content .textBox
{
  padding-top: 30px;
  padding-left: 70px;
  position: relative;
  max-width: 600px;
}
.content .textBox h2
{
  color: #333;
  font-size: 4em;
  line-height: 1.4em;
  font-weight: 500;
}
.content .textBox h1 span
{
  color: #164863;
  font-size: 50px;
  font-weight: 1000;
   font-family: 'Amatic SC', cursive;
}
.content .textBox p 
{
  text-align: justify;
  color: #333;
}
.content .textBox a 
{
  display: inline-block;
  margin-top: 20px;
  padding: 8px 20px;
  background: #164863;
  color: #fff;
  border-radius: 40px;
  font-weight: 500;
  letter-spacing: 1px;
  text-decoration: none;
}
.content .imgBox
{
  width: 600px;
  display: flex;
  justify-content: flex-end;
  padding-right: 50px;
  margin-top: 50px;
}
.content .imgBox img
{
  max-width: 600px;
}
.thumb
{
  position: absolute;
  left: 50%;
  bottom: 20px;
  transform: translate(-50%);
  display: flex;
}
.thumb li 
{
  list-style: none;
  display: inline-block;
  margin: 0 20px;
  cursor: pointer;
  transition: 0.5%;
}
.thumb li:hover
{
  transform: translateY(-15px);
}
.thumb li img 
{
  max-width: 60px;
}

.circle1
{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #164863;
  clip-path: circle(600px at right 800px);
}

/* Hero Section */
#hero {
    /*background: url('https://images.theconversation.com/files/509706/original/file-20230213-22-6iyda6.jpg?ixlib=rb-4.1.0&q=45&auto=format&w=926&fit=clip') no-repeat center center/cover;*/
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    text-align: center;
    background-color: #dfe6fd;
}

#hero .hero-content {
    max-width: 600px;
}

#hero h1 {
    font-family: 'Playfair Display', serif;
    font-size: 4rem;
}

#hero p {
    margin: 1rem 0;
    font-size: 1.5rem;
}

.cta {
    background: #c49a6c;
    color: #fff;
    padding: 0.75rem 2rem;
    border-radius: 5px;
    font-size: 1rem;
    transition: background 0.3s;
}

.cta:hover {
    background: #a97d56;
}
/*frequently ask and about*/

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
.accordion {
    background-color: white;
    color: rgba(0, 0, 0, 0.8);
    cursor: pointer;
    font-size: 15px;
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
    font-size: 0.8rem;
    line-height: 1.4;
}
.faq {
    border: 1px solid rgba(0, 0, 0, 0.2);
    margin: 10px 0;
    margin-left:50px;
    width:550px;
    
}

.faq.active {
    border: none;
}

.form {
	margin-top: 250px;
    max-width: 1200px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow:  rgba(0, 0, 0, 0.5 ) 0 2px 6px 0;
    z-index: 100;
    overflow: hidden;
    display: grid;
  	height:590px;
	grid-template-columns:500px 600px;
	gap:200px;
	margin-left:160px;
}
.contact-form {
    background: url('faqme.png');
background-size:500px 600px;
	background-repeat:no-repeat;
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



/* blocks */
#featured{
background: #dfe6fd;
}	
#featured-products{
			
			font-family: Arial, sans-serif;
            background-color: #dfe6fd;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin: 0;
            padding: 20px;
}
.hero-content h1 {
            font-size: 2.5em;
            color: #333;
            margin-bottom: 40px;
            text-align: center;
        }
        .review{
        	font-size:3em;
        	margin-top: 30px;
        	margin-bottom:30px;
        }
        .ffaq {
   font-size:3em;
        	margin-top: 20px;
        	margin-bottom:20px;
    
}
  
        .boxcontainer {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            max-width: 1200px;
            width: 100%;
        }

        .box {
        	height: 300px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            opacity: 0;
            transform: translateY(30px);
            transition: all 1s ease;
        }
        .box:hover{
        	box-shadow: 0px 9px 6px 9px #BDBDBD;
        }

        .box img {
            width: 80px; /* Adjust the size as needed */
            height: 80px; /* Adjust the size as needed */
            border-radius: 50%;
            margin-bottom: 15px;
            object-fit: cover; /* Ensures images cover the circle without distortion */
        }

        .box h3 {
            margin: 15px 0;
            font-size: 1.5em;
            color: #333;
        }

        .box p {
            color: #777;
            font-size: 1em;
            line-height: 1.6;
        }

        .box.visible {
            opacity: 1;
            transform: translateY(0);
        }
/*frequently*/
@import url("https://fonts.googleapis.com/css2?family=Roboto&display=swap");


.wrapper {
    width:500px;
  	margin-right:60px;
}
.headingfrq {
	font-size: 15px;
	margin-top: 25px;
	text-align:center;
	width:700px;
	font-size: 1.7em;
    color: #333;
    height:80px;
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


/*

.fade-in {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}

.fade-in.visible {
  opacity: 1;
  transform: translateY(0);
}

/* Add styles for accordion to ensure smooth transitions */
.accordion {
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.accordion.active, .accordion:hover {
  background-color: #f1f1f1;
}

.pannel {
  display: none;
  overflow: hidden;
}

.pannel.show {
  display: block;
}*/
</style>
</head> 
<body> 
    <section>
        <div class="circle1"></div>
        <header class="header">
    <div class="logo">
     <a href="sourceHomeLogin.jsp"><b>SmartLearn<i class="fa-solid fa-graduation-cap"></i></b> </a>
     </div>
    <div class="header-icons">
	    	<div class="account">
		        <ul>
	            	<li><a href="#">Home</a></li>
	                <li><a href="CoursesLogin.jsp">Course</a></li>
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
        
    
    
        <div class="content">
       
            <div class="textBox">
                <h1>It's not just online learning<br>It's  <span> SmartLearn<i class="fa-solid fa-graduation-cap"></i></span></h1>
                <p>Welcome to Smart Learn, your go-to online learning platform designed to empower learners of all ages. At Smart Learn, we believe in making education accessible, engaging, and effective. Whether you're looking to expand your knowledge, gain new skills, or advance in your career, our diverse range of courses and expert instructors are here to guide you every step of the way. Join us today and start your journey to smarter learning!
                <a href="#featured-products">Learn More</a>
            </div>
            <div class="imgBox">
                <img src="tree.png" class="starbucks">
            </div>
        </div>
       
       
    </section> 

   


    <section id="featured-products">
        <h1 class="review">Review</h1>
    <div class="boxcontainer">
        <div class="box">
            <img src="avatar.jpeg" alt="Person 1">
            <h3>Alex Smith</h3>
            <p>The program is extremely good, it is exactly what I required in my developers journey. It is very hands on 
        and the perfect experience for someone</p>
        </div>
        <div class="box">
            <img src="avatar.jpeg" alt="Person 2">
            <h3>Ben</h3>
            <p>Very well put together and clear.  I actually used Project 1 for a real world 2023 strategy.</p>
        </div>
        <div class="box">
            <img src="avatar.jpeg" alt="Person 3">
            <h3>Mahmoud</h3>
            <p>Amazing, I was thinking "it's a tough topic" to learn, but the way the course materials and the exercises.</p>
        </div>
        <div class="box">
            <img src="avatar.jpeg" alt="Person 4">
            <h3>Matthew</h3>
            <p>It's been great so far.Though there were moments when it all seemed overwhelming, I kept moving and I'm 
        glad I finished the first project.</p>
        </div>
        <div class="box">
            <img src="avatar.jpeg" alt="Person 5">
            <h3>Matt Mahood</h3>
            <p>The program is extremely good, it is exactly what I required in my developers journey. It is very hands on 
        and the perfect experience for someone</p>
        </div>
        <div class="box">
            <img src="avatar.jpeg" alt="Person 6">
            <h3>Amr</h3>
            <p>Amazing, I was thinking "it's a tough topic" to learn, but the way the course materials and the exercises
        </p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const boxes = document.querySelectorAll('.box');
            const observer = new IntersectionObserver(entries => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            });

            boxes.forEach(box => {
                observer.observe(box);
            });
        });
    </script>
    </section>
      <div id="ourfaq">
  <div class="frequentlyclass">
    <section id="frequently">
      <h1 class="ffaq fade-in" style="text-align:center;">Our FAQs</h1>
      <div class="form" style="margin-top:25px;">
        <div class="wrapper">
          <div class="headingfrq fade-in">
            <h2>Frequently Asked Questions</h2>
          </div>
          <div class="faq fade-in">
            <button class="accordion">
              What are the technology requirements to take an online course?
              <i class="fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel">
              <p>You will need a computer, a high speed Internet connection, a newer version of a web browser, and access to common tools and software like word processors, email, etc.</p>
            </div>
          </div>
          <div class="faq fade-in">
            <button class="accordion">
              Can I find out more about these courses?
              <i class="fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel">
              <p>The courses are detailed in the course offerings. For further information, please contact Online Learning.</p>
            </div>
          </div>
          <div class="faq fade-in">
            <button class="accordion">
              How do I contact my course instructor?
              <i class="fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel">
              <p>Instructors stay in touch with their Online Learning students in a variety of ways, depending on the course design. Your instructor will explain the best way to reach him or her within the course home pages.</p>
            </div>
          </div>
          <div class="faq fade-in">
            <button class="accordion">
              How old do I have to be to take an online class?
              <i class="fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel">
              <p>You must be at least a high school sophomore, junior, or senior.</p>
            </div>
          </div>
          <div class="faq fade-in">
            <button class="accordion">
              How do I enroll and register?
              <i class="fa-solid fa-chevron-down"></i>
            </button>
            <div class="pannel">
              <p>If you are a high school student, see the online courses page on the Precollege Studies website. Otherwise please visit the registration page.</p>
            </div>
          </div>
        </div>
        <div class="contact-form"></div>
      </div>
    </section>
  </div>
</div>

    
    </section>
    </div>
    </div>
   
  <!--    <script>
document.addEventListener("DOMContentLoaded", function() {
  // Create an Intersection Observer instance
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      } else {
        entry.target.classList.remove('visible');
      }
    });
  }, { threshold: 0.1 });

  // Target elements to observe
  const fadeElements = document.querySelectorAll('.fade-in');
  fadeElements.forEach(el => observer.observe(el));

  // Accordion functionality
  document.querySelectorAll('.accordion').forEach(button => {
    button.addEventListener('click', () => {
      button.classList.toggle('active');
      const panel = button.nextElementSibling;
      if (panel.style.display === 'block') {
        panel.style.display = 'none';
      } else {
        panel.style.display = 'block';
      }
    });
  });
});
</script>
    
   --> 
    
    
    
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
   <footer>
        <div class="footer-container">
            <div class="footer-section contact-us">
                <h3>Contact Us</h3>
                <p>Email: <a href="mailto:yoonthiriaung04@gmail.com">smartlearn2024@gmail.com</a></p>
                <p>Phone: +121 56556 565556</p>
                <p>Address: Yangon, Myanmar</p>
            </div>
            <div class="footer-section quick-links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="sourceLogin.jsp">Home</a></li>
                    <li><a href="CoursesLogin.jsp">Course</a></li>
                    <li><a href="sourceLogin#ourfaq">FAQ</a></li> 
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
</body>

<script>
    // JavaScript for box animation
    document.addEventListener('DOMContentLoaded', () => {
        const boxes = document.querySelectorAll('.box');

        const handleScroll = () => {
            const scrollPosition = window.scrollY + window.innerHeight;
            
            boxes.forEach(box => {
                const boxTop = box.getBoundingClientRect().top + window.scrollY;
                if (scrollPosition > boxTop + 100) { // Adjust the +100 to control when the animation starts
                    box.classList.add('visible');
                } else {
                    box.classList.remove('visible');
                }
            });
        };

        window.addEventListener('scroll', handleScroll);
        handleScroll(); // Trigger animation on initial load
    });
</script>
</body> 
</html>