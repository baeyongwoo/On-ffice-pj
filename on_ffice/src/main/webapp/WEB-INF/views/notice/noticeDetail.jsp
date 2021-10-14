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
		.a { background-color: gray;
		text-overflow: ellipsis;
		overflow: hidden;
		width: 800px;
	 	margin-left: 30%;
		}
		.btn1 { margin-right:5px;}
		.btn3 { margin-left: 5px;}
		ul{
   list-style:none;
   }
	</style>
</head>
<body>
	<div class="text-center">
	<c:set var="nd" value="${noticeDetail}"></c:set>
	<header>
	<h2>"<c:out value="${nd.notice_num}"/>번 게시글" </h2>
	</header>
	<hr/>
	<h2>제목 :  <input type="text" disabled value="${nd.ntitle}">
		작성자 : <input type="text" disabled value="${nd.nwriter}">
	</h2>
	<h2 class="a"><c:out value="${nd.ncontent}" /></h2>
</div>

<div class="text-center">
	<div class="btn-group">
	<a href="/notice/noticeList" class="btn1 btn btn-dark">목록으로</a>
	
	<c:if test="${nd.nwriter eq login_session.uid}">
	
		<form action="/notice/noticeDelete" method="post">
			<input type="hidden" name="notice_num" value="${nd.notice_num}">
			<input type="submit" value="삭제하기" class="btn2 btn btn-danger">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		<form action="/notice/noticeUpdate" method="post">
			<input type="hidden" name="notice_num" value="${nd.notice_num}">
			<input type="submit" value="수정하기" class="btn3 btn btn-primary">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		</c:if>
	</div>
</div>
		<hr>
		<div class="text-center">
		<h3>댓글</h3>
		
			<div>
				<c:if test="${login_session ne null}">
					<input type="hidden" name="replyer" value="${login_session.name}" id="newReplyWriter">
				</c:if>
				<c:if test="${login_session eq null}">
					<input type="hidden" name="replyer" value="${ip}" id="newReplyWriter">
				</c:if>
			</div>
			<div>
				<input type="text" style="width:800px" name="reply" placeholder="명예훼손, 개인정보 유출, 분쟁, 유발, 허위사실 유포 등의 글은 이용약관에 의해 제재는 물론 법률에 의해 처벌 받을수 있습니다. 건전한 커뮤니티를 위해 자제 부탁드립니다." 
				id="newReply">
			<button id="replyAddBtn" class="btn btn-dark">댓글 등록</button>
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
		
	
		
		<ul id="replies">
		
		</ul>
	
	<script>
		var notice = "${nd.notice_num}";
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		function getAllList(){
		
		$.getJSON("/notice/noticeDetail/replies/all/" + notice ,function(data) {
			console.log(data);
			console.log("------");
			console.log(data.length);
			
			var str = "";
			
			$(data).each(function(){
				
				str +="<li data-rno='" + this.rno + "' class='replyLi'>"
				+ "<div class='reply'>" + this.rno + " : " + this.reply + " : " + this.replyer 
				+ "<button type='button' class='btn btn-info'>수정/삭제</button></li>" + "<br/></div>";
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
				beforeSend: function(xhr) {
				    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
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
					beforeSend: function(xhr) {
					    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
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
				beforeSend: function(xhr) {
				    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
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
	</div>

	
	
</body>
<footer>
	
	<hr/>

	<div class="row">
		<h6 class="text-center">홈페이지 : <strong>www.onffice.com</strong></h6>
		<h6 class="text-center">주소 : <strong>서울특별시 마포구 양화로 127, 첨단빌딩</strong></h6>
		<h6 class="text-center">만든이 : <strong>배용우 신우람 고광훈 서성현 신동규</strong> </h6>
	</div>


	
</footer>
</html>