<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="nd" value="${noticeDetail}"></c:set>
	<h2>${nd.notice_num}번쨰 게시글 입니다</h2>
	<h2>제목 :  ${nd.ntitle}</h2>
	<h2>내용 : ${nd.ncontent}</h2>
	<h2>작성자 : ${nd.nwriter}</h2>
	<h2>작성일 : ${nd.ndate}</h2>
	<h2>최근 업데이트 : ${nd.nupdate}</h2>
	<h2>조회수 : ${nd.nhits}</h2>
	
	<a href="/notice/noticeList">목록으로</a>
	
	<c:if test="${nd.nwriter eq login_session}">
	
		<form action="/notice/noticeDelete" method="post">
			<input type="hidden" name="notice_num" value="${nd.notice_num}">
			<input type="submit" value="삭제하기">
		</form>
		
		<form action="/notice/noticeUpdate" method="post">
			<input type="hidden" name="notice_num" value="${nd.notice_num}">
			<input type="submit" value="수정하기">
		</form>
	</c:if>
</body>
</html>