<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<style>
/*@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");*/
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
.grid-container{
    flex: 0 0 calc(33.333% - 60px);
    margin-top:30px;
    margin-bottom:50px;
    margin-left:200px;
    color:#14279B;
}
.grid-item{
	border: 2px solid white;
    box-shadow: 10px 4px 8px 0 rgba(0, 0, 0, 0.2), 2px 2px 2px 0 rgba(229, 194, 41, 0.264);
    border-radius: 15px 50px ;
    transition: all .3s cubic-bezier(.445, .05, .55, .95);
    border: 1px solid #f0eded;
    transition: all 1s ease 0s;
    cursor: pointer;
    margin-right:30px;
    display:flex;
    width:1200px;
    margin-bottom:10px;
    padding-bottom:20px;
    max-height:283px;
}
.grid-item:hover{
    box-shadow: 5px 30px 56.1276px rgb(55 55 55 / 12%);
    border: 1px solid #14279B;
    translate: -0px -5px ;
}
.grid-container .enrollBTN {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding:15px 50px 20px 0;
}
.title{
	color:#14279B;
}
.grid-item table td{
	text-align:left;
	font-size:16px;
	padding-bottom:5px;
	padding:5px 0;
}
.grid-item .table1{
	width:500px;
}
.grid-item .table1 .2nd{
	background-color:yellow;
	
}
.grid-item .table2{
	margin-left:50px;
	width:550px;
}
.grid-item .description{
	text-align: justify;
	margin-left:50px;
}
.grid-item table .table1firstcol{
	width:130px;
}
.grid-item table .table2firstcol{
	width:100px;
}
img{
	width:200px;
	height:200px;
	border-radius:100px;
	margin-top:30px;
	margin-left:30px;
	margin-right:30px;
}
/*view materials Button*/
.viewmaterial {
    padding: 10px 30px;
    color:#fff;
    text-decoration: none;
    border: 1px solid #14279B;
    border-radius: 4px;
    margin-left:30px;
    transition: all 0.3s ease 0s;
    background:#14279B;
}
.viewmaterial:hover {
    color:#14279B ;
    background:white;
    border: 1px solid #14279B;
}
</style>
</head>
<body>
	<div class="grid-container">
    	<div id="b1" class="grid-item">
        	<div>
            	<img src="cat.jfif" alt="Image">
	        </div>
            <div>
            	<div class="enrollBTN">
                	<h2 class="title">Intermediate C# <i class="fa-solid fa-code"></i></h2>
                    <div>
                    	<button  class="viewmaterial" onclick="alert('Hello World')" type="button">Enroll</button>
                    </div>
                </div>
			<div style="margin-left:0px;margin-right:40px;width:880px;">
                <div style="display:flex;">
	                <table class="table1">
	                	<tr>
	                    	<td class="table1firstcol"><b>Instructor</b></td>
	                        <td class="2nd">Hsu Wai Linn</td>
	                    </tr>
	                    <tr>
	                 		<td class="table2firstcol"><b>Duration</b></td>
	                    	<td class="2nd" >4 months</td>
	                    </tr>
	                	<tr>
	                    	<td class="table1firstcol"><b>Enroll Deadline</b></td>
	                    	<td class="2nd" >19/8/2024</td>
	                 	</tr>
	                 	<tr>
	                 		<td class="table2firstcol"><b>Level</b></td>
	                        <td class="2nd" >Intermediate</td>
	                    </tr>
	                 	<tr>
	                 		<td class="table2firstcol"><b>Start Date</b></td>
	                    	<td class="2nd" >22/8/2024</td>
	                    </tr>
	                 </table >
	                 <div style="width:700px;">
		             	<table class="table2">
		          	        <tr>
		                 		<td class="table2firstcol" style="display:flex;"><b>Description</b></td>
		                    	<td class="22nd" style="line-height:1.5;text-align:justify;">C# (pronounced "C sharp") is a programming language developed by Microsoft within its.NET framework. It was first introduced in 2000 as part of Microsoft's ntroduced in 2000 as part of Microsoft'sntroduced in 2000 as part of Microsoft's ntroduced in 2000 as part of Microsoft's
		                    	</td>
		                    </tr>
		                </table>
                    <!--<p class="description" style="height:30px;line-height:1.5"><b style="display:flex;">Description</b>C# (pronounced "C sharp") is a programming language developed by Microsoft within its.NET framework. It was first introduced in 2000 as part of Microsoft's ntroduced in 2000 as part of Microsoft'sntroduced in 2000 as part of Microsoft's ntroduced in 2000 as part of Microsoft's
                    </p>-->
                </div>
                 </div>
                 
			</div> 	
               	
			</div>
		</div>
	</div>
</body>
</html>