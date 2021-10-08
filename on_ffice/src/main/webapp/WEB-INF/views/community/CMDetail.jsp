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

	
	<c:set var="cd" value="${csDetail}"></c:set>
	<h2><c:out value="${cd.community_num}"/>번쨰 게시글 입니다</h2>
	<h2>제목 :  <c:out value="${cd.ctitle}"/></h2>
	<h2>내용 : <c:out value="${cd.ccontent}"/></h2>
	<h2>작성자 :<c:out value="${cd.cwriter}"/></h2>
	<h2>작성일 : ${cd.cdate}</h2>
	<h2>최근 업데이트 : ${cd.cupdate}</h2>
	<h2>조회수 : ${cd.chits}</h2>
	
	<a href="/community/CMList">목록으로</a>
	
		<form action="/community/deleteCheck" method="post">
			<input type="hidden" name="community_num" value="${cd.community_num}">
			<input type="submit" value="삭제하기">
		</form>
		
		<form action="/community/CMUpdate" method="post">
			<input type="hidden" name="community_num" value="${cd.community_num}">
			<input type="submit" value="수정하기">
		</form>
		
	<hr>
		
		<script>
		var result = "${update}";
		console.log(result);
		
		if(result==="success"){
			alert("수정완료했습니다.")
		}else if(result==="fail")(
			alert("비밀번호가 달라 수정 실패했습니다.")
		)
		</script>
		
		<h2>댓글 창</h2>
		
		<hr>
		<ul id="cmreplies">
		
		</ul>
		
		<div>
		<div>
			<input type="hidden" name="replyer" value="${login_session.name}" id="newReplyWriter">
		</div>
		<div>
			<input type="text" name="reply" placeholder="명예훼손, 개인정보 유출, 분쟁, 유발, 허위사실 유포 등의 글은 이용약관에 의해 제재는 물론 법률에 의해 처벌 받을수 있습니다. 건전한 커뮤니티를 위해 자제 부탁드립니다." 
			id="newReply">
		</div>
		
		<button id="replyAddBtn">댓글 등록</button>
		</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		var community = "${cd.community_num}";
		function getAllList(){
		
		$.getJSON("/community/CMDetail/cmreplies/all/" + community ,function(data) {
			console.log(data);
			console.log("------");
			console.log(data.length);
			
			var str = "";
			
			$(data).each(function(){
												
				str += "<li data-cno='" + this.cno + "' class='replyList'>"
					+ this.cno + ":" + this.reply + ":" + this.replyer
					+ "<button>수정/삭제</button></li>";
			});
			
			$("#cmreplies").html(str);
			
			});
		}
		getAllList();
		
		$("#replyAddBtn").on("click", function(){
			var replyer = $("#newReplyWriter").val();
			var reply = $("#newReply").val();
			
			console.log(replyer + "/" + reply);
			
			$.ajax({
				type : 'post',
				url : '/community/CMDetail/cmreplies',
				headers: {
					"Content-Type"  :"application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					community : community ,
					replyer : replyer,
					reply : reply
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("댓글 등록 완료");
						$("#newReply").val("");
						getAllList();
					}
				}
			})
		});
			
</script>

	
	
</body>
</html>