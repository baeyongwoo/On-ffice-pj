<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
	<h1>알림 게시판</h1>
	<c:set var="position" value="${position}" />
	<c:if test="${position >= 6}">
		<a href="/notice/write"><button>글쓰러가기</button></a></br>	
	</c:if>
	
	<c:forEach items="${noticeList}" var="nl">
		<a href="/notice/noticeDetail?notice_num=${nl.notice_num}">${nl.notice_num}</a>
		${nl.ntitle}
		${nl.nwriter}
		${nl.ndate}
		${nl.nhits}
		</br>
	</c:forEach>
	<!-- url로 접속할 때 잘못된 주소로 접근하면 error창 처리하는 것 만들기 -->
	<form action="/user/userInfo" method="post">
 	<input type="hidden" name="uid" value="${login_session.uid }">
 	<input type="submit" value="회원정보">
 </form>
</body>
</html>