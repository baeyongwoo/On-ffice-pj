<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 자유 게시판</title>
</head>
<script>
</script>
<body>
	<h1>부서 자유 게시판</h1>
	
	<table>
		<tr>
			<th>글번호</th>
			<th>부서명</th>
			<th>사원번호</th>
			<th>글제목</th>
			<th>글본문</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
			<th>조회수</th>
		</tr>
	</table>
	<c:forEach items="${dpCommunityList}" var="dpcList">
		<c:if test="${dpcList.dp_code eq login_session.dp_code}">
			<tr>	
				<td>${dpcList.dc_num}</td>
				<td>${dpcList.dp_code}</td>
				<td>${dpcList.empno}</td>
				<td><a href="/dpcommunity/dpcdetail?dc_num=${dpcList.dc_num}">${dpcList.dtitle}</a></td>
				<td>${dpcList.dcontent}</td>
				<td>${dpcList.dwriter}</td>
				<td>${dpcList.ddate}</td>
				<td>${dpcList.dupdate}</td>
				<td>${dpcList.dhits}</td>
			</tr>
		<br/>		
		</c:if>
	</c:forEach>
	<a href="/dpcommunity/dpcwrite"><button>게시글 작성</button></a>
	<c:set var="user" value="${login_session}" />
	
	<a href="/company/dplobby?dp_code=${user.dp_code}"><button>부서로비가기</button></a>
	<a href="/company/lobby"><button>메인로비로가기</button></a>
</body>
</html>