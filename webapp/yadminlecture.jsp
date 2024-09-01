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
   background-color:#DDF2FD;
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
  	background: #427D9D;
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
	background:#164863;
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
/*Table Title*/
#title{
	height:60px;
	width:1250px;
	margin-left:250px;
	margin-top:10px;
	display:flex;
	align-items:center;
}
/*table head*/
#alltable{
	margin-left:250px;
}
#tablehead .th{
	background-color:#9BBEC8;
	height:60px;
	text-align:center;
	color:black;
}
/*table body or Lectures'list*/
#tbo{
	margin-left:0px;
	text-align:center;
	background-color:white;
}
#tbo td{
	background-color:white;
	
}
#tbo td .action{
  	display:inline-block;
  	padding:5px 0;
  	/*border-radius:5px;
  	border:2px solid black;
  	background-color:#164863;*/
  	margin-right:3px;
  	color:black;
  	transition: all 0.3s ease 0s;
}
#tbo td .edit:hover{
	color:blue;
}
#tbo td .delete:hover{
	color:red;
}
.fa-pen-to-square,.fa-trash{
	font-size:20px;
}
/*Add button*/
.btn{
	width:210px;
	height:70px;
	color:black;
	display:flex;
	align-items:center;
	transition: all 0.5s ease 0s;
}
.btn i{
	font-size:20px;
	margin-left:10px;
	color:white;
}
#Addbtn{
	display:flex;
	align-items:center;
	margin-left:1050px;
	margin-top:20px;
	margin-bottom:25px;
	background-color:#427D9D;
	height:40px;
	width:90px;
	padding-left:5px;
	padding-right:5px;
	border:1px solid black;
	transition: all 0.5s ease 0s;
	border-radius:20px;
}
#Addbtn h3{
	color:white;
}
/*Table*/
.col1{
	width:70px;
	padding-top:5px;
}
.col2{
	width:180px;
}
.col3{
	width:260px;
}
.col4{
	width:130px;
}
.col5{
	width:250px;
	padding:0 5px;
}
.col6{
	width:110px;
}
.col7{
	width:110px;
}
.col8{
	width:145px;
}
table, th, td{
	border: 0.1px solid black;
	border-collapse: collapse;
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
	        	<i class="fa-solid fa-circle-user"></i>
	        	<h3>User name</h3>
    		</div>
    	</div>
  	</header>
 
  	<div style="height:60px;">------------</div>
  		<div class="sidebar">
	    	<ul>
				<li><a href="Admin.jsp"><i class="fa-solid fa-qrcode"></i>Dashboard</a></li>
			    <li><a href="CourseAdmin.jsp"><i class="fa-solid fa-book-open"></i>Courses</a></li>
			    <li><a href="lectures.jsp"><i class="fa-solid fa-chalkboard-user"></i>Lecturers</a></li>
			    <li><a href="AdminUserlist.jsp"><i class="fa-solid fa-users"></i>Register Users</a></li>
				<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i>Log out</a></li>
			</ul>
		</div>
		<div id="title">
			<h2>Lecturers</h2>
			<div id="Addbtn">
				<a href="LecturesAddForm.jsp" class="btn">
					<h3>Add</h3><i class="fa-solid fa-user-plus"></i>
	    		</a>
	    	</div>
    	</div>
    	<div id="alltable">
        	<table id="tablehead">
            	<tr>
	                <td class="th col1"><h3>Photo</h3></td>
	                <td class="th col2"><h3>Name</h3></td>
	                <td class="th col3"><h3>Email</h3></td>
	                <td class="th col4"><h3>Qualification</h3></td>
	                <th class="th col5"><h3>Course Title</h3></th>
	                <th class="th col6"><h3>Started On</h3></th>
	                <th class="th col7"><h3>Enrollment Deadline</h3></th>
	                <td class="th col8"><h3>Action</h3></td>
            	</tr>
            </table>
            <table id="tbo">
	            <tr>
	                <td class="td col1"><img src="cat.jfif" width="51" height="50"/></td>
	                <td class="td col2">Toe Toe Naing</td>
	                <td class="td col3">toetoenaing@gmail.com</td>
	                <td class="td col4">Bc.Sc</td>
	                <td class="td col5">Getting Start with Java Getting Start with Java</td>
	                <td class="td col6">2024-10-10</td>
	                <td class="td col7">2024-10-2</td>
	                <td class="td col8">
	                	<a href="${pageContext.request.contextPath}/lecturersController?action=EDIT&email=&courseName=" class="action edit">Edit <i class="fa-solid fa-pen-to-square"></i></a>
	                	<a href="${pageContext.request.contextPath}/DeleteLectureServlet?action=DELETE&email="  class="action delete">Delete <i class="fa-solid fa-trash"></i></a>
	                </td>
	            </tr>
            </table>
               </div>
</body>
</html>
