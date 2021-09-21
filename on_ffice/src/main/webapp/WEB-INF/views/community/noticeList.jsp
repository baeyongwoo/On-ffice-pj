<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check_position() {
		var position = document.getElementsById("login_session");
		console.log(position);
	}	
</script>
</head>
<body>
	<h1>알림 게시판</h1>
	<button><a href="/community/write" onclick="check_position('${login_session}')"></a>글쓰러가기</button></br>
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