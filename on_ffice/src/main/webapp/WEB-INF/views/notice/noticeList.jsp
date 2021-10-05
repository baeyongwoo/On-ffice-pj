<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function selectreq() {
		var select = document.getElementById("select").value;
		window.location.href = '/notice/category?ncategory=' + select;

	}
</script>
</head>
<body>

	<h1>알림 게시판</h1>
	<c:set var="position" value="${login_session.position_code}" />
	<c:if test="${position >= 6}">
		<a href="/notice/write"><button>글쓰러가기</button></a>
	</c:if>

	<select id="select" onchange="selectreq()">
		<option value="" selected="disalbed">--선택--</option>
		<option value="공지">공지</option>
		<option value="행사">행사</option>
		<option value="자료">자료</option>
		<option value="기타">기타</option>
	</select>
	<br>
	
	<c:forEach items="${noticeList}" var="nl">
		<a href="/notice/noticeDetail?notice_num=${nl.notice_num}">${nl.notice_num}</a>
		<c:out value="${nl.ncategory}" />
		<c:out value="${nl.ntitle}" />
		<c:out value="${nl.nwriter}" />
		<c:out value="${nl.ndate}" />
		<c:out value="${nl.nhits}" />
		<br />
	</c:forEach>
	<!-- url로 접속할 때 잘못된 주소로 접근하면 error창 처리하는 것 만들기 -->
	<a href="/company/lobby"><button>로비로가기</button></a>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${btnMaker.prev}">
				<li class="page-item">
				<a class="page-link" href="/notice/noticeList?pageNum=${btnMaker.startPage - 1}">
				Previous</a>
				</li>
			</c:if>
			
			<c:forEach begin="${btnMaker.startPage}"
						end="${btnMaker.endPage}"
						var="pageNum">
				<li class="page-item ${btnMaker.cri.pageNum == pageNum ? 'active' : ''}">
				<a class="page-link" href="/notice/noticeList?pageNum=${pageNum}">${pageNum}</a>
				</li>
			</c:forEach>
			
			<c:if test="${btnMaker.next}">
				<li class="page-item">
				<a class="page-link" href="/notice/noticeList?pageNum=${btnMaker.endPage + 1}">Next</a></li>	
			</c:if>
			
		</ul>
	</nav>

</body>
</html>