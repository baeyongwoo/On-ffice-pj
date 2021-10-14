<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${getTodo }
	<div class="container">
				<h1>[${getTodo.todo_num }]번 작업</h1>
				<br>
				<h2>작업명 : ${getTodo.todo_title}</h2>
				<h3>작업내용: ${getTodo.todo_content }</h3>
				<h4>작업생성시간 - ${getTodo.recive_time }</h4>
			</div>

			<button>돌아가기</button>

		</div>
	</div>
</body>
</html>