<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>

<body>


	<h2>회원 탈퇴를 위해 비밀번호를 입력해주세요.</h2>
	<form name="pwCheck" id="pwCheck" action="/user/deleteCheck" method="post">
		비밀번호<input type="password" name="upw" id="upw">
		<input type="hidden" name="uid" value="${login_session.uid }">
		<input type="hidden" name="upwSession" value="${login_session.upw }">
		<input type="submit" value="회원탈퇴" onclick="redirect()">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	</form>
	
		<script>
				 function redirect() {
				console.log('패스워드 세션 값 : ' + document.pwCheck.upwSession.value);
				console.log('패스워드 입력 값 : ' + document.pwCheck.upw.value);

					
					
					if(document.pwCheck.upw.value===document.pwCheck.upwSession.value){
							
							
							alert('회원탈퇴 완료');
							
							opener.parent.location="/user/login";
				
							window.close();
								
						}
					else {
						alert('비밀번호가 틀렸습니다.')
						return false;
					}
					}
					
		
		</script>
	
	
</body>
</html>