<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function selectreq() {
		var select = document.getElementById("select").value;
		window.location.href = '/notice/category?ncategory='+select;
		
	}
</script>
</head>
<body>
	
	<h1>알림 게시판</h1>
	<c:set var="position" value="${login_session.position_code}" />
	<c:if test="${position >= 6}">
		<a href="/notice/write"><button>글쓰러가기</button></a>
	</c:if>
	
		<select id="select" onchange="selectreq()">
			<option value="" selected="disalbed">--선택--</option>
			<option value="공지">공지</option>
			<option value="행사">행사</option>
			<option value="자료">자료</option>
			<option value="기타">기타</option>
		</select>
	<br>
	
	<c:forEach items="${noticeList}" var="nl">
		<a href="/notice/noticeDetail?notice_num=${nl.notice_num}">${nl.notice_num}</a>
		${nl.ncategory}
		${nl.ntitle}
		${nl.nwriter}
		${nl.ndate}
		${nl.nhits}
		<br/>
	</c:forEach>
	<!-- url로 접속할 때 잘못된 주소로 접근하면 error창 처리하는 것 만들기 -->
	<a href="/company/lobby"><button>로비로가기</button></a>
 	
</body>
</html>