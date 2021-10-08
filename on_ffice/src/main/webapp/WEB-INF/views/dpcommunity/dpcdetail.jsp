<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
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
	
	<c:set var="DpCd" value="${dpcdetail}"></c:set>
	<h2>${DpCd.dc_num}번 게시글 입니다.</h2>
	<h2>부서번호 : ${DpCd.dp_code}</h2>
	<h2>글제목 : ${DpCd.dtitle}</h2>
	<h2>글본문 : ${DpCd.dcontent}</h2>
	<h2>글쓴이 : ${DpCd.dwriter}</h2>
	<h2>작성일 : ${DpCd.ddate}</h2>
	<h2>수정일 : ${DpCd.dupdate}</h2>
	<h2>조회수 : ${DpCd.dhits}</h2>
	
	<a href="/dpcommunity/dpclist?pageNum=${param.pageNum}&searchType=${param.searchType}&keyword=${param.keyword}"><button class="btn btn-success">게시판으로</button></a>
		<c:if test="${DpCd.dwriter eq login_session.name}">
						
		<form action="/dpcommunity/dpcupdate?pageNum=${param.pageNum}&searchType=${param.searchType}&keyword=${param.keyword}" method="post">
			<input type="hidden" name="dc_num" value="${DpCd.dc_num}">
			<input type="hidden" name="pageNum" value="${param.pageNum}">
			<input type="hidden" name="searchType" value="${param.searchType}">
			<input type="hidden" name="keyword" value="${param.keyword}">
			<input type="submit" value="수정하기" class="btn btn-warning" data-bs-toggle="modal">
		</form>
		<form action="/dpcommunity/dpcdelete?pageNum=${param.pageNum}&searchType=${param.searchType}&keyword=${param.keyword}" method="post">
			<input type="hidden" name="dc_num" value="${DpCd.dc_num}">
			 <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#createTodo">삭제하기</button>
			 
			 <div class="modal fade" id="createTodo" tabindex="-1" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">이 글을 삭제하시겠습니까?</h5>
			      </div>
			      	<div class="modal-body"> 
			      	<input type="submit" value="삭제하기">
			      	<button type="button" class="btn-primary" data-bs-toggle="modal" data-bs-target="#createTodo" aria-label="Close">취소</button> 
					</div>
			      </div>
			    </div>
			  </div>
	
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
		<ul id="dpcreplies">
		
		</ul>
	
	<script>
		var dp_community = "${DpCd.dc_num}";
		
		function getAllList(){
		
		$.getJSON("/dpcommunity/dpcdetail/dpcreplies/all/" + dp_community ,function(data) {
			console.log(data);
			console.log("------");
			console.log(data.length);
			
			var str = "";
			
			$(data).each(function(){
												
				str +="<li data-dno='" + this.dno + "' class='replyLi'>"
					+ "<div class='reply'>" + this.dno + ":" + this.reply + ":" + this.replyer + "</div>"
					+ "<button type='button' class='btn btn-info'>수정/삭제</button></li>";
			});
			
			$("#dpcreplies").html(str);
			
			});
		}
		getAllList();
		
		$("#replyAddBtn").on("click", function(){
			var replyer = $("#newReplyWriter").val();
			var reply = $("#newReply").val();
			
			console.log(replyer + "/" + reply);
			
			$.ajax({
				type : 'post',
				url : '/dpcommunity/dpcdetail/dpcreplies',
				headers: {
					"Content-Type"  :"application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					dp_community : dp_community ,
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
			
			var dno = $(".modal-title").html();
			var reply = $("#replytext").val();
				$.ajax({
				type : 'patch',
				url : '/dpcommunity/dpcdetail/dpcreplies/' + dno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PATCH"
				},
				dataType : 'text',
				data : JSON.stringify({reply:reply}),
				success : function(result) {
					if(result === 'SUCCESS') {
						alert(dno + "번 댓글 수정 완료");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			})
		});
		
		$("#replyDelBtn").on("click", function() {
			
			var dno = $(".modal-title").html();
			
			$.ajax({
				type : 'delete',
				url : '/dpcommunity/dpcdetail/dpcreplies/' + dno,
				success : function(result) {
					if(result === 'SUCCESS') {
						alert(dno + "번 댓글 삭제 완료");
						$("#modDiv").hide("slow");
						getAllList();
					}
				} 
			})
		});
		
		$("#dpcreplies").on("click", ".replyLi button", function() {
			var replyLi = $(this).parent();
			var dno = replyLi.attr("data-dno");
			var reply = $(this).parent().siblings(".reply").text();
						
			console.log(dno + ":" + reply);
			$(".modal-title").html(dno);
			$("#replytext").val(reply);
			$("#modDiv").show("slow");
		});
		
		$("#closeBtn").on("click", function() {
			$("#modDiv").hide("slow");
		})
		</script>
</body>
</html>