<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="/register" method="post">
		<input type="text" name = "uid" required>
		<input type="password" name="upw" required>
		<input type="text" name="name" required>
		<input type="text" name="profile_img">
		<select name="gender" required>
			<option value="남">
			<option value="여">
		</select>   
		<input type="date" name="birth" required>
		<input type="email" name="email" required>
		<input type="tel" name="cp" required>
		<input type="text" name="position_code" required>
		<input type="text" name="dp_code" required>
	</form>
</body>
</html>