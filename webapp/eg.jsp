<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="java.text.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

.main-body{
	margin-top:50px;
	margin-left:50px;
	padding-bottom:30px;
	
	
}
#body{
	display:flex;
}

</style>
<body>

<div class="main-body">
	<form action="egFileController" method="post" enctype="multipart/form-data" >
	<input type="file" name="file">
	<input type="submit" value="upload">
	</form>
 </div>
</body>
</html>