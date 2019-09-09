<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var websocket;
	$(document).ready(function() {
		//연결
		websocket = new WebSocket("ws://localhost:8090/tmi/chatting");
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
		//전송버튼
		$('#sendBtn').on('click', function() {
			var msg = $('#message').val();
			//메시지 전송
			websocket.send(msg);
			//메시지 입력창 초기화
			$('#message').val('');
		});

		//엔터일때도
		$('#message').keypress(function(event) {
			if (event.keyCode == 13) {
				var msg = $('#message').val();
				//메시지 전송
				websocket.send(msg);
				//메시지 입력창 초기화
				$('#message').val('');
			}
		});

		//브라우저창을 종료할때
		$(window).on('close', function() {
			websocket.close();
		});
	});
	//WebSocket이 연결된 경우 호출되는 함수
	function onOpen(evt) {
		console.log("웹 소켓에 연결 성공");
	}

	//WebSocket이 연결 해제된 경우 호출되는 함수
	function onClose(evt) {
		console.log("웹 소켓에 연결 해제");
	}

	//서버에서 메시지가 왔을 때 호출되는 함수
	function onMessage(evt) {
		//서버가 전송한 메시지 가져오기
		var data = evt.data;
		//메시지를 출력
		$('#chatMessage').append(data + "<br />");
	}
</script>
<style type="text/css">
#chatBox{
float:left;
width:70%;
height: 871px;
}
#chatBox #chatArea{
width:100%;
height:80%;
}
#chatBox #chatArea #chatMessage{
margin-top:10px;
margin-left: 20px;
}
#chatBox p{
margin-top: 15px;
margin-left: 20px;
}
#chatBox #message{
margin-top:20px;
margin-left:20px;
width: 90%;
height: 10%
}
#chatBox #sendBtn{
width:5rem;
height:5rem;
}
#fileBox{
background-color:aqua;
float:right;
width:25%;
height: 871px;
}
</style>
</head>
<jsp:include page="../include/Header.jsp"></jsp:include>
<jsp:include page="../include/aside.jsp"></jsp:include>
<body>
<div id="chatBox">
	<div id="chatArea">
		<div id="chatMessage"></div>
	</div>
	<p>
	<input type="button" value="기타버튼">
	<input type="button" value="기타버튼">
	<input type="button" value="기타버튼">
	<input type="button" value="기타버튼.">
	</p>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송" />
</div>
<div id="fileBox">

</div>
</body>
</html>