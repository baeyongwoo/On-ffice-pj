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
	<h1>자유 게시판</h1>
	<a href="/community/write"><button>글쓰러가기</button></a></br>	
	
	<c:forEach items="${cmList}" var="cl">
		<a href="/community/CMDetail?community_num=${cl.community_num}">${cl.community_num}</a>
		${cl.ctitle}
		${cl.cwriter}
		${cl.cdate}
		${cl.chits}
		</br>
	</c:forEach>
	<a href="/company/lobby">로비로가기</a>
	<!-- url로 접속할 때 잘못된 주소로 접근하면 error창 처리하는 것 만들기 -->
	<form action="/user/userInfo" method="post">
 	<input type="hidden" name="uid" value="${login_session}">
 	<input type="submit" value="회원정보">
 </form>
 <script>
 	var ccode = "${community_num}";
 	console.log(ccode);
 
 </script>
 

 
</body>
</html>