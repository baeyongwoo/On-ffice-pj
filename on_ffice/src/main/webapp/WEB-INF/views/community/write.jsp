<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>알림 게시판 작성 창</h2>
	
	<form action="/community/write" method="post">
		<input type="text" name="ntitle" placeholder="제목" required="required"></br>
		<textarea rows="10" cols="50" name="ncontent" required="required"></textarea></br>
		<input type="text" name="nwriter" value="${login_session}" readonly="readonly"></br>
		<input type="submit" value="작성완료">
		<input type="reset" value="다시작성">
	</form>
</body>
</html>