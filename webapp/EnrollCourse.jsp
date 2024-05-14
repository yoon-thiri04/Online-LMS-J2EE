<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/coursesController" method="post">
		
		Title<input type="text" name="title"><br>
		Duration<input type="text" name="duration"/><br>
		Level<input type="text" name="level"><br>
		Category<input type="text" name="category"><br>
		Description<input type="text" name="description"><br>
		<input type="hidden" name="course_id"><br>
		<button type="submit">Add</button>
	</form>
</body>
</html>