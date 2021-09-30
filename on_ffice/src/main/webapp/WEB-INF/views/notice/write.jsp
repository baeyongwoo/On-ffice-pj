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
	
	<form action="/notice/write" method="post">
		<select name="ncategory">
			<option value="" selected="disalbed">--선택--</option>
			<option value="공지">공지</option>
			<option value="행사">행사</option>
			<option value="자료">자료</option>
			<option value="기타">기타</option>
		</select>
		<input type="text" name="ntitle" placeholder="제목" required="required"><br>

		<textarea rows="10" cols="50" name="ncontent" required="required"></textarea>
		<input type="hidden" name="nwriter" value="${login_session.uid}" placeholder="로그인해주세요" readonly="readonly"></br>
		<input type="text" value="${login_session.name}" placeholder="로그인해주세요" readonly="readonly"></br>
		<input type="submit" value="작성완료">
		<input type="reset" value="다시작성">
	</form>
</body>
</html>