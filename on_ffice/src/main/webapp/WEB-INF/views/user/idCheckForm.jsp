<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center"> 
		<h3>* 아이디 중복확인 *</h3> 
		<form method="post" action="/user/idCheckProc" onsubmit="return blankCheck(this)"> 
			아이디 : <input type="text" name="uid" maxlength="10" autofocus> 
			<input type="submit" value="중복확인"> 
		</form> 
	</div> 
<script> 
	// blankCheck 함수 시작
	// 파라미터로 자기 자신을 받고,
	function blankCheck(param){ 
	// 변수 uid 에 자기 자신의 uid 값을 넣는 구문
	// trim()은 공백을 모두 없애는 메서드
	// trim을 이용하여 공백을 없앤 uid 값을 변수 uid에 저장
		var uid=param.uid.value; 
			uid=uid.trim(); 
		
		// uid의 길이가 5 미만일 경우 아이디는 5자 이상 입력해주세요 경고창 출력
		if(uid.length<5){ alert("아이디는 5자 이상 입력해주십시오."); 
		// false를 리턴해줘야만 onsubmit의 원리로 submit자체를 차단할 수 있음
		// onsubmit 뒤에 "return false"가 있으면 이 폼의 submit을 차단할 수 있음
		return false; }//if end return true; 
		
	}//blankCheck() end 
		
</script>

</body>
</html>