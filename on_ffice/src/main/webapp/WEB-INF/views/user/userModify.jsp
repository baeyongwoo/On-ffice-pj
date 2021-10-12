<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
											<!-- onsubmit="false"면 submit을 차단 -->
	<form name="regForm" method="post" action="/user/userModify" onsubmit="return regCheck(this)"> 
		<span style="color:red; font-weight: bold">* 필수입력</span> <br> 
		<table border="1"> 
			<tr> 
				<th>*아이디</th> 
				<td> 
					<input type="text" name="uid" id="id" size="15" value ="${userInfo.uid }" readonly required> 
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
					<input type="text" name="name" id="name" size="15" value="${userInfo.name }" readonly>
				</td>
			</tr> 
				<tr> 
					<th>*이메일</th> 
					<td> 
						<input type="text" name="email" id="email" size="30" readonly value="${userInfo.email }"> 
					</td> 
				</tr> 
					<tr> 
					<th>전화번호</th> 
					<td>
						<input type="tel" name="cp" size="15" value="${userInfo.cp }" readonly required>
					</td> 
				</tr>
				
				<tr> 
					<th>프로필 사진</th> 
					<td>
						<input type="text" name="profile_img" size="15" value="${userInfo.profile_img }">
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
					       value="${userInfo.birth }"
					       min="1900-01-01" max="2020-12-31" required> 
					</td> 
				</tr>
				<tr> 
					<th>부서번호</th> 
					<td>
						<input type="text" name="dp_code" id="dp_code" size="15" value="${userInfo.dp_code }" readonly required>
					</td> 
				</tr>
				<tr> 
					<th>직위번호</th> 
					<td>
						<input type="text" name="position_code" id="position_code" size="15" value="${userInfo.position_code }" readonly required>
					</td> 
				</tr>
			<tr> 
				<td colspan="2"> 
					<input type="submit" value="정보 수정"/> 
					<input type="reset" value="초기화" /> 
					<a href="javascript:history.back()"><input type="button" value="돌아가기"></a>
				</td> 
			</tr>

		</table>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	</form>
<script type="text/javascript">
	
	// email 중복체크 
	
	function emailCheck(){ 
		
	//새창 만들기 
	window.open("/user/emailCheckForm", "emailwin", "width=400, height=350"); 
	
	}
	//emailCheck() end

	
	// 유효성 검사!
	function regCheck(param) {
		
		// 패스워드 길이 5~10 이내 인지 확인
		let pw = param.upw.value;
		pw = pw.trim();
		
		if(pw.length<5 || pw.length>10) {
			alert("비밀번호가 5~10자리 이내로 입력해주세요.")
			param.upw.focus();//커서 가져다 주기
			return false;
		} // if end
		
		// 패스워드와 패스워드 확인이 서로 일치하는지
		let upw = param.upw.value;
		upw=upw.trim();
		
		let rePw= param.rePw.value;
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