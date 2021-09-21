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
	<h2>로그인 창입니다.</h2>
	<c:if test="${delete_result eq 'success' }">
		<script>
			alert('회원 탈퇴가 정상적으로 진행되었습니다.');
			window.close();
		</script>
	</c:if>
	<c:if test="${login_result eq 'fail'}">
		<script>
			alert('아이디 혹은 패스워드를 확인해주세요.');
		
		</script>
	</c:if>
	<form action ="/user/login" method="post">
		아이디<input type="text" name="uid" placeholder="ID" required><br/>
		비밀번호<input type="password" name="upw" placeholder="PASSWORD" required><br/>
		<input type="submit" value="로그인">
		<input type="reset" value="초기화"><br/>
		<input type="button" value="회원가입" onclick ="location.href ='/user/register'">
	</form>
	
	
</body>
</html>