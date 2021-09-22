<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>부서 자유 게시판 글 본푼 페이지</h1>
	글번호 : ${DpCdetail.dc_num}<br/>
	부서번호 : ${DpCdetail.dp_code}<br/>
	글제목 : ${DpCdetail.dtitle}<br/>
	글본문 : ${DpCdetail.dcontent}<br/>
	글쓴이 : ${DpCdetail.dwriter}<br/>
	작성일 : ${DpCdetail.ddate}<br/>
	수정일 : ${DpCdetail.dupdate}<br/>
	조회수 : ${DpCdetail.dhits}<br/>
	<a href="/dpcommunity/dpclist"><button>목록으로</button></a>
	
	<form action="/dpcommunity/dpcupdate" method="post">
		<input type="hidden" name="dc_num" value="${detail.dc_num}">
		<input type="submit" value="수정하기">
	</form>
	<form action="/dpcommunity/dpcdelete" method="post">
		<input type="hidden" name="dc_num" value="${detail.dc_num}">
		<input type="submit" value="삭제하기">
	</form>
	
</body>
</html>