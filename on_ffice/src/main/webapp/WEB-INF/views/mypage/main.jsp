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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
			<c:forEach items="${todoList}" var="todo" varStatus="td">
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

<footer>

</footer>    
</div>
</body>
</html>