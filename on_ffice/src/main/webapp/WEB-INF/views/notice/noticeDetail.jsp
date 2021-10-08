<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<style>
		#modDiv {
			width: 300px;
			height: 100px;
			background-color: green;
			position: absolute;
			top: 50%;
			left: 50%;
			margin-top: -50px;
			margin-left: -150px;
			padding: 10px;
			z-index: 1000;
		}
	</style>
</head>
<body>
	<c:set var="nd" value="${noticeDetail}"></c:set>
	<h2><c:out value="${nd.notice_num}"/>번쨰 게시글 입니다</h2>
	<h2>제목 :  <c:out value="${nd.ntitle}" /></h2>
	<h2>내용 : <c:out value="${nd.ncontent}" /></h2>
	<h2>작성자 : ${login_session.name}</h2>
	<h2>작성일 : ${nd.ndate}</h2>
	<h2>최근 업데이트 : ${nd.nupdate}</h2>
	<h2>조회수 : ${nd.nhits}</h2>
	
	<a href="/notice/noticeList">목록으로</a>

	
	<c:if test="${nd.nwriter eq login_session.uid}">
	
		<form action="/notice/noticeDelete" method="post">
			<input type="hidden" name="notice_num" value="${nd.notice_num}">
			<input type="submit" value="삭제하기">
		</form>
		
		<form action="/notice/noticeUpdate" method="post">
			<input type="hidden" name="notice_num" value="${nd.notice_num}">
			<input type="submit" value="수정하기">
		</form>
	</c:if>
		<hr>
		
		<h2>댓글 등록</h2>
		
			<div>
				<input type="hidden" name="replyer" value="${login_session.name}" id="newReplyWriter">
			</div>
			<div>
				<input type="text" name="reply" placeholder="명예훼손, 개인정보 유출, 분쟁, 유발, 허위사실 유포 등의 글은 이용약관에 의해 제재는 물론 법률에 의해 처벌 받을수 있습니다. 건전한 커뮤니티를 위해 자제 부탁드립니다." 
				id="newReply">
			<button id="replyAddBtn">댓글 등록</button>
			</div>
			<div id="modDiv" style="display:none;">
				<div class="modal-title"></div>			
					<div>
						<input type="text" id="replytext">
					</div>
				<div>
					<button type="button" id="replyModBtn">댓글 수정</button>
					<button type="button" id="replyDelBtn">댓글 삭제</button>
					<button type="button" id="closeBtn">창 닫기</button>
				</div>
			</div>
		
		<hr>
		
		<h2>댓글 창</h2>
			
		<hr>
		<ul id="replies">
		
		</ul>
	
	<script>
		var notice = "${nd.notice_num}";
		function getAllList(){
		
		$.getJSON("/notice/noticeDetail/replies/all/" + notice ,function(data) {
			console.log(data);
			console.log("------");
			console.log(data.length);
			
			var str = "";
			
			$(data).each(function(){
				
				str +="<li data-rno='" + this.rno + "' class='replyLi'>"
				+ "<div class='reply'>" + this.rno + ":" + this.reply + ":" + this.replyer + "</div>"
				+ "<button type='button' class='btn btn-info'>수정/삭제</button></li>";
			});
			
			$("#replies").html(str);
			
			});
		}
		getAllList();
		
		$("#replyAddBtn").on("click", function(){
			var replyer = $("#newReplyWriter").val();
			var reply = $("#newReply").val();
			
			console.log(replyer + "/" + reply);
			
			$.ajax({
				type : 'post',
				url : '/notice/noticeDetail/replies/',
				headers: {
					"Content-Type"  :"application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					notice : notice,
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
		
		$("#replyModBtn").on("click", function() {
			
			var rno = $(".modal-title").html();
			var reply = $("#replytext").val();
				$.ajax({
				type : 'patch',
				url : '/notice/noticeDetail/replies/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PATCH"
				},
				dataType : 'text',
				data : JSON.stringify({reply:reply}),
				success : function(result) {
					if(result === 'SUCCESS') {
						alert(rno + "번 댓글 수정 완료");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			})
		});
		
		$("#replyDelBtn").on("click", function() {
			
			var rno = $(".modal-title").html();
			
			$.ajax({
				type : 'delete',
				url : '/notice/noticeDetail/replies/' + rno,
				success : function(result) {
					if(result === 'SUCCESS') {
						alert(rno + "번 댓글 삭제 완료");
						$("#modDiv").hide("slow");
						getAllList();
					}
				} 
			})
		});
		
		$("#replies").on("click", ".replyLi button", function() {
			var replyLi = $(this).parent();
			var rno = replyLi.attr("data-rno");
			var reply = $(this).parent().siblings(".reply").text();
						
			console.log(rno + ":" + reply);
			$(".modal-title").html(rno);
			$("#replytext").val(reply);
			$("#modDiv").show("slow");
		});
		
		$("#closeBtn").on("click", function() {
			$("#modDiv").hide("slow");
		})
	</script>
	

	
	
</body>
</html>