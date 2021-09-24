<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자유게시판 수정창</h2>
	
	<form action="/community/Update" method="post">
		<input type="text" name="community_num" value="${cm.community_num}" readonly="readonly"></br>
		<input type="text" name="ctitle" value="${cm.ctitle}"></br>
		<textarea rows="10" cols="50" name="ccontent">${cm.ccontent}</textarea></br>
		<input type="text" name="cwriter" value="${cm.cwriter}" readonly="readonly"></br>
		<input type="password" name="cpwck" placeholder="비밀번호 입력" required="required">
		<input type="submit" value="수정완료">
	</form>
	

</body>
</html>