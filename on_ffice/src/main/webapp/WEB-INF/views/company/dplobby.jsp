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
	<h2>부서이름, 부서인원수</h2>
		사번 아이디 이름 성별 생일 이메일 전화번호 직위 </br>
	<c:forEach items="${dpu_list}" var="dl">
		${dl.empno}
		${dl.uid}
		${dl.name}
		${dl.gender}
		${dl.birth}
		${dl.email}
		${dl.cp}
		${dl.position_code}
		</br>
	</c:forEach>
	
	<hr>
	<c:forEach items="${dpc_list}" var="dpcl">
		${dpcl.dc_num}
		${dpcl.dtitle}
		${dpcl.dwriter}
		${dpcl.ddate}
		${dpcl.dhits}
		</br>
	</c:forEach>
	
	<a href="/company/lobby"><button>메인로비로가기</button></a>
	
	
	
</body>
</html>