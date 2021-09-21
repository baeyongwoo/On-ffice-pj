<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
 <form action="/user/userInfo" method="post">
 	<input type="hidden" name="uid" value="${login_session }">
 	<input type="submit" value="회원정보">
 </form>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
