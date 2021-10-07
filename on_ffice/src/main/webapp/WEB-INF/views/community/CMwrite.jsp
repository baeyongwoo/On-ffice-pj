<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>자유 게시판 작성 창</h2>
	<form action="/community/write" name="guest" method="post">
		<input type="text" name="ctitle" placeholder="제목" required="required"></br>
		<textarea rows="10" cols="50" name="ccontent" required="required"></textarea></br>
		<input type="text" name="cwriter" value="${login_session.name}" placeholder="작성자입력" readonly></br>
		<input type="password" name="cpw" placeholder="pw입력"/> 
		<input type="submit" value="작성완료">
		<input type="reset" value="다시작성">
	</form>
	
	<script type="application/javascript">
	
  function getIP(json) {
	  
    var ip = json.ip
    
	if(document.guest.cwriter.value == "") {
		document.guest.cwriter.value=ip;
	}
    
  }
</script>

<script type="application/javascript" src="https://api.ipify.org?format=jsonp&callback=getIP"></script>
</body>
</html>