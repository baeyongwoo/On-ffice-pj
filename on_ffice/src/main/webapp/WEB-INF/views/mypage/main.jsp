<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
				crossorigin="anonymous"></script>

			<style>
				body {
					margin: 20px;
				}

				#todoList {
					display: block;
				}
			</style>


			<script>
				window.onload = function () {

					let result = "${result}"

					if (result === "insert") {
						alert("TODO를 생성했습니다.")
					};
					if (result === "pass") {
						alert("TODO를 전달했습니다.")
					};
					if (result === "complete") {
						alert("TODO를 완료했습니다.")
					};

					let stack = 0;
					let afk = 0;


					function userStat() {
						let result = document.getElementById("result");

						$('*').on("mousemove", _.throttle(function () {
							stack++;
							console.log(stack);
							result.innerHTML = stack;
						}, 200));
					}

					setTimeout(userStat, 1000);

					setInterval(function () {
						let result = document.getElementById("result");
						if (stack > 1) {
							stack = 0;
							console.log(stack);
							result.innerHTML = stack;
						}
					}, 5000);

					setInterval(function () {
						if (stack === 0) {
							if (afk < 10) {
								afk++;
								console.log("afk" + afk);
							}
							else if (afk === 10) {
								$('#AFK').modal('show');

								$.ajax({
									url: "/mypage/awayFromKeyboard",
									type: "POST",
									data: {
										uid: "${info.uid}",
										stat: "부재중"
									},
									success: function (data) {

									},
									error: function () {
										alert("에러");
									}
								})
								console.log("부재중입니다");

								afk += 1;
							}

						} else if (stack > 0) {
							afk = 0;
						}
					}, 1000);




					function currentTime() {
						let now = new Date();
						let hours = now.getHours();
						let minutes = now.getMinutes();
						let seconds = now.getSeconds();
						let clock = document.getElementById("clock");


						if (hours > 12) {
							hours -= 12;
							apm = "오후"
						} else {
							apm = "오전"
						}

						if (hours < 10) {
							hours = "0" + hours;
						}

						if (minutes < 10) {
							minutes = "0" + minutes;
						}

						if (seconds < 10) {
							seconds = "0" + seconds;
						}

						clock.innerHTML = "현재 시간 : " + apm + hours + ":" + minutes + ":" + seconds;
					}
					setInterval(currentTime, 1000)

					let toggle = document.getElementById("todoToggle");
					toggle.onclick = function () {
						let todoList = document.getElementById("todoList");
						todoList.style.display = ((todoList.style.display != 'none') ? 'none' : 'block');
					}
				}
			</script>

			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>

		<body>
			<div class="container">
				<header> </header>
				<main>
					<div class="row">

						<div class="col-md-3">
							<a href="/company/lobby"><button class="btn btn-primary">Lobby</button></a><br />

							<div>접속자 : ${info.name }</div>
							<div>직원번호 : ${info.empno}</div>
							<div>부서 : ${info.depart_name }</div>
							<div>직급 : ${info.p_name }</div>

							<br /> 접속한 시간<br />
							${login_time }

							<div id="clock"></div>
							<div id="result"></div>

							<form action="/user/userInfo" method="post">
								<input type="hidden" name="uid" value="${login_session}">
								<input class="btn btn-primary" type="submit" value="회원정보">
							</form>
							<a href="/mypage/fileUpLoad"><button>자료업로드</button></a>
						</div>

						<div class="col-md-9">

							<h2 id="todoToggle">나의 TODO 목록</h2>
							<button type="button" class="btn btn-warning" data-bs-toggle="modal"
								data-bs-target="#createTodo">
								TODO생성</button>
							<button type="button" class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#passTodo">작업자전환</button>
							<button type="button" class="btn btn-danger" data-bs-toggle="modal"
								data-bs-target="#completeTodo">작업완료</button>
							<hr>


							<table id=todoList class="text-center table table-hover">
								<thead>
									<tr>
										<th>업무번호</th>
										<th>담당자</th>
										<th>업무제목</th>
										<th>생성시간</th>
										<th>완료여부</th>
									</tr>
								</thead>
								<c:forEach items="${todoList}" var="todo">
									<tr>
										<td>${todo.todo_num }</td>
										<td>${todo.checker }</td>
										<td><a href="/mypage/detailTodo?todo_num=${todo.todo_num }">
												${todo.todo_title} </a></td>
										<td>${todo.recive_time }</td>
										<td>${todo.complete }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4"></div>
						<div class="col-md-4"></div>
					</div>

				</main>
				<!-- Button trigger modal -->
				<!-- Modal todoInsert -->
				<form action="/mypage/insertTodo" method="post">
					<div class="modal fade" id="createTodo" tabindex="-1" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">TODO를 생성합니다</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<input type="hidden" name="checker" value="${info.empno }">
									<select class="form-select btn btn-secondar" name="worker">
										<option selected>작업자를 선택해주세요</option>
										<c:forEach items="${users}" var="users">
											<option value="${users.empno}">직원번호[${users.empno}]
												${users.dp_code}부서 ${users.name }</option>
										</c:forEach>
									</select> <span class="input-group-text">작업 제목</span> <input type="text"
										class="form-control" placeholder="작업명 입력" name="todo_title">
									<br> <span class="input-group-text">작업내용</span>
									<textarea class="form-control" placeholder="작업내용 입력" name="todo_content"></textarea>
									<br /> <input type="submit" class="btn btn-primary" value="TODO생성" />
								</div>
							</div>
						</div>
					</div>
				</form>


				<!-- Modal todoPass -->
				<form action="/mypage/passTodo" method="post">
					<div class="modal fade" id="passTodo" tabindex="-1" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">작업을 넘겨줍니다</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<select class="form-select btn btn-secondar" name="worker">
										<option selected>넘겨줄 작업자를 선택해주세요</option>
										<c:forEach items="${users}" var="users">
											<option value="${users.empno}">직원번호[${users.empno}]
												${users.dp_code}부서 ${users.name }</option>
										</c:forEach>
									</select> <span class="input-group-text">넘겨줄 작업 제목</span> <select
										class="form-select btn btn-secondar" name="todo_num">
										<option selected>넘겨줄 작업을 선택해주세요</option>
										<c:forEach items="${todoList}" var="todo">
											<option value="${todo.todo_num}">작업번호[${todo.todo_num}]
												작업제목 : ${todo.todo_title} 담당자 : ${todo.checker }</option>
										</c:forEach>
									</select> <br /> <span class="input-group-text">작업내용</span>
									<textarea class="form-control" placeholder="작업내용 입력" name="todo_content"></textarea>
									<br /> <input type="submit" class="btn btn-primary" value="작업넘기기" />
								</div>
							</div>
						</div>
					</div>
				</form>


				<!-- Modal todoComplete -->
				<form action="/mypage/completeTodo" method="post">
					<div class="modal fade" id="completeTodo" tabindex="-1" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">작업의 상태를
										변경합니다.</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<select class="form-select btn btn-secondar" name="todo_num">
										<option selected>완료할 작업을 선택해주세요</option>
										<c:forEach items="${todoList}" var="todo">
											<option value="${todo.todo_num}">작업번호[${todo.todo_num}]
												작업제목 : ${todo.todo_title} 담당자 : ${todo.checker }</option>
										</c:forEach>
									</select> <select class="form-select btn btn-secondar" name="complete">
										<option selected>작업상태 선택</option>
										<option value="ing">ing</option>
										<option value="complete">complete</option>
									</select> <input type="submit" class="btn btn-primary" value="완료하기!" />
								</div>
							</div>
						</div>
					</div>
				</form>

				<!-- Modal AFK -->
				<div class="modal fade" id="AFK" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="modal-title" id="exampleModalLabel">
									부재중입니다.
								</h3>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<h5>부재중 상태를 해제하려면 아래 버튼을 클릭하세요</h5>
								<form action="/mypage/awayFromKeyboard" method="post">
									<input type="hidden" name="stat" value="접속중">
									<input type="hidden" name="uid" value="${info.uid}">
									<input type="submit" value="부재중 해제" class="btn btn-success">
								</form>
							</div>
						</div>
					</div>
				</div>
				<footer> </footer>
			</div>
		</body>

		</html>