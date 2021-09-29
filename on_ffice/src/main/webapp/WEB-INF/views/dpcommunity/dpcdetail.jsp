<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function back() {
			window.history.back();
		}
	</script>
	
	<c:set var="DpCd" value="${dpcdetail}"></c:set>
	<h2>${DpCd.dc_num}번 게시글 입니다.</h2>
	<h2>부서번호 : ${DpCd.dp_code}</h2>
	<h2>글제목 : ${DpCd.dtitle}</h2>
	<h2>글본문 : ${DpCd.dcontent}</h2>
	<h2>글쓴이 : ${DpCd.dwriter}</h2>
	<h2>작성일 : ${DpCd.ddate}</h2>
	<h2>수정일 : ${DpCd.dupdate}</h2>
	<h2>조회수 : ${DpCd.dhits}</h2>
	
	<a href="/dpcommunity/dpclist?pageNum=${param.pageNum}&searchType=${param.searchType}&keyword=${param.keyword}"><button class="btn btn-success">게시판으로</button></a>
		<c:if test="${DpCd.dwriter eq login_session.name}">
			
		<form action="/dpcommunity/dpcupdate" method="post">
			<input type="hidden" name="dc_num" value="${DpCd.dc_num}">
			<button type="submit" class="btn btn-warning" data-bs-toggle="modal">수정하기</button>
		</form>
		<form action="/dpcommunity/dpcdelete" method="post">
			<input type="hidden" name="dc_num" value="${DpCd.dc_num}">
			 <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#createTodo">삭제하기</button>
			 
			 <div class="modal fade" id="createTodo" tabindex="-1" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">이 글을 삭제하시겠습니까?</h5>
			      </div>
			      	<div class="modal-body"> 
			      	<input type="submit" value="삭제하기">
			      	<button type="button" class="btn-primary" data-bs-toggle="modal" data-bs-target="#createTodo" aria-label="Close">취소</button> 
					</div>
			      </div>
			    </div>
			  </div>
			 	
		</form>
		</c:if>
</body>
</html>