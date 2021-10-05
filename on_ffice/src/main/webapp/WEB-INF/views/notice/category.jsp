<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<a href="/notice/noticeList"><button>전체보기</button></a><br>
		<c:forEach items="${category}" var="cg">
		<a href="/notice/noticeDetail?notice_num=${cg.notice_num}">${cg.notice_num}</a>
		${cg.ncategory}
		${cg.ntitle}
		${cg.nwriter}
		${cg.ndate}
		${cg.nhits}
		<br/>
	</c:forEach>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${btnMaker.prev}">
				<li class="page-item">
				<a class="page-link" href="/notice/category?pageNum=${btnMaker.startPage - 1}">
				Previous</a>
				</li>
			</c:if>
			
			<c:forEach begin="${btnMaker.startPage}"
						end="${btnMaker.endPage}"
						var="pageNum">
				<li class="page-item ${btnMaker.cri.pageNum == pageNum ? 'active' : ''}">
				<a class="page-link" href="/notice/category?pageNum=${pageNum}">${pageNum}</a>
				</li>
			</c:forEach>
			
			<c:if test="${btnMaker.next}">
				<li class="page-item">
				<a class="page-link" href="/notice/category?pageNum=${btnMaker.endPage + 1}">Next</a></li>	
			</c:if>
			
		</ul>
	</nav>
	

</body>
</html>