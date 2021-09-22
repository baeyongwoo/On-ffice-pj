<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>notice수정창</h2>
	
	<form action="/community/Update" method="post">
		<input type="text" name="notice_num" value="${notice.notice_num}" readonly="readonly"></br>
		<input type="text" name="ntitle" value="${notice.ntitle}"></br>
		<textarea rows="10" cols="50" name="ncontent">${notice.ncontent}</textarea></br>
		<input type="text" name="nwriter" value="${notice.nwriter}" readonly="readonly"></br>
		<input type="submit" value="수정완료">
	</form>
	
</body>
</html>