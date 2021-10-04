<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<meta charset="UTF-8">
<title>부서 자유 게시판</title>
</head>
<script>
</script>
<body>
	<h1>부서 자유 게시판</h1>
	
	<table>
		<tr>
			<th>부서명</th>
			<th>사원번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
			<th>조회수</th>
		</tr>
	</table>
	<c:forEach items="${dpCommunityList}" var="dpcList">
		<c:if test="${dpcList.dp_code eq login_session.dp_code}">
			<tr>	
				<c:if test="${dpcList.dp_code eq 1}">
				<td>인사부</td>
				</c:if>
				<c:if test="${dpcList.dp_code eq 2}">
				<td>회계부</td>
				</c:if>
				<c:if test="${dpcList.dp_code eq 3}">
				<td>IT부</td>
				</c:if>
				<c:if test="${dpcList.dp_code eq 4}">
				<td>마케팅부</td>
				</c:if>
				<td>${dpcList.empno}</td>
				<td><a href="/dpcommunity/dpcdetail?dc_num=${dpcList.dc_num}&pageNum=${btnMaker.cri.pageNum}&searchType=${btnMaker.cri.searchType}
					&keyword=${btnMaker.cri.keyword}">${dpcList.dtitle}</a></td>
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
	
		<!-- 검색창 -->
	<form action="/dpcommunity/dpclist" method="get">
		<!-- option태그를 이용해 검색조건 선택창을 만들어주세요. -->
		<select name="searchType">
			<option value="null" 
				<c:out value="${btnMaker.cri.searchType == null ? 'selected': ''}" />>
				분류 없음 
			</option>
			<option value="t" 
				<c:out value="${btnMaker.cri.searchType eq 't' ? 'selected': ''}" />>
				제목
			</option>
			<option value="tc" 
				<c:out value="${btnMaker.cri.searchType eq 'tc' ? 'selected': ''}" />>
				제목 + 본문
			</option>
			<option value="w" 
				<c:out value="${btnMaker.cri.searchType eq 'w' ? 'selected': ''}" />>
				글쓴이
			</option>
		</select>
	
		<input type="text" name="keyword" id="keywordInput"
		placeholder="검색어" value="${btnMaker.cri.keyword}">
		<button id="searchBtn">검색하기</button>
					
	</form>
		
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  
	  	<!-- prev버튼 
	  	btnMaker의 prev가 true일때만 뒤로가기 버튼 출력-->
	    <c:if test="${btnMaker.prev}">
	    	<li class="page-item">
	    		<a class="page-link" 
	    			href="/dpcommunity/dpclist?pageNum=${btnMaker.startPage - 1}&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">
	    				Previous
	    		</a>
	    	</li>
	  	</c:if>
	  	
	  	 <c:forEach begin="${btnMaker.startPage}" 
	    		   end="${btnMaker.endPage}" 
	    		   var="pageNum">
	    	<li class="page-item ${btnMaker.cri.pageNum == pageNum ? 'active' : ' '}">
	    		<a class="page-link" 
	    			href="/dpcommunity/dpclist?pageNum=${pageNum}&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">
	    				${pageNum}
	    		</a>
	    	</li>    	
	    </c:forEach>
	    
	    <!-- next버튼 -->
	    <c:if test="${btnMaker.next}">
	    	<li class="page-item">
	    		<a class="page-link" 
	    			href="/dpcommunity/dpclist?pageNum=${btnMaker.endPage + 1}&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">
	    				Next
	    		</a>
	    	</li>
	    </c:if>
	  </ul>
	</nav>
	

</body>
</html>
