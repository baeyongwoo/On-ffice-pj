<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
											<!-- onsubmit="false"면 submit을 차단 -->
	<form name="regForm" method="post" action="/user/register" onsubmit="return regCheck(this)"> 
		<span style="color:red; font-weight: bold">* 필수입력</span> <br> 
		<table border="1"> 
			<tr> 
				<th>*아이디</th> 
				<td> 
					<input type="text" name="uid" id="id" size="15" readonly required> 
					<input type="button" value="ID중복확인" onclick="idCheck()"> 
				</td> 
			</tr> 
			
			<tr> 
				<th>*비밀번호</th> 
				<td>
					<input type="password" name="upw" id="upw" size="15" required>
				</td> 
			</tr> 
			
			<tr> 
				<th>*비밀번호 확인</th> 
				<td>
					<input type="password" name="rePw" id="rePw" size="15" required>
				</td> 
			</tr>
			<tr> 
				<th>*이름</th> 
				<td>
					<input type="text" name="name" id="name" size="15" required>
				</td>
			</tr> 
				<tr> 
					<th>*이메일</th> 
					<td> 
						<input type="text" name="email" id="email" size="30" readonly> 
						<input type="button" value="Email 중복확인" onclick="emailCheck()"> 
					</td> 
				</tr> 
					<tr> 
					<th>전화번호</th> 
					<td>
						<input type="tel" name="cp" size="15">
					</td> 
				</tr>
				
				<tr> 
					<th>프로필 사진</th> 
					<td>
						<input type="radio" name="profile_img" size="15" value="/resources/img/p1.PNG"> <img width="50px" height="50px" src="/resources/img/p1.PNG">
						<input type="radio" name="profile_img" size="15" value="/resources/img/p2.PNG"> <img width="50px" height="50px" src="/resources/img/p2.PNG">
						<input type="radio" name="profile_img" size="15" value="/resources/img/p3.PNG"> <img width="50px" height="50px" src="/resources/img/p3.PNG">
						<input type="radio" name="profile_img" size="15" value="/resources/img/p4.PNG"> <img width="50px" height="50px" src="/resources/img/p4.PNG">
						<input type="radio" name="profile_img" size="15" value="/resources/img/p5.PNG"> <img width="50px" height="50px" src="/resources/img/p5.PNG">
					</td> 
				</tr>
				
				<tr> 
					<th>성별</th> 
					<td>
						남<input type="radio" name="gender" value="남" size="15">
						여<input type="radio" name="gender" value="여" size="15">
					</td> 
				</tr>
				
				<tr> 
					<th>생일</th> 
					<td>
						<label for="start">Start date:</label>
					
						<input type="date" id="start" name="birth"
					       value="2021-09-15"
					       min="1900-01-01" max="2020-12-31">
					</td> 
				</tr>
				<tr> 
					<th>부서</th> 
					<td>
					<select name="dp_code">
					<c:forEach var="depart" items="${dpList }">
					    <option value="${depart.dp_code }">${depart.depart_name }</option>
					</c:forEach>
					</select>
					</td> 
				</tr>
				<tr> 
					<th>직위</th> 
					<td>
					<select name="position_code">
					<c:forEach var="position" items="${positionList }">
					    <option value="${position.p_code}">${position.p_name }</option>
					</c:forEach>
					</select>
					</td> 
				</tr>
			<tr> 
				<td colspan="2"> 
					<input type="submit" value="회원가입"/> 
					<input type="reset" value="취소" /> 
				</td> 
			</tr>

		</table>
	</form>
<script type="text/javascript">
	// id 중복체크
	function idCheck(){ 
	
	//새창 만들기
	window.open("/user/idCheckForm", "idwin", "width=400, height=350"); 
	
	}
	// email 중복체크 
	
	function emailCheck(){ 
		
	//새창 만들기 
	window.open("/user/emailCheckForm", "emailwin", "width=400, height=350"); 
	
	}
	//emailCheck() end

	
	// 유효성 검사!
	function regCheck(param) {
		
		// 패스워드 길이 5~10 이내 인지 확인
		var pw = param.upw.value;
		pw = pw.trim();
		
		if(pw.length<5 || pw.length>10) {
			alert("비밀번호가 5~10자리 이내로 입력해주세요.")
			param.upw.focus();//커서 가져다 주기
			return false;
		} // if end
		
		// 패스워드와 패스워드 확인이 서로 일치하는지
		var upw = param.upw.value;
		upw=upw.trim();
		
		var rePw= param.rePw.value;
		rePw=rePw.trim();
		
		if(upw!=rePw) {
			alert("비밀번호가 일치 하지 않습니다.")
			param.upw.focus();
			return false;
		} // if end 
		
		
	}
</script>
</body>
</html>