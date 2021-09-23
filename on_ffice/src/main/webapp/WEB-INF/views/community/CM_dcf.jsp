<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ComMunityDeleteCheckForm.jsp -->
	<h2>글 삭제를 위해 다시 한번 비밀번호를 입력해주세요.</h2>
	<form name="pwCheck" action="/community/CM_dcf" method="post">
		비밀번호<input type="password" name="cpwck" id="cpwck">
		<input type="hidden" name="community_num" value="${community.community_num}">
		<input type="hidden" name="cpw" value="${community.cpw}" id="cpw">
		<input type="submit" value="글삭제" onclick="redirect()">
		
	</form>
	
		<script>
				
				 function redirect() {

					
					
					if(document.pwCheck.cpwck.value===document.pwCheck.cpw.value){
							
							
							alert('글 삭제 완료');
							
							opener.parent.location="/community/CMList";
				
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