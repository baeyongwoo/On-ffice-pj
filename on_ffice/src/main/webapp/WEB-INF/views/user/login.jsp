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
<script src='https://www.google.com/recaptcha/api.js'></script> 
<script type="text/javascript"> 
/* 서브밋 전에 리캡챠 체크 여부 를 확인합니다. */
 
 function FormSubmit() { 
	if (grecaptcha.getResponse() == ""){ 
		alert("리캡챠를 체크해야 합니다."); 
		return false; 
		} else {
			return true; 
			} 
	}


	<h2>로그인 창입니다.</h2>
	<c:if test="${register_result eq 'success' }">
		<script>
			alert('회원 가입이 정상적으로 진행되었습니다.');
			window.close();
		</script>
	</c:if>
	<c:if test="${login_result eq 'fail'}">
		<script>
			alert('아이디 혹은 패스워드를 확인해주세요.');
		
		</script>
	</c:if>
	<form action ="/user/login" method="post" onsubmit="return FormSubmit();">
		아이디<input type="text" name="uid" placeholder="ID" required><br/>
		비밀번호<input type="password" name="upw" placeholder="PASSWORD" required><br/>
		<input type="submit" value="로그인">
		<input type="reset" value="초기화"><br/>
		<input type="button" value="회원가입" onclick ="location.href ='/user/register'">
		<div class="g-recaptcha" data-sitekey="6LezJokcAAAAAGeSI922uGsecDbO3MCUTxplIzLj"></div>

	</form>
	
	
</body>
</html>