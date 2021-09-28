<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#applyBtn {
		display : none;
	}
</style>
<body>
	
	<div style="text-align: center"></div> 
	<h3>* 이메일 중복 확인 결과 *</h3> 
<c:choose>
	<c:when test = "${email eq 'fail'}">
		해당 이메일은 사용할 수 없습니다.
	</c:when>
	
	<c:otherwise>
		해당 이메일을 사용할 수 있습니다.
		<form action ="/user/emailCodeCheck">
			<input type="text" name="code">
			<input type="hidden" name ="codeString" value="${code }">
			<input type="submit" value="인증하기" onsubmit="emailCodeCheck(this)">
		</form>
		<a id = "applyBtn" href='javascript:apply("${email }")'>적용</a>
	</c:otherwise>
	
</c:choose>
<script>
	 function emailCodeCheck (f) {
			if(f.codeString.value===f.code.value){
				alert('인증이 완료되었습니다.');
				var btn = document.getElementById("applyBtn");
				btn.style.display = 'block';
			}
			else{
				alert('인증 실패');
			}
						
	 }
	 
	 function apply(email){ 
		 //2) 중복확인 email을 부모창에 적용 //부모창 opener 
		 
		 opener.document.regForm.email.value=email;
		 window.close(); 
		 //창닫기 
		 
		 }//apply () end 
		 
</script>

<a href="javascript:history.back()">[다시시도]</a> 
&nbsp; &nbsp; 
<a href="javascript:window.close()">[창닫기]</a>


</body>
</html>