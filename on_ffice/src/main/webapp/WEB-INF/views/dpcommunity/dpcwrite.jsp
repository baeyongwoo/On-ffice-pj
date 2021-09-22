<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>부서 자유 게시판 작성 창</h2>
	
	<form action="/dpcommunity/dpcwrite" method="post">
		<input type="text" name="dp_code" value="${login_session}" readonly="readonly"><br/>
		<input type="text" name="dtitle" placeholder="글 제목" required="required"><br/>
		<textarea rows="10" cols="50" name="dcontent" required="required"></textarea><br/>
		<input type="text" name="dwriter" value="${login_session}" readonly="readonly"><br/>
		<input type="submit" value="작성완료">
		<input type="reset" value="초기화"> 
	</form>
</body>
</html>