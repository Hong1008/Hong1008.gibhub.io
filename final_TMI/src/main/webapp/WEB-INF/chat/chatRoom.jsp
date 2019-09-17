<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var websocket;
	//연결
	//배포시 아이피 바꿔야함 192.168.30.65이건 내꺼
	websocket = new WebSocket("ws://localhost:8090/tmi/chatting");
	websocket.onopen = onOpen;
	websocket.onmessage = onMessage;
	websocket.onclose = onClose;

	$(document)
			.ready(
					function() {
						$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
						var projectId = $('#projectId').val();
						var userNick = $('#userNick').val();
						//파일 전송버튼
						$('#chatFileIns').click(function() {
											//객체 담음
											var formData = new FormData($('#frm')[0]);
											$.ajax({
														url : 'chatInsertFile',
														processData : false,
														contentType : false,
														enctype : 'multipart/form-data',
														dateType : 'json',
														data : formData,
														type : 'POST',
														success : function(result) {
														alert('성공');
														//모달 지우기
														$('#filemodal').css('visibility','hidden');
														$('#filemodal').css('z-index','1');
																//웹소캣 핸들러로 보냄
															websocket.send(projectId+ ":"+ userNick+ ":"+ ":"+ result);
																
														}
													});
										});
						//실제 파일 인풋
						$('#file').change(function() {
											$('#filemodal').css('visibility',
													'visible');
										 	$('#filemodal').css('z-index', '3'); 

									 		 var filename = $('#file').val();
											filename = filename.split("\\");
											var filetype = filename[2];
											filetype = filetype.split('.');
											if (filetype[1] == 'jpg'|| filetype[1] == 'png'|| filetype[1] == 'gif') {
												inputPreview(this);
											
											} else{
												$('#filepreview')
														.html(
																'<img src="../resources/Chat_img/text.png">');
											}
											$('#filename').append(filename[2]); 
										});
						
			

						//엔터일때도
						$('#message').keypress(function(event) {
											if (event.keyCode == 13) {
												if (!event.shiftKey) {
													event.preventDefault();
													var msg = $('#message')
															.val();
													if (msg == "")
														return false;
													msg = msg.replace(
															/(?:\r\n|\r|\n)/g,
															'<br/>');
													//메시지 전송
													websocket.send(projectId
															+ ":" + userNick
															+ ":" + msg + ":"
															+ null);
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
	function inputPreview(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#filepreview').html(
						"<img src="+ e.target.result +">");
			}
			reader.readAsDataURL(input.files[0]);
		}
	} 
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
		var minut = dateD.getMinutes() < 10 ? "0" + dateD.getMinutes() : dateD
				.getMinutes();
		var itsme = $('#userNick').val();
		var filepath = dataSplit[2].split('_');
		//메세지 출력
		//나 자신일때
		if (itsme == dataSplit[0]) {
			//자료 송신일때
			if (dataSplit[1] == "") {
				$('#chatMessage')
						.append(
								"<div class='mewrap'><div class='inline' id='time'>"
										+ dateD.getHours()
										+ ":"
										+ minut
										+ "</div><br/><div class='replyMessage'><img class='replyimg' src='/tmi/temp/"+dataSplit[2]+"'><a href='/tmi/temp/"+dataSplit[2]+"' download='"+filepath[1]+"'>"
										+ filepath[1]
										+ "</a></div><br /></div>");
			} else {
				$('#chatMessage').append(
						"<div class='mewrap'><div class='inline' id='time'>"
								+ dateD.getHours() + ":" + minut
								+ "</div><br/><div class='replyMessage'>"
								+ dataSplit[1] + "</div><br /></div>");
			}
			//상대방일때
		} else {
			
			//자료 송신일때
			if (dataSplit[1] == "") {
				$('#chatMessage')
						.append(
								"<div class='opwrap'><div id='img' class='inline'><img id='img' src='../resources/asideimg/chat.png'></div><div id='name' class='inline'>"
										+ dataSplit[0]
										+ "</div>&nbsp;<div class='inline' id='time'>"
										+ dateD.getHours()
										+ ":"
										+ dateD.getMinutes()
										+ "</div><br/><div class='replyMessage'><img class='replyimg' src='/tmi/temp/"+dataSplit[2]+"'><a href='/tmi/temp/"+dataSplit[2]+"' download='"+filepath[1]+"'>"
										+ filepath[1]
										+ "</a></div><br /></div>");
			} else {
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

		}
		//스크롤바
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
	}
</script>
<style type="text/css">
body {
	position: relative;
	background-color: rgb(243, 238, 238);
	min-width: 1060px;
}

#filemodal {
	position: fixed;
	visibility: hidden;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .2);
}

#fileShowBox {
	position: relative;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	height: 700px;
	background-color: white;
	text-align: center;
}

#fileShowBox #filepreview img {
	width: 100%;
	height: 100%;
}

#filepreview {
	display: inline-block;
	margin: auto;
	margin-top: 40px;
	margin-bottom: 20px;
	width: 300px;
	height: 400px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12) !important;
}

#chatFileIns {
	background-color: #c47135;
	border: none;
	color: #ffffff;
	cursor: pointer;
	display: inline-block;
	font-family: 'BenchNine', Arial, sans-serif;
	font-size: 1em;
	font-size: 22px;
	line-height: 1em;
	margin: 15px 40px;
	outline: none;
	padding: 12px 40px 10px;
	position: relative;
	text-transform: uppercase;
	font-weight: 700;
}

#chatFileIns:before, #chatFileIns:after {
	border-color: transparent;
	-webkit-transition: all 0.25s;
	transition: all 0.25s;
	border-style: solid;
	border-width: 0;
	content: "";
	height: 24px;
	position: absolute;
	width: 24px;
}

#chatFileIns:before {
	border-color: #c47135;
	border-right-width: 2px;
	border-top-width: 2px;
	right: -5px;
	top: -5px;
}

#chatFileIns:after {
	border-bottom-width: 2px;
	border-color: #c47135;
	border-left-width: 2px;
	bottom: -5px;
	left: -5px;
}

#chatFileIns:hover {
	background-color: #c47135;
}

#chatFileIns:hover:before, #chatFileIns:hover:after {
	height: 100%;
	width: 100%;
}

#contents {
	/* position: relative; */
	z-index: 2;
	width: 95%;
	margin-left: 5%;
}

#chatBox {
	float: left;
	width: 60%;
	height: 871px;
	float: left;
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

#chatBox #insBox #bar {
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
	height: 871px;
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

.replyimg {
	 display: block;
	width: 200px;
	height: 100%;
}

.todaychk {
	font-size: small;
	color: gray;
	text-align: center;
}
</style>
</head>
<jsp:include page="../include/Header.jsp"></jsp:include>
<jsp:include page="../include/aside.jsp"></jsp:include>
<body>
	<div id="filemodal">
		<div id="fileShowBox">
			<div id="filepreview"></div>
			<div id="filename"></div>
			<button id="chatFileIns">보내기</button>
		</div>
	</div>
	<div id="contents">
		<div id="chatBox">
			<div id="chatArea">
				<c:choose>
					<c:when test="${chatList==null }">
						<div id="chatMessage"></div>
					</c:when>
					<c:otherwise>
						<div id="chatMessage">
							<%-- ${chatList.chat_date} --%>
							<c:forEach items="${dateList}" var="date">
								<c:forEach items="${chatList}" var="dto">
									<c:if test="${date.chat_date==dto.chat_date}">
										<c:if test="${sessionScope.id==dto.id }">

											<div class='mewrap'>
												<div class='inline' id='time'>${dto.chat_time}</div>
												<br />

												<div class='replyMessage'>${dto.chat_content}
												<c:if test="${dto.upload!=null}">
												<img class='replyimg' src="/tmi/temp/${dto.upload}">
												</c:if>
													<a href="/tmi/temp/${dto.upload}"
														download="${fn:substringAfter(dto.upload,'_')}">${fn:substringAfter(dto.upload,'_')}</a>
												</div>
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
												<div class='replyMessage'>${dto.chat_content}
												<c:if test="${dto.upload!=null}">
												<img class='replyimg' src="/tmi/temp/${dto.upload}">
												</c:if>
													<a href="/tmi/temp/${dto.upload}"
														download="${fn:substringAfter(dto.upload,'_')}">${fn:substringAfter(dto.upload,'_')}</a>
												</div>
												<br />
											</div>
										</c:if>
									</c:if>
								</c:forEach>
								<c:if test='${date.chat_date != today}'>
									<div class="todaychk">${date.chat_date}</div>
								</c:if>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<p></p>

			<div id='insBox'>
				<hr id="bar" />
				<div id=fileBtn>
					<label for="file" id="filelabel"><img id="fileInsImg"
						src="../resources/Chat_img/paperclip.png/"></label>
					<form id="frm" method="post" enctype="multipart/form-data">
						<input type="file" id="file" name="file" />
					</form>
				</div>
				<textarea id="message" cols="10" wrap="hard"></textarea>

			</div>
		</div>
		<div id="fileBox"></div>
		<input type="hidden" value="${sessionScope.id }" id="userNick">
		<input type="hidden" value="${sessionScope.pro_id}" id="projectId">
	</div>
</body>
</html>