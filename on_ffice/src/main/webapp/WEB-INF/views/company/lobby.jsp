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
	<h1>ict03회사</h1>
	<a href="/company/intro"><button>회사소개</button></a>
	<a href="#"><button>회사행사</button></a>
	<a href="#"><button>회사소통</button></a>
	회사 관련 이미지<img src="">
	<c:set var="user" value="${login_session}" />
	
	<a href="/mypage/main"><button>마이페이지로</button></a>
	<a href="/company/dplobby?dp_code=${user.dp_code}"><button>부서로비가기</button></a>		
	
	<c:if test="${user.dp_code == 1 and user.position_code >= 2}">
		<a href="/user/register"><button>회원가입</button></a>
	</c:if>
	<!-- 오늘의 메뉴 -->
	<!-- db에서 불러오기 -->
	<!-- 이달의 생일 -->
	<!-- 익일 생일일 경우 케이크 이미지 나오게 출력 -->
	<hr>
	<a href="/notice/noticeList"><button>알림게시판가기</button></a><br>
	글번호/제목/작성자/작성일/조회수 <br/>
	<c:forEach items="${nslist}" var="nl">
			<tr>	
				<td>${nl.notice_num}</td>
				<td>${nl.ntitle}</td>
				<td>${nl.nwriter}</td>
				<td>${nl.ndate}</td>
				<td>${nl.nhits}</td>
			</tr>
		<br/>		
	</c:forEach>
	
	
	<hr>
	<p>홈페이지 주소 : http://www.ict03company.com</p>
	<p>회사 주소 : 서울특별시 마포구 양화로 127 첨단빌딩 7층 한국ICT인재개발원</p>
	<p>02-777-7777</p>
</body>
</html>