<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
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
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${btnMaker.prev}">
				<li class="page-item">
				<a class="page-link" href="/community/CMList?pageNum=${btnMaker.startPage - 1}">
				Previous</a>
				</li>
			</c:if>
			
			<c:forEach begin="${btnMaker.startPage}"
						end="${btnMaker.endPage}"
						var="pageNum">
				<li class="page-item ${btnMaker.cri.pageNum == pageNum ? 'active' : ''}">
				<a class="page-link" href="/community/CMList?pageNum=${pageNum}">${pageNum}</a>
				</li>
			</c:forEach>
			
			<c:if test="${btnMaker.next}">
				<li class="page-item">
				<a class="page-link" href="/community/CMList?pageNum=${btnMaker.endPage + 1}">Next</a></li>	
			</c:if>
		</ul>
	</nav>

 <script>
 	var ccode = "${community_num}";
 	console.log(ccode);
 
 </script>
 	

 
</body>
</html>