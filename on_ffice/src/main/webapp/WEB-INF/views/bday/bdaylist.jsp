<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1 class="text-center">�̴��� ����</h1>
		<table class="table">
		<thaed>
			<tr>
				<th scope="col">�̸�</th>
				<th scope="col">�μ�</th>
				<th scope="col">����</th>
				<th scope="col">����</th>
			</tr>
		</thaed>
		<tbody>	
			<c:forEach items="${blist }" var="list">
			<tr>
				<td>${list.name }</td>
				<td>${list.dp_code }</td>
				<td>${list.position_code }</td>
				<td>${list.birth }</td>
			</tr>	
			
			</c:forEach>
	  </tbody>		
		</table>
</body>
</html>