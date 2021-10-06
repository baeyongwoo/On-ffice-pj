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
		<ul id="replies">
		
		</ul>
		
		<div>
		<div>
			<input type="hidden" name="replyer" value="${login_session.name}" id="newReplyWriter">
		</div>
		<div>
			<input type="text" name="reply" placeholder="명예훼손, 개인정보 유출, 분쟁, 유발, 허위사실 유포 등의 글은 이용약관에 의해 제재는 물론 법률에 의해 처벌 받을수 있습니다. 건전한 커뮤니티를 위해 자제 부탁드립니다." 
			id="newReply">
		</div>
		
		<button id="replyAddBtn">등록</button>
		</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		var notice = "${nd.notice_num}";
		function getAllList(){
		
		$.getJSON("/notice/noticeDetail/replies/all/" + notice ,function(data) {
			console.log(data);
			console.log("------");
			console.log(data.length);
			
			var str = "";
			
			$(data).each(function(){
				
				str += "<li data-rno='" + this.rno + "' class='replyList'>"
					+ this.rno + ":" + this.reply + ":" + this.replyer
					+ "<button>수정/삭제</button></li>";
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
				url : '/notice/noticeDetail/replies',
				headers: {
					"Content-Type"  :"application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					notice:notice,
					replyer: replyer,
					reply : reply
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("등록 완료");
						getAllList();
					}
				}
			})
		});
	</script>
	

	
	
</body>
</html>