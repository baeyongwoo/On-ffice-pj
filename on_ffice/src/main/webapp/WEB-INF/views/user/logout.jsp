<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<h1>로그아웃 페이지</h1>
	<p>오늘 할일 끝내셧나요?? 로그아웃하실려면 아래 눌러주세요</p>
	<form action="/user/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="submit" value="로그아웃">
	</form>
	
</body>
</html>