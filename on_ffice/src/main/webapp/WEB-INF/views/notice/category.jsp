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

		<a href="/notice/noticeList"><button>전체보기</button></a>
		<c:forEach items="${category}" var="cg">
		<a href="/notice/noticeDetail?notice_num=${cg.notice_num}">${cg.notice_num}</a>
		${cg.ncategory}
		${cg.ntitle}
		${cg.nwriter}
		${cg.ndate}
		${cg.nhits}
		<br/>
	</c:forEach>

</body>
</html>