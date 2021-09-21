<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>

<script type="text/javascript">
		
		 function redirect() {
			
			if(document.pwCheck.submit()){
				
			opener.document.location.href="/user/login";
	
			self.close();
				
			}
			
				
		}

</script>

	<h2>회원 탈퇴를 위해 비밀번호를 입력해주세요.</h2>
	<form action="/user/deleteCheck" name="pwCheck" method="post">
		비밀번호<input type="password" name="upw">
		<input type="hidden" name="uid" value="${login_session }">
		<input type="submit" value="회원탈퇴" onclick="redirect()">
	</form>
</body>
</html>