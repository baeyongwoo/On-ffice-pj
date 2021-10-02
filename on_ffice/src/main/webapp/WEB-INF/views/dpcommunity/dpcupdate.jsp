<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>부서 자유 게시판 수정 페이지</h2>
	
	<form action="/dpcommunity/Update" method="post">
		<input type="text" name="dc_num" value="${dpcommunity.dc_num}" readonly="readonly"><br/>
		<input type="text" name="dp_code" value="${dpcommunity.dp_code}" readonly="readonly"><br/>
		<input type="text" name="dtitle" value="${dpcommunity.dtitle}"><br/>
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<input type="hidden" name="searchType" value="${param.searchType}">
		<input type="hidden" name="keyword" value="${param.keyword}">
		<textarea rows="10" cols="50" name="dcontent">${dpcommunity.dcontent}</textarea><br/>
		<input type="text" name="dwriter" value="${dpcommunity.dwriter}" readonly="readonly"><br/>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createTodo">수정하기</button>
		<button type="reset" class="btn btn-warning">초기화</button>
		
		<!-- Modal -->
   			<div class="modal fade" id="createTodo" tabindex="-1" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">이 글을 작성하시겠습니까?</h5>
			      </div>
			      	<div class="modal-body"> 
			      	<input type="submit" value="수정완료">
			      	<button type="button" class="btn-primary" data-bs-toggle="modal" data-bs-target="#createTodo" aria-label="Close">취소</button> 
					</div>
			      </div>
			    </div>
			  </div>
		</form>
		<!-- Modal -->
		
		
	</form>
</body>
</html>