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
		//배포시 아이피 바꿔야함 192.168.30.65이건 내꺼
		websocket = new WebSocket("ws://localhost:8090/tmi/chatting");
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
		websocket.onclose = onClose;
		

		//엔터일때도
		$('#message').keypress(function(event) {
			if (event.keyCode == 13) {
				if (!event.shiftKey) {
					event.preventDefault();
					var msg = $('#message').val();
					if (msg == "")
						return false;
					msg = msg.replace(/(?:\r\n|\r|\n)/g, '<br/>');
					//메시지 전송
					websocket.send(msg);
					//메시지 입력창 초기화
					$('#message').val('');

				}

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
		$('#chatMessage')
				.append(
						"<div class='wrap'><div id='img' class='inline'><img id='img' src='../resources/asideimg/chat.png'></div><div id='name' class='inline'>니이름</div>&nbsp;<div class='inline' id='time'>시간</div><br/><div class='replyMessage'>"
								+ data + "</div><br /></div>");
		//스크롤바
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
	}
</script>
<style type="text/css">
body{
background-color: rgb(243, 238, 238);
}
#contents {
	width: 98%;
	margin-left: 5%;
}
#chatBox {

	float: left;
	width: 60%;
	height: 854px;
}

#chatBox #chatArea {
	overflow: auto;
	width: 100%;
	height: 80%;
}

#chatBox #chatArea #chatMessage {
	margin-top: 10px;
	margin-left: 20px;
}

#chatBox p {
	margin-top: 15px;
	margin-left: 20px;
}

#chatBox #message {
	padding:10px 8px;
	margin-top: 20px;
	margin-left: 20px;
	width: 90%;
	height: 60px;
 
	resize: none;
}
#chatBox #insBox{

}
#fileBox {
	background-color: aqua;
	float: right;
	width: 40%;
	height: 854px;
}

.wrap {
	margin-bottom: 20px;
}

.inline {
	display: inline;
}

#img {
	width: 50px;
	hegiht: 50px;
}

#time {
	font-size: small;
	color: gray;
}

#name {
	font-weight: bold;
}

#chatMessage span {
	float: left;
}

.replyMessage {
word-break;
	max-width:80%;
	margin-top: 5px;
	padding: 8px 14px;
	border-radius: 30px;
	background-color: white;
	display: inline-block;
	margin-left: 50px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12) !important;
}


</style>
</head>
<jsp:include page="../include/Header.jsp"></jsp:include>
<jsp:include page="../include/aside.jsp"></jsp:include>
<body>
	<div id="contents">
		<div id="chatBox">
			<div id="chatArea">

				<div id="chatMessage"></div>
			</div>
			<p>
				
			</p>

			<div id='insBox'><!--  -->
				<textarea id="message" cols="10" wrap="hard"></textarea>
				<!-- <input type="text" id="message" /> -->
			</div>
		</div>
		<div id="fileBox"></div>
		<input type="hidden" value="아이디"> <input type="hidden"
			value="프로젝트아이디">
	</div>
</body>
</html>