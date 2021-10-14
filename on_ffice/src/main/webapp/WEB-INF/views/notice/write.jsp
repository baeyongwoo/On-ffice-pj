<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body { margin:20px;}
	</style>
</head>
<body>
	
	<header>
	<a href="/notice/noticeList" class="btn btn-dark">돌아가기</a>
	<div class="text-center">
	<h2>글작성</h2>
	</div>
	
</header>

<div class="container">
	<div class="row">
		<div class="col-xs-12 w-70 p-3">

	<form action="/notice/write" method="post">
		<select name="ncategory" id="check" required="required">
			<option value= >--선택--</option>
			<option value="공지">공지</option>
			<option value="행사">행사</option>
			<option value="자료">자료</option>
			<option value="기타">기타</option>
		</select>
		<br/><br/>
		<input type="text" name="ntitle" placeholder="제목" required="required" class="form-control"><br>

		<textarea rows="10" cols="50" name="ncontent" required="required" class="form-control"></textarea>
		<input type="hidden" name="nwriter" value="${login_session.uid}" placeholder="로그인해주세요" readonly="readonly"></br>
		<input type="text" value="${login_session.name}" placeholder="로그인해주세요" readonly="readonly" class="form-control w-25 p-3"></br>
		<div class="text-center">
		<input type="submit" value="작성완료" class="btn btn-dark">
		<input type="reset" value="다시작성" class="btn btn-warning">
	</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</div>
</div>
</div>
</body>
<footer>
	
	<hr/>

	<div class="row">
		<h6 class="text-center">홈페이지 : <strong>www.onffice.com</strong></h6>
		<h6 class="text-center">주소 : <strong>서울특별시 마포구 양화로 127, 첨단빌딩</strong></h6>
		<h6 class="text-center">만든이 : <strong>배용우 신우람 고광훈 서성현 신동규</strong> </h6>
	</div>


	
</footer>
</html>