<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<script>
window.onload = function(){
	let sock;
	let userid;
	
$("#sendBtn").click(function(){
	sendMessage();
	$('#message').val('');
});
}
function connect() {
	sock = new SockJS("http://localhost:8181/chat");
	sock.onopen = function() {
		console.log('연결 생성');
		register();
	};
	
	sock.onmessage = function(e) {
		console.log('메시지 받음');
		let data = e.data;
		addMsg(data);
	};
	
	sock.onclose = function() {
		console.log('연결 끊김');
	};
	
}
	function addMsg(msg) {
		let chat = $('#msgArea').val();
		chat = chat + "\n"+ $("#targetUser").val() +" : " +  msg;
		$('#msgArea').val(chat);
	}
	//메세지 전송
	function register(){
		let msg = {
				type : "register",
				userid : $("#userId").val()
		};
		sock.send(JSON.stringify(msg));
	}
	//서버로부터 메세지를 받을때
	function sendMsg(){
		let msg = {
				type : "chat", 
				target : $("#targetUser").val(),
				message : $("#chatMsg").val()
		};
		sock.send(JSON.stringify(msg));
	};
	
	$(function() {
		connect();
		$('#btnSend').on("click", function() {
			let chat = $("#msgArea").val();
			chat = chat + "\n"+$("#userId").val()+" : " + $("#chatMsg").val();
			$("#msgArea").val(chat);
			sendMsg();
			$("#chatMsg").val("");
		})
	});
</script>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<textarea rows="5" cols="30" id="msgArea">
	</textarea>
	<input type="hidden" id="userId" value="${login_session.uid}">
	<br> 메시지 : <input type="text" id="chatMsg">
	<br> 상대 아이디 : <input type="text" id="targetUser">
	<br>
	<input type="button" value="전송" id="btnSend">
</body>
</html>