<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/emailCodeCheck" method="post">
		<input type="hidden" id = "email" name="email">
		<input type="text" name="emailCode" required>
		<input type="submit">
	</form>
	
	<script>
		const email = opener.document.regForm.email.value;
		
		document.getElementById("email").value = email;
		
	</script>
</body>
</html>