<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<style> @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
*{
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: Arial, Helvetica, sans-serif;
  
}
body {
   background-color:#E6E6E6;
   color:black;
   /*font-family: 'Comic Sans MS', cursive;*/
   line-height: 1.5;
}
/*header*/
.header{
	position:relative;
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
  display: flex;
  align-items: center;
}
.header-icons .account i{
  font-size:29px;
	margin-right:15px;
}
/* Side menubar section */
.sidebar{
	position:fixed;
	width: 230px;
	height:100%;
	background:#3D56B2;
	top: 84px;
}

.sidebar ul a{
	display:block;
	width:100%;
	line-height:65px;
	font-size:15px;
	color:white;
	padding-left:20px;
	box-sizing:border-box;
	border-top:1px solid rgba(255,255,255,.1);
	border-bottom:1px solid black;
	transition:.4s;
}

ul li:hover a{
	padding-left:50px;
}

.sidebar ul a i{
	margin-right:16px;
}

.side_navbar a:hover{
  background: rgb(235, 235, 235);
}

.side_navbar .active{
  border-left: 2px solid rgb(100, 100, 100);
}

/* Main Body Section */
.main-body{
	margin-top:70px;
	margin-left:520px;
	padding-bottom:30px;
	margin-bottom:50px;
	display:grid;
	grid-template-columns:300px 300px;
	gap:60px 90px;
	height:150px;
	width:auto;
}
#body{
	display:flex;
}
.card-single{
	display:flex;
	justify-content:space-between;
	background:#fff;
	padding:2rem;
	border-radius:15px;
	cursor:pointer;
	transition: all 0.3s;
	height:130px;
}
.card-single div:last-child span{
	font-size:3rem;
	color:#14279B;
}
.card-single div:first-child span,h1{
	color:#14279B;
	padding-bottom:3px;
}
.card-single:hover {
	background-color:#14279B;
}
.card-single:hover div:first-child span{
	color:white;
}
.card-single:hover div:first-child h1{
	color:white;
}
.card-single:hover div:last-child span{
	color:white;
}
html{
	line-height: 1.15;
  	-webkit-text-size-adjust: 100%;
  	box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

:root {
  --small-green-circle: #78eea6;
  --main-accent-color: #9b45e4;
  --secondary-accent-color: #e13a9d;
}

a {
  background-color: transparent;
}

img {
  border-style: none;
}

button {
  font-family: inherit;
  font-size: 100%;
  line-height: 1.15;
  margin: 0;
  overflow: visible;
  -webkit-appearance: button;
}

button::-moz-focus-inner,
[type="button"]::-moz-focus-inner {
  border-style: none;
  padding: 0;
}

body {
  margin: 0;
}
/*.container{
	margin-left:370px;
	display:grid;
	align-item:center;
	margin-top:30px;
	grid-template-columns:350px 500px;
	padding-top:1.5em;
	gap:70px;
}*/

.container{
	margin-left:270px;
	display:grid;
	align-item:center;
	margin-top:30px;
	grid-template-columns:350px 500px;
	padding-top:1.5em;
	gap:70px;

.card {
  border-radius: 0.8em;
  background-color: #fefefe;
  box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.02),
    0 6.7px 5.3px rgba(0, 0, 0, 0.028), 0 12.5px 10px rgba(0, 0, 0, 0.035),
    0 22.3px 17.9px rgba(0, 0, 0, 0.042), 0 41.8px 33.4px rgba(0, 0, 0, 0.05),
    0 100px 80px rgba(0, 0, 0, 0.07);
  position:;
  width:1000px;
  align-item:center;
  padding-right:2em;
  padding-left:4em;
  padding-bottom:0.3em;
  color:#14279B;
  padding-top:2.7em;

}
.card__text{
	padding-top:1.5em;
	padding-bottom:1.5em;
}
.card__text p{
	padding:15px;
	border:1px solid black;
	margin-bottom:1em;
	margin-top:0.3em;
	color:#14279B;
}
.card__text label{
	font-size:15px;
	color:#14279B;
}
.card__image {
  width: 250px;
  height: 250px;
  margin-top: 60px;
  margin-left: 30px; 
}
.card__text h2 {
	margin-top:0.1em;
  	margin-bottom: 0.3em;
  	font-size: 2em;
  	color:#14279B;
  	text-align:center;
}
.logoutbtn{
	padding:10px;
	border:1px solid white;
	color:white;
	background-color:#14279B;
	border-radius:3px;
	cursor:pointer;
	transition:background 0.2s,color 0.2s;
	margin-left:450px;
	margin-top:20px;
}
.logoutbtn:hover{
	border:1px solid #14279B;
	color:#14279B;
	background-color:white;
	padding:10px;
}

.upload{
	grid-column: 1/2 ;
	border-radius: 0.8em;
  background-color: #fefefe;
  box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.02),
    0 6.7px 5.3px rgba(0, 0, 0, 0.028), 0 12.5px 10px rgba(0, 0, 0, 0.035),
    0 22.3px 17.9px rgba(0, 0, 0, 0.042), 0 41.8px 33.4px rgba(0, 0, 0, 0.05),
    0 100px 80px rgba(0, 0, 0, 0.07);
 	
  width:600px;
  height: 450px;
  

  color:#14279B;
 border: 2px dashed ;
 
 margin-left : 220px;

}

.card__image1 {
	width: 200px;
	height: 200px;
  margin-left: 210px;
  margin-top: 50px;

}

/*Table Title*/
#title{
	height:10px;
	margin-left: 229px;
	
	/*margin-top: 2px;*/
	display:flex;
	align-items:center;
}
#title p{
	font-weight:bold;
	font-size:25px;
	width:500px;
}
#t1{
  height:60px;
  margin-left: 222px;
 
 /* margin-top:10px;*/
  display:flex;
  align-items:center;
}
/*Add Button*/
.btn{
	width:210px;
	height:70px;
	color:black;
	display:flex;
	align-items:center;
	transition:all 0.5s ease 0s;
}
#Addbtn i{
	font-size:20px;
	margin-left:10px;
	color:white;
}

#Addbtn{
	display:flex;
	align-items:center;
	
	margin-top:20px;
  margin-left: 25px;
	margin-bottom:25px;
	background-color:#3D56B2;
	height:40px;
	width:120px;
	padding-left:5px;
	padding-right:5px;
	border:1px solid black;
    transition: all 0.5s ease 0s;
    border-radius:10px;
}
#Addbtn h3{
  color:white;
}

</style>
</head>
<body>
	<header class="header">
	    <div class="logo">
	      <a href="#"><b>Smart Learn</b></a>
	    </div>

	    <div class="header-icons">
	    	<div class="account">
	        	<i class="fa-solid fa-circle-user"></i>
	        	<h3>Byeon Woo Seok</h3>
	      	</div>
	    </div>
	</header>
	
	<div id="body">
		<div class="container">
			<div class="card">
				<img src="defaultprofile.jpg" class="card__image" />
			</div>
		    <div class="card__text">
		    	<h2>Byeon Woo Seok</h2>
				<label>Email</label><br>
				<p>byeonwooseok@gmial.com</p>
				<label>Category</label>
				<p>Java</p>
				<label>Course Name</label>
				<p>Introduction To Java</p>
				<button class="logoutbtn"><b>Logout</b></button>
			</div>


		<div class="upload">
    	<div >
      
        <img src="zero.jpg" class="card__image1" />
     </div>
     <div id="title">
    
    		Drag & drop to upload </div><br><br>
    	<div id=t1>
    		<div id="Addbtn">
    
      	<a href="#" class="btn">
        <h3>Upload</h3><i class="fa-solid fa-paint-roller"></i>
        </a>
      </div>
      
    </div>

		</div>	
	</div>

</div>
</body>
</html>