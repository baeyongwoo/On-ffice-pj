<!-- 
*	작성자 : 고광훈
*	진행상황 : src/main/java 패키지 생성, office페이지 컨트롤러, Mapper, Service, VO 생성 
*	변수정리 : 
*	테스트 성공 유무 :  
*	오류사항 : 
*	etc...
*	
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<header>
    
    <div class="row">
        
        <div class="col-md-1">
        접속한 시간 : ${login_time }
        </div>
        <div class="col-md-3">
        접속자 : ${info.name }
        부서 : ${info.dp_code }
        직급 : ${info.position_code }
        </div>
        <div class="col-md-4">
        ${meal.dailymeal}<br/>
        식단표<br/>
        ${meal.MENU1 }<br/>
        ${meal.MENU2 }<br/>
        ${meal.MENU3 }<br/>
        ${meal.MENU4 }<br/>
        ${meal.MENU5 }
        </div>
        <div class="col-md-4">
        
        </div>
    </div>
</header>
<main>

</main>

<footer>

</footer>    
</div>
</body>
</html>