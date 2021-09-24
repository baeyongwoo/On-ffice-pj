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
	<c:if test="${delete_result eq 'fail'}">
		<script>
			window.close();
		</script>
		
	</c:if>
	<c:if test="${modify_result eq 'success'}">
		<script>
			alert('회원 정보 수정이 완료되었습니다.');
		</script>
	</c:if>
		<span style="color:red; font-weight: bold">*정보 조회</span> <br> 
	<form name="regForm" method="post" action="/user/register" onsubmit="return regCheck(this)"> 
		<table border="1"> 
			<tr> 
				<th>*아이디</th> 
				<td> 
					<input type="text" name="uid" id="id" size="15" readonly value="${userInfo.uid }"> 
				</td> 
			</tr> 
			
			<tr> 
				<th>*비밀번호</th> 
				<td>
					<input type="password" name="upw" id="upw" size="15" required readonly value="${userInfo.upw }">
				</td> 
			</tr> 
			
			<tr> 
				<th>*이름</th> 
				<td>
					<input type="text" name="name" id="name" size="15" required readonly value="${userInfo.name }">
				</td>
			</tr> 
				<tr> 
					<th>*이메일</th> 
					<td> 
						<input type="text" name="email" id="email" size="30" readonly value="${userInfo.email }"> 
		
					</td> 
				</tr> 
					<tr> 
					<th>전화번호</th> 
					<td>
						<input type="tel" name="cp" size="15" readonly value="${userInfo.cp }">
					</td> 
				</tr>
				
				<tr> 
					<th>프로필 사진</th> 
					<td>
						<input type="text" name="profile_img" size="15" readonly value="${userInfo.profile_img }">
					</td> 
				</tr>
				
				<tr> 
					<th>성별</th> 
					<td>
						<input type="text" name="gender" size="15" readonly value="${userInfo.gender }">
					</td> 
				</tr>
				
				<tr> 
					<th>생일</th> 
					<td>
					
						<input type="text" id="start" name="birth" readonly value="${userInfo.birth }">
					      
					</td> 
				</tr>
				<tr> 
					<th>부서번호</th> 
					<td>
						<input type="text" name="dp_code" id="dp_code" readonly value="${userInfo.dp_code}"size="15">
					</td> 
				</tr>
				<tr> 
					<th>직위번호</th> 
					<td>
						<input type="text" name="position_code" id="position_code" size="15" readonly value="${userInfo.position_code }">
					</td> 
				</tr>

		</table>
	</form>
	<form action="/user/goUserModify" method="post">
		<input type="hidden" name="uid" value="${userInfo.uid}">
		<input type="submit" value="회원정보수정">
		<input type="button" value="돌아가기" onclick ="location.href ='/'">
	</form>
	
	<input type="button" value="회원탈퇴" onclick="deleteCheck()">
	
	<script>
		
		function deleteCheck() {
			var check = confirm('정말로 회원 탈퇴를 진행하시겠습니까?');
			
			if(check) {
				window.open("/user/deleteCheckForm", "idwin", "width=400, height=350");
				
			}
			else {
				return false;
			}
		}
	</script>
	
</body>
</html>