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
	<c:set var="cd" value="${csDetail}"></c:set>
	<h2>${cd.community_num}번쨰 게시글 입니다</h2>
	<h2>제목 :  ${cd.ctitle}</h2>
	<h2>내용 : ${cd.ccontent}</h2>
	<h2>작성자 : ${cd.cwriter}</h2>
	<h2>작성일 : ${cd.cdate}</h2>
	<h2>최근 업데이트 : ${cd.cupdate}</h2>
	<h2>조회수 : ${cd.chits}</h2>
	
	<a href="/community/CMList">목록으로</a>
	
	<c:if test="${nd.nwriter eq login_session}">
	
		<form action="/community/CMDelete" method="post">
			<input type="hidden" name="community_num" value="${cd.community_num}">
			<input type="submit" value="삭제하기">
		</form>
		
		<form action="/community/CMUpdate" method="post">
			<input type="hidden" name="community_num" value="${cd.community_num}">
			<input type="submit" value="수정하기">
		</form>
	</c:if>
</body>
</html>