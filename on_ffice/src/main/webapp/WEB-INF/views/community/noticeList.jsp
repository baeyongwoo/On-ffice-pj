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
		<a href="/community/write"><button>글쓰러가기</button></a></br>	
	</c:if>
	
	<c:forEach items="${noticeList}" var="nl">
		${nl.notice_num}
		${nl.ntitle}
		${nl.ncontent}
		${nl.nwriter}
		${nl.ndate}
		${nl.nupdate}
		${nl.nhits}
		</br>
	</c:forEach>
	
</body>
</html>