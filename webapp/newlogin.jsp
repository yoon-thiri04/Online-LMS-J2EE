<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	body{
		margin: 0;
		padding: 0;
		background: url(https://i.pinimg.com/736x/fd/78/c7/fd78c7534ed69af190d268a14e2f6a9a.jpg);
		background-size: cover;
		font-family: sanf-serief;
	}
	.title{
		text-align: center;
		padding: 50px 0 20px;
	}
	.title h1{
		margin: 0;
		padding: 0;
		color: #262626;
		text-transform: uppercase;
		font-size: 36px;
	}
	.container{
		width: 50%;
		height: 400px;
		background: #fff;
		margin: 0 auto;
		border: 2px solid black;
		box-shadow: 0 15px 40px rgba(0,0,0,.5);
	}
	.container .left{
		float: left;
		width:50%;
	    height: 400px;
	    background: url(https://img.freepik.com/premium-photo/smartphone-balancing-with-pink-background_23-2150271746.jpg);
		background-size: cover;
		box-sizing: border-box;
	}
	.container .right{
		float: left;
		width:50%;
	    height: 400px;
		box-sizing: border-box;
	}
	.formBox{
		width: 100%;
		padding: 80px 40px;
		box-sizing: border-box;
		height: 400px;
		background: #fff;
	}
	.formBox p{
		margin: 0;
		padding: 0;
		font-weight: bold;
		color: #a6af13;
	}
	.formBox input{
		width: 100%;
		margin-bottom: 25px;
		
	}
	.formBox input[type="text"],.formBox input[type="password"]{
		border: none;
		border-bottom: 2px solid #a6af13;
		outline: none;
		height: 40px;
	}
	.formBox input[type="text"]:focus,.formBox input[type="password"]:focus{
		border-bottom: 2px solid #262626;
	
	}
	.formBox input[type="submit"]{
		border: none;
		outline: none;
		height: 40px;
		color: #fff;
		background: #262626;
		cursor: pointer;
	}
	.formBox input[type="submit"]:hover{
		background: #a6af13;
	}
</style>
</head>
<body>
	<div class="title"><h1>Login</h1></div>
		<div class="container">
			<div class="left"></div>
			<div class="right">
				<div class="formBox">
					<form action="">
						<p>Email</p>
						<input type="text" name="email" placeholder="Email">
						<p>Password</p>
						<input type="password" name="password" placeholder="Password">
						<input type="submit" name="submit" value="Login">
						
					</form>
				</div>
			</div>
		</div>
</body>
</html>