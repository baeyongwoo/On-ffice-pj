<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 부서 사람들 불러오는것 -->
	<!-- 부서 커뮤니티 연결 -->
	<h2>부서 코드 : ${dpinfo.dp_code}</h2>
	<h2>부서 이름 : ${dpinfo.depart_name}</h2>
	<h2>부서 직원 수  : ${dpinfo.count}</h2>
	<hr>
		사번 아이디 이름 성별 생일 이메일 전화번호 직위 </br>
	<c:forEach items="${dpu_list}" var="dl">
		<c:if test="${dl.dp_code eq login_session.dp_code}">
		${dl.empno}
		${dl.uid}
		${dl.name}
		${dl.gender}
		${dl.birth}
		${dl.email}
		${dl.cp}
		${dl.p_name}
		</br>
		</c:if>
	</c:forEach>
	
	<hr>
	<h2>우리의 게시판</h2>
	글번호/제목/작성자/작성일/조회수<br>
	<c:forEach items="${dpc_list}" var="dpcl">
	<c:if test="${dpcl.dp_code eq login_session.dp_code}">
			<tr>	
				<td>${dpcl.dc_num}</td>
				<td><a href="/dpcommunity/dpcdetail?dc_num=${dpcl.dc_num}">${dpcl.dtitle}</a></td>
				<td>${dpcl.dwriter}</td>
				<td>${dpcl.ddate}</td>
				<td>${dpcl.dhits}</td>
			</tr>
		<br/>		
		</c:if>
	</c:forEach>
	
	<a href="/company/lobby"><button>메인로비로가기</button></a>
	<a href="/dpcommunity/dpclist"><button>부서게시판으로가기</button></a>
	<a href="/mypage/main"><button>마이페이지로</button> </a>

	
	
	
</body>
</html>