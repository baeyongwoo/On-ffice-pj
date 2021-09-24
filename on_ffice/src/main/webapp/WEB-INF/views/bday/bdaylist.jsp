<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>이달의 생일</h1>
		<table>
			<tr>
				<th>이름</th>
				<th>부서</th>
				<th>직급</th>
				<th>생일</th>
			</tr>
			<c:forEach items="${list }" var="list">
			<tr>
				<td>${list.name }</td>
				<td>${list.dp_code }</td>
				<td>${list.position_code }</td>
				<td>${list.birth }</td>
			</tr>	
			
			</c:forEach>
				
		</table>
</body>
</html>