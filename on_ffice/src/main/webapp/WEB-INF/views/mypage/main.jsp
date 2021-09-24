<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<style>
body{margin:20px;}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script>

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<header>

</header>
<main>
    <div class="row">
        <div class="text-center col-md-1">
        접속한 시간<br/>
        ${login_time }
        </div>
        <div class="col-md-2">
        접속자 : ${info.name }<br/>
        부서 : ${info.dp_code }<br/>
        직급 : ${info.position_code }<br/>
        </div>    
        <div class="col-md-8">
        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#createTodo">
 		TODO생성
		</button>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#passTodo">
  		작업자전환
		</button>
		<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#completeTodo">
  		작업완료
		</button>
		
        	<table class="text-center table table-hover">
				<thead>
				<tr>
				<th>업무번호</th>
				<th>담당자</th>
				<th>업무내용</th>
				<th>생성시간</th>
				<th>완료여부</th>
				</tr>				
				</thead>
			<c:forEach items="${todoList}" var="todo">
				<tr>
				<td>${todo.todo_num }</td>
				<td>${todo.checker }</td>
				<td>${todo.todo_content }</td>
				<td>${todo.recive_time }</td>
				<td>${todo.complete }</td>
				</tr>
			</c:forEach>
			</table>
        </div>
         <div class="text-center col-md-1">
        식단표<br/>
        ${meal.dailymeal}<br/>
        ${meal.menu1 }<br/>
        ${meal.menu2 }<br/>
        ${meal.menu3 }<br/>
        ${meal.menu4 }<br/>
        ${meal.menu5 }
        </div>
    </div>
    <div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>
    <div class="col-md-4"></div>
    </div>
    
</main>
<!-- Button trigger modal -->


<!-- Modal -->
        <form action="/mypage/insertTodo" method="post">
<div class="modal fade" id="createTodo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">TODO를 생성합니다</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      	<div class="modal-body">
   			<select class="form-select btn btn-secondar">
  			<option selected>작업자를 선택해주세요</option>
  				<c:forEach items="${users}" var="users">
  				<option value="${users.uid}">${users.dp_code}부서 ${users.name }</option>
  				</c:forEach>
			</select>
        <span class="input-group-text">작업 제목</span>
  		<input type="text" class="form-control" placeholder="작업명 입력" name="todotitle">
  		<br>
	  	<span class="input-group-text">작업내용</span>
  		<textarea class="form-control" placeholder="작업내용 입력" name="todocon"></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="TODO생성"/>
      </div>
    </div>
  </div>
        </form>
</div>

<!-- Modal -->


<footer>

</footer>    
</body>
</html>