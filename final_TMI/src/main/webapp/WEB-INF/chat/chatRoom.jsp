<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		//연결

		//배포시 아이피 바꿔야함 192.168.30.65이건 내꺼
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
					var projectId = $('#projectId').val();
					var userNick = $('#userNick').val();
					if (msg == "")
						return false;
					msg = msg.replace(/(?:\r\n|\r|\n)/g, '<br/>');
					//메시지 전송
					websocket.send(projectId + ":" + userNick + ":" + msg);
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
		var dataSplit = data.split(':');
		var dateD = new Date();
		var itsme = $('#userNick').val();
		if (itsme == dataSplit[0]) {
			$('#chatMessage').append(
					"<div class='mewrap'><div class='inline' id='time'>"
							+ dateD.getHours() + ":" + dateD.getMinutes()
							+ "</div><br/><div class='replyMessage'>"
							+ dataSplit[1] + "</div><br /></div>");
		} else {
			//메시지를 출력
			$('#chatMessage')
					.append(
							"<div class='opwrap'><div id='img' class='inline'><img id='img' src='../resources/asideimg/chat.png'></div><div id='name' class='inline'>"
									+ dataSplit[0]
									+ "</div>&nbsp;<div class='inline' id='time'>"
									+ dateD.getHours()
									+ ":"
									+ dateD.getMinutes()
									+ "</div><br/><div class='replyMessage'>"
									+ dataSplit[1] + "</div><br /></div>");
		}
		//스크롤바
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
	}
</script>
<style type="text/css">
body {
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
padding-bottom: 10px;
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
	float: left;
	padding: 10px 8px;
	margin-top: 30px;
	width: 80%;
	height: 60px;
	resize: none;
	border: 1px solid rgb(123, 104, 238);
	border-left: none;
	outline: none;
}

#chatBox #insBox #bar{
	margin-top: 20px;
	margin-left: 5%;
    width: 80%;
}
#fileBtn input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

#fileBtn #filelabel {
	margin-left: 20px;
	border: 1px solid rgb(123, 104, 238);
	border-right: none;
	background-color: white;
	margin-top: 30px;
	float: left;
	width: 80px;
	height: 80px;
}

#fileBtn #filelabel #fileInsImg {
	margin: 10px 10px;
	width: 60px;
	height: 60px;
}

#fileBtn #fileInsImg:hover {
	transform: scale(1.1);
}
#fileBox {
	background-color: aqua;
	float: right;
	width: 40%;
	height: 854px;
}

.mewrap {
	text-align: right;
	width: 90%;
}

.opwrap {
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
	text-align: left;
	word-break: break-all;
	max-width: 80%;
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
				<c:choose>
					<c:when test="${chatList==null }">
						<div id="chatMessage"></div>
					</c:when>
					<c:otherwise>
						<div id="chatMessage">
						${chatList.chat_date}
						<c:forEach items="${chatList}" var="dto">
							<c:if test="${sessionScope.id==dto.id }">
							
									<div class='mewrap'>
										<div class='inline' id='time'>${dto.chat_time}</div>
										<br />
										<div class='replyMessage'>${dto.chat_content}</div>
										<br />
									</div>
								
							</c:if>
							<c:if test="${sessionScope.id!=dto.id }">
								<div class='opwrap'>
									<div id='img' class='inline'>
										<img id='img' src='../resources/asideimg/chat.png'>
									</div>
									<div id='name' class='inline'>${dto.id}</div>
									&nbsp;
									<div class='inline' id='time'>${dto.chat_time}</div>
									<br />
									<div class='replyMessage'>${dto.chat_content}</div>
									<br />
								</div>
							</c:if>
						</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<p></p>

			<div id='insBox'>
				<hr id="bar"/>
				<div id=fileBtn>
					<label for="file" id="filelabel"><img id="fileInsImg"
						src="../resources/Chat_img/paperclip.png/"></label> <input
						type="file" id="file" />
				</div>
				<textarea id="message" cols="10" wrap="hard"></textarea>
				<!-- <input type="text" id="message" /> -->
			</div>
		</div>
		<div id="fileBox"></div>
		<input type="text" value="${sessionScope.id }" id="userNick">
		<input type="text" value="${sessionScope.pro_id}" id="projectId">
	</div>
</body>
</html>