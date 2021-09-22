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
	<h2>부서 자유 게시판 수정 페이지</h2>
	
	<form action="/dpcommunity/dpcupdate" method="post">
		<input type="text" name="dc_num" value="${dpcommunity.dc_num}" readonly="readonly"><br/>
		<input type="text" name="dp_code" value="${dpcommunity.dp_code}" readonly="readonly"><br/>
		<input type="text" name="dtitle" value="${dpcommunity.dtitle}"><br/>
		<textarea rows="10" cols="50" name="dcontent">${dpcommunity.dcontent}</textarea><br/>
		<input type="text" name="dwriter" value="${dpcommunity.dwriter}" readonly="readonly"><br/>
		<input type="submit" value="수정완료">
	</form>
</body>
</html>