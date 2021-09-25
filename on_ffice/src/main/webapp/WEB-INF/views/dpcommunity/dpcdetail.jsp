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
	<script>
		function back() {
			window.history.back();
		}
	</script>
	
	<button onclick="back();">뒤로가기</button>
	<c:set var="DpCd" value="${dpcdetail}"></c:set>
	<h2>${DpCd.dc_num}번 게시글 입니다.</h2>
	<h2>부서번호 : ${DpCd.dp_code}</h2>
	<h2>글제목 : ${DpCd.dtitle}</h2>
	<h2>글본문 : ${DpCd.dcontent}</h2>
	<h2>글쓴이 : ${DpCd.dwriter}</h2>
	<h2>작성일 : ${DpCd.ddate}</h2>
	<h2>수정일 : ${DpCd.dupdate}</h2>
	<h2>조회수 : ${DpCd.dhits}</h2>
	
	<a href="/dpcommunity/dpclist"><button>게시판으로</button></a>
		<c:if test="${DpCd.dwriter eq login_session.name}">
		
		<form action="/dpcommunity/dpcupdate" method="post">
			<input type="hidden" name="dc_num" value="${DpCd.dc_num}">
			<input type="submit" value="수정하기">
		</form>
		<form action="/dpcommunity/dpcdelete" method="post">
			<input type="hidden" name="dc_num" value="${DpCd.dc_num}">
			<input type="submit" value="삭제하기">
		</form>
		</c:if>
</body>
</html>