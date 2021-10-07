<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
    

    .header {
        height: 150px;
        display: grid;
        grid-template-columns: 150px 1fr 1fr 1fr 1fr;
        grid-template-rows: 150px;
        padding: 0px;
        text-align: center;
    }
    .container {
        display: table;
        width: 100%;
        height: 100%;
        margin: -100px auto;
        padding: 100px 0;
        
    }
    .side {
        display: table-cell;
        width: 399px;
        height: 100%;
        border: 1px solid black;
        background-color: skyblue;
        
    }
    .content {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        
         
    }
    .footer {
        background-color: gray;
        height: 100px;  
    }
    .company {
        
        background-image: url('https://png.pngtree.com/element_our/20190601/ourmid/pngtree-blue-building-house-free-illustration-image_1373123.jpg');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .introduce {
        border: 1px solid black;
        text-align: center;
        background-image: url('https://www.urbanbrush.net/web/wp-content/uploads/edd/2020/04/urbanbrush-20200429142434662995.jpg');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .freeboard {
        border: 1px solid black;
        text-align: center;
        background-image: url('https://littledeep.com/wp-content/uploads/2021/05/notice-board-illustration-main-1024x607.png');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .noticeboard {
        border: 1px solid black;
        text-align: center;
        background-image: url('https://littledeep.com/wp-content/uploads/2021/05/notice-board-illustration-main-1024x607.png');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .rogin {
        background-image: url('https://previews.123rf.com/images/yupiramos/yupiramos1709/yupiramos170927668/86857106-%EA%B0%9C%EC%9D%B8-%EA%B8%B0%ED%98%B8-%EB%B3%B4%ED%98%B8%EC%99%80-%EA%B0%9C%EC%9D%B8-%EC%A0%95%EB%B3%B4-%EC%95%84%EC%9D%B4%EC%BD%98-%EB%B0%A9%ED%8C%A8-%EC%9D%B8%EC%A6%9D-%EB%B3%B4%EC%95%88-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%A0%88%EC%9D%B4%EC%85%98.jpg');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .mypage {
        border: 1px solid black;
        text-align: center;
        background-image: url('https://www.urbanbrush.net/web/wp-content/uploads/edd/2019/07/urbanbrush-20190719004812478595.png');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .dppage {
        border: 1px solid black;
        text-align: center;
        background-image: url('https://previews.123rf.com/images/artisticco/artisticco1502/artisticco150200034/36384881-%EC%82%AC%EB%AC%B4%EC%8B%A4%EC%97%90%EC%84%9C-%EA%B7%BC%EB%AC%B4%ED%95%98%EB%8A%94-%EC%A0%8A%EC%9D%80-%EC%82%AC%EB%9E%8C%EB%93%A4%EC%9D%98-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%A0%88%EC%9D%B4-%EC%85%98.jpg');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .food {
        border: 1px solid black;
        text-align: center;
        background-image: url('https://blog.kakaocdn.net/dn/kHnPi/btqFdm3xHXm/25bjduUOc9zVJffKZ7MsF1/img.png');
        background-size: cover;
        background-repeat: no-repeat;
    }
    .birth {
        border: 1px solid black;
        text-align: center;
        
        background-size: cover;
        background-repeat: no-repeat;
        
    }
</style>
<script>
</script>
<title></title>
</head>
<body>

    <div class="wrap"> <!-- wrap 열기 -->

        <div class="header">
            <div class="company">
                <h2 class="text-center">Onffice</h2> 
            </div>
            <div class="introduce">
                <h2><a href="/company/intro">회사소개</a></h2></div>
            <div class="freeboard">
                <h2><a href="/community/CMList">자유게시판</a></h2></div>
            <div class="noticeboard">
                <h2><a href="/notice/noticeList">알림게시판</a></h2></div>
            <div class="rogin">
	<c:set var="user" value="${login_session}" />
	<c:if test="${login_session eq null}">
                <h2><a href="/user/login">로그인</a></h2>
	</c:if>
	<c:if test="${login_session ne null}">
	    <h2><a href="/user/logout">로그아웃</a></h2></div>
	    </c:if> 
        </div>
        <div class="container"> 
            <div class="side">사이드 바</div>
            <div class="content"> 
                <div class="mypage"><a href="/mypage/main"><h2>마이페이지</h2></a></div>
                <div class="dppage"><a href="/company/dplobby?dp_code=${user.dp_code}"><h2>부서페이지</h2></a></div>
                <div class="birth"> <h2>이달의 생일</h2>
                    <a href="/bday/bdaylist"><img src="https://cdn.crowdpic.net/list-thumb/thumb_l_36E02FCA9051376724F589C917B34346.png"padding=100px margin=100px width="500ox" height="500px"></a></div>
                <div class="food"><h2>이번주 식단</h2>
                 
<!-- carousel를 구성할 영역 설정 -->
<div style="width:100px; margin: 100px;">
    <!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
    <!-- carousel는 특이하게 id를 설정해야 한다.-->
    <div id="carousel-example-generic" class="carousel slide" >
    <!-- carousel의 지시자 -->
    <!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
    
    <ol class="carousel-indicators">
    <!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
    <!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
    <!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
    <!--
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
    -->
    </ol>    

    <div class="carousel-inner" role="listbox">
    <div class="item active">
    
    <div class="item">
        <ul><h3>월요일</h3></ul>
    <c:forEach items="${rice}" var="rice">    
            <li>${rice.today}</li>
            <li>${rice.main}</li>
            <li>${rice.side1}</li>
            <li>${rice.side2}</li>
            <li>${rice.side3}</li>
            <li>${rice.side4}</li>	
		</div>
        </c:forEach>
</div>

<div class="item">
  
    <ul><h3>화요일</h3></ul>
	<c:forEach items="${rice}" var="rice">
        <li>${rice.today}</li>
		<li>${rice.main}</li>
		<li>${rice.side1}</li>
		<li>${rice.side2}</li>
		<li>${rice.side3}</li>
		<li>${rice.side4}</li>
	</c:forEach>
</div>
<div class="item">
  
    <ul><h3>수요일</h3></ul>
	<c:forEach items="${rice}" var="rice">
		<li>${rice.today}</li>
		<li>${rice.main}</li>
		<li>${rice.side1}</li>
		<li>${rice.side2}</li>
		<li>${rice.side3}</li>
		<li>${rice.side4}</li>
	</c:forEach>
</div>
<div class="item">
  
  <ul><h3>목요일</h3></ul>
  <c:forEach items="${rice}" var="rice">
    <li>${rice.today}</li>
    <li>${rice.main}</li>
    <li>${rice.side1}</li>
    <li>${rice.side2}</li>
    <li>${rice.side3}</li>
    <li>${rice.side4}</li>
</c:forEach>
</div>
<div class="item">
 
  <ul><h3>금요일</h3></ul>
  <c:forEach items="${rice}" var="rice">
    <li>${rice.today}</li>
    <li>${rice.main}</li>
    <li>${rice.side1}</li>
    <li>${rice.side2}</li>
    <li>${rice.side3}</li>
    <li>${rice.side4}</li>
</c:forEach>  
</div>
</div> 
            </div>
            </div>
            </div>
            
           

       

    </div> <!-- wrap 닫기-->
     <script>
        $(function(){
        // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
        $('#carousel-example-generic').carousel({
        // 슬리아딩 자동 순환 지연 시간
        // false면 자동 순환하지 않는다.
        interval: 3000,
        // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
        pause: "hover",
        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
        wrap: true,
        // 키보드 이벤트 설정 여부(?)
        keyboard : true
        });
        });
        </script> 
</body>

<div class="footer">
    <div class="row">
        <h6 class="text-center">홈페이지 : <strong>www.onffice.com</strong></h6>
        <h6 class="text-center">주소 : <strong>서울특별시 마포구 양화로 127, 첨단빌딩</strong></h6>
        <h6 class="text-center">만든이 : <strong>배용우 신우람 고광훈 서성현 신동규</strong> </h6>
    </div>

</div>
</html>