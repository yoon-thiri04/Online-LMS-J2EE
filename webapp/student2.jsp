
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Courses Enrolled</title>

<!-- Font Awesome Cdn Link -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

<style>
/*All*/
*{
  margin: 0;
  padding: 0;
  border: none;
  outline: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: Poppins, Helvetica, sans-serif;
}
/*Main body*/
body{
  background: #E6E6E6;
  margin: 0;
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
/* Side menubar section */
.sidebar{
	position:fixed;
	width: 230px;
	height:100%;
	background:#3D56B2;
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
	border-bottom:1px solid white;
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
/*Profile Title*/
.profiletitle{
	font-size:30px;
	margin-top:30px;
	margin-left:250px;
}
/*Profile Card*/
#profilecard{
	display:flex;
}
.container{
	margin-left:270px;
	display:grid;
	align-item:center;
	margin-top:10px;
	grid-template-columns:350px 500px;
	padding-top:1.5em;
	gap:70px;
}
.card {
  	/*border-radius: 0.8em;*/
  	border-radius: 50px 50px ;
  	background-color: #fefefe;
  	box-shadow: 0 2.8px 2.2px rgba(0, 0, 0, 0.02),
    0 6.7px 5.3px rgba(0, 0, 0, 0.028), 0 12.5px 10px rgba(0, 0, 0, 0.035),
    0 22.3px 17.9px rgba(0, 0, 0, 0.042), 0 41.8px 33.4px rgba(0, 0, 0, 0.05),
    0 100px 80px rgba(0, 0, 0, 0.07);
  	width:1000px;
  	align-item:center;
  	padding-right:2em;
  	padding-left:3em;
  	padding-bottom:0.3em;
}
.card__text{
	padding-top:55px;
	padding-bottom:1.5em;
}
.card__text p{
	padding:15px;
	border:1px solid black;
	margin-bottom:1em;
	margin-top:0.1em;
	color:#000;
}
.card__text label{
	font-size:15px;
	color:#000;
}
.card img {
  	width: 300px;
  	height: 300px;
  	border-radius:50px;
	margin-top:50px;
	margin-left:30px;
	margin-right:60px;
	border-style: none; 
}
/*.card__text h2 {
	margin-top:0.1em;
  	margin-bottom: 0.3em;
  	font-size: 2em;
  	color:#000;
  	text-align:center;
}*/
.logoutbtn{
    color:black;
    text-decoration: none;
    border: 1px solid #36622B;
    border-radius: 4px;
    transition: all 0.3s ease 0s;
    background:white;
	padding:10px;
    margin-top:20px;
	display:inline;
}
.logoutbtn:hover{
	 color: #fff;
    background:#14279B;
    border: 1px solid #748dff;
}
/*Enrolled course title*/
#title{
	height:60px;
	margin-top:50px;
	align-items:center;
	margin-left:250px;
	font-weight:bold;
	font-size:30px;
}
.card_text #change{
	margin-left:100px;

}
/*Cards' body*/
.mainmain{
    display:grid;
    grid-template-columns:500px 500px;
    gap:20px 80px;
    flex-wrap: wrap;
    padding-left:230px;
    padding-right:320px;
}
/*Card container*/
.grid-container{
    margin-top:30px;
    margin-bottom:50px; 
}
/*Card*/
.grid-item{
	border: 2px solid white;
    box-shadow: 10px 4px 8px 0 rgba(0, 0, 0, 0.2), 2px 2px 2px 0 rgba(229, 194, 41, 0.264);
    /*border-radius: 15px 50px ;*/
    border-radius:15px;
    transition: all .3s cubic-bezier(.445, .05, .55, .95);
    border: 1px solid #f0eded;
    transition: all 1s ease 0s;
    cursor: pointer;
    margin-right:30px;
    width:400px;
    background-color:white;
    
}
.grid-item:hover{
    box-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
    border: 1px solid #111;
}
.grid-item .title{
	margin-top:20px;
	margin-left:20px;
	margin-bottom:10px;
	font-size:20px;
}
.grid-item table{
	margin-bottom:10px;
	padding:5px;
	width:300px;
	margin-left:70px;
}
.grid-item table td{
	text-align:left;
	padding-left:10px;
	font-size:16px;
}
.grid-item table tr{
	height:30px;
}
/*Card Photo*/
.gridphoto img{
	width:180px;
	height:180px;
	border-radius:15px;
	/*border-radius:100px;
	margin-right:60px;*/
	margin-top:20px;
	margin-left:100px;
	border-style: none;
}
/*view materials Button*/
.viewmaterial {
    padding: 10px 30px;
    color:black;
    text-decoration: none;
    border: 1px solid #36622B;
    border-radius: 4px;
    margin-top:0px;
    margin-bottom:20px;
    margin-left:120px;
    transition: all 0.3s ease 0s;
    background:white;
}
.viewmaterial:hover {
    color: #fff;
    background:#14279B;
    border: 1px solid #748dff;
}
a {
  background-color: transparent;
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


</style>
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
		        <h4>User name</h4>
		    </div>
	    </div>
	</header>
	
	<div style="height:60px;">------------</div>
	<div class="profiletitle"><b>Your Profile</b></div>
	<div id="profilecard">
		<div class="container">
			<div class="card">
				<img src="avatar.jpeg"/>
			</div>
		    <div class="card__text">	
				<label>Name</label><br>
				<p>User Name</p>
				<label>Email</label>
				<p>kjjdfs@gmail.com</p>
				<label>Your Total Enrolled Courses </label>
				<p>6</p>
				<div id="change">
					<button class="logoutbtn" onclick="changePwd()">Change Password <i class="fa-solid fa-sliders"></i></button>
					<button class="logoutbtn" onclick="logout()">Logout <i class="fa-solid fa-right-to-bracket"></i></button>
				</div>
			</div>
		</div>	
	</div>
	
	<div id="title">Your Enrolled Courses</div>
	<div class="mainmain">
		<div class="grid-container">
        	<div id="b1" class="grid-item">
        	
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
				
			</div>
		</div>
		
        <div class="grid-container">
        	<div id="b1" class="grid-item">
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
			</div>
		</div>
		<div class="grid-container">
        	<div id="b1" class="grid-item">
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
			</div>
		</div>
		<div class="grid-container">
        	<div id="b1" class="grid-item">
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
			</div>
		</div>
		<div class="grid-container">
        	<div id="b1" class="grid-item">
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
			</div>
		</div>
		<div class="grid-container">
        	<div id="b1" class="grid-item">
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
			</div>
		</div>
		<div class="grid-container">
        	<div id="b1" class="grid-item">
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
			</div>
		</div>
		<div class="grid-container">
        	<div id="b1" class="grid-item">
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
			</div>
		</div>
		<div class="grid-container">
        	<div id="b1" class="grid-item">
            	<div class="gridphoto">
                	<img src="avatar.jpeg" alt="Image"/>
                </div>
                <div>
                	<h2 class="title">Advanced Java Enterprise Edition <i class="fa-solid fa-code"></i></h2>
                    <table>
                    	<tr>
                        	<td><b>Instructor</b></td>
                            <td>Mu Mu Swe</td>
                        </tr>
                        <tr>
                        	<td><b>Level</b></td>
                            <td>Advanced</td>
                        </tr>
                        <tr>
                            <td><b>Duration</b></td>
                            <td>4 months</td>
                        </tr>
                     </table>
                     <div style="display:flex;align-item:center;gap:20px;">
                     	<button type="button" class="viewmaterial" onclick="enroll(${lect.course_id})">View Materials</button>
                     </div>
				</div>
			</div>
		</div>     
	</div>
</body>
</html>
