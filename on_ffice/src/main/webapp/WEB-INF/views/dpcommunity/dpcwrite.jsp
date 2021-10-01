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
	<h2>부서 자유 게시판 작성 창</h2>
	
	<form action="/dpcommunity/dpcwrite" method="post">
		<input type="hidden" name="dp_code" value="${login_session.dp_code}" readonly="readonly"><br/>
		<input type="hidden" name="empno" value="${login_session.empno}" readonly="readonly"><br/>
		<input type="text" name="dtitle" placeholder="글 제목" required="required"><br/>
		<textarea rows="10" cols="50" name="dcontent" required="required"></textarea><br/>
		<input type="text" name="dwriter" value="${login_session.name}" readonly="readonly"><br/>
				
		 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createTodo">작성하기</button>	
		 <button type="reset" class="btn btn-warning">초기화</button>
		
		<!-- Modal -->
   			<div class="modal fade" id="createTodo" tabindex="-1" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">이 글을 작성하시겠습니까?</h5>
			      </div>
			      	<div class="modal-body"> 
			      	<input type="submit" value="작성완료">
			      	<button type="button" class="btn-primary" data-bs-toggle="modal" data-bs-target="#createTodo" aria-label="Close">취소</button> 
					</div>
			      </div>
			    </div>
			  </div>
		</form>
		<!-- Modal -->
</body>
</html>