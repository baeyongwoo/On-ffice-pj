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
	<h2><c:out value="${cd.community_num}"/>번쨰 게시글 입니다</h2>
	<h2>제목 :  <c:out value="${cd.ctitle}"/></h2>
	<h2>내용 : <c:out value="${cd.ccontent}"/></h2>
	<h2>작성자 : ${cd.cwriter}</h2>
	<h2>작성일 : ${cd.cdate}</h2>
	<h2>최근 업데이트 : ${cd.cupdate}</h2>
	<h2>조회수 : ${cd.chits}</h2>
	
	<a href="/community/CMList">목록으로</a>
	
		<form action="/community/deleteCheck" method="post">
			<input type="hidden" name="community_num" value="${cd.community_num}">
			<input type="submit" value="삭제하기">
		</form>
		
		<form action="/community/CMUpdate" method="post">
			<input type="hidden" name="community_num" value="${cd.community_num}">
			<input type="submit" value="수정하기">
		</form>
		
	<script>
		var result = "${update}";
		console.log(result);
		
		if(result==="success"){
			alert("수정완료했습니다.")
		}else if(result==="fail")(
			alert("비밀번호가 달라 수정 실패했습니다.")
		)
	</script>
</body>
</html>