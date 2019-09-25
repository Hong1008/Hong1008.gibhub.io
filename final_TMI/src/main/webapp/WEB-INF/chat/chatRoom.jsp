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
	//파일 담을 리스트
	var fileList = [];
	$(document).ready(function() {
						$('#loading').hide();
						//시작 시 채팅영역 스크롤 하단으로 내리기
						$("#chatArea")
								.scrollTop($("#chatArea")[0].scrollHeight);
						var projectId = $('#projectId').val();
						var userNick = $('#userNick').val();
						$(window).ajaxStart(function() {
							$('#loading').show();
						})
						$(window).ajaxStop(function() {
							$('#loading').hide();
						});
						//취소버튼/*  */
						$('#fileInsC').click(function() {
							$('#fileInsModal').css({'visibility' : 'hidden','z-index' : '0','display' : 'none'});
							$("#filetable tr:not(:first)").remove();
							fileList=[];
							$('#file').val('');
						})
						//파일 전송버튼
						$('#fileInsSend').click(function() {
											//객체 담음
									
											if(fileList==''){
												alert('파일이 없습니다.');
												return false;
											}
										
											
											var formData = new FormData();
											formData.append('id','${sessionScope.id }');
											formData.append('pro_id','${sessionScope.pro_id}');
											if(fileList){
												for(var index in fileList){
													formData.append('filename', fileList[index]);
												}
											}
											$.ajax({
														url : 'chatInsertFile',
														processData : false,
														contentType : false,
														enctype : 'multipart/form-data',
														dateType : 'text',
														data : formData,
														type : 'POST',
														success : function(result) {
															$.each(result,function(i,v){
																console.log(v);
																var name=v.split('!park_');
																websocket.send('${sessionScope.pro_id}'+ ":"+ '${sessionScope.id }'+ ":"+ ":"+ v);
																$('#eachFileArea').prepend("<div class='eachFile'><div class='eachFileImg'><img class='efimg' src='/tmi/temp/"
																		+v+
																		"'></div><div class='eachFileName'><small>"
																		+ name[1]+
																		"</small></div><input type='checkbox' id='"+v+"'class='multiDown' value='"+v+"'><label for='"+v+"'></div>"); 
																console.log(v);
															})
																	$('#fileInsModal').css({'visibility' : 'hidden','z-index' : '0','display' : 'none'});
														}
													});
										});
						//인풋 파일
						$('#file').change(function() {
							if(fileList.length == 5){
								alert('한번에 5개까지 업로드 가능합니다.');
								return false;
							}
											var fileName=$(this).val();
											var showName=$(this).val().substring($(this).val().lastIndexOf("\\")+1);
											var fileNameLength = fileName.lenght;
											var latDot = fileName.lastIndexOf('.');
											var filetype = fileName.substring(latDot, fileNameLength).toLowerCase();
											$('#filetable').append('<tr class="nothead"><td><input type="checkbox" class="notall"/></td><td>' + showName + '</td></tr>');
											fileList.push($('#file')[0].files[0]);
										});
						//엔터로 메세지 발송
						$('#message')
								.keypress(
										function(event) {
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
				$('#filepreview').html("<img src="+ e.target.result +">");
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
		console.log("스플릿"+dataSplit);
		var dateD = new Date();
		var minut = dateD.getMinutes() < 10 ? "0" + dateD.getMinutes() : dateD
				.getMinutes();
		var itsme = $('#userNick').val();
		var filepath = dataSplit[2].split('!park_');
		console.log("페스"+filepath);
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
		//채팅영역에 채팅 입력 후 스크롤바 내리기 파일일경우 이미지 불러오는데 시간걸려서 딜레이 걸었음
		setTimeout(function() {
			$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		}, 8);

	}
</script>
<style type="text/css">
body {
	position: relative;
	background-color: rgb(243, 238, 238);
	min-width: 1060px;
}

#filemodal {
	z-index: 0;
	display: none;
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

#contents {
	/* position: relative; */
	z-index: 2;
	width: 95%;
	margin-left: 5%;
}

#chatBox {
width: 58%;
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
padding-left: 27px;
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
	height: 100px;
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
	<div id="fileInsModal">
		<div id="fileInsArea">
			<div id="insbox">
			<div id="tablewrap">
				<table id="filetable">
					<tr id="head">
						<th><input type="checkbox" id="chkall"></th>
						<th>파일명</th>
					</tr>
				</table>
				</div>
				<label for="file" class="btnstyle">파일첨부</label>
				<button id="fileInsSend" class="btnstyle">파일보내기</button>
				<button id="fileInsDel" class="btnstyle">파일삭제</button>
				<button id="fileInsC" class="btnstyle">종료</button>
				<div id="loading">
				<img src="../resources/Chat_img/loading.gif">
			</div>
			</div>
			<div id="filepreviewArea"></div>
		</div>
	</div>
	<div id="fileprPreviewModal">
		<div id="filePreviewImg">
			<img src="#" id="filePreviewImgSrc">
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
													<c:if test="${dto.realfilename!=null}">
														<img class='replyimg' src="/tmi/temp/${dto.realfilename}">
													</c:if>
													<a href="/tmi/temp/${dto.realfilename}"
														download="${fn:substringAfter(dto.realfilename,'!park_')}">${fn:substringAfter(dto.realfilename,'!park_')}</a>
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
													<c:if test="${dto.realfilename!=null}">
														<img class='replyimg' src="/tmi/temp/${dto.realfilename}">
													</c:if>
													<a href="/tmi/temp/${dto.realfilename}"
														download="${fn:substringAfter(dto.realfilename,'!park_')}">${fn:substringAfter(dto.realfilename,'!park_')}</a>
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
					<label id="filelabel"><img id="fileInsImg"
						src="../resources/Chat_img/paperclip.png/"></label>
					<form id="frm" method="post" enctype="multipart/form-data">
						<input type="file" id="file" name="file" />
					</form>
				</div>
				<textarea id="message" cols="10" wrap="hard"></textarea>

			</div>
		</div>
		<div id="fileBox">
			<div id="eachFileArea">
				<c:forEach items="${fileList}" var="file">
					<div class="eachFile">
						<div class="eachFileImg">
							<img class="efimg" src="/tmi/temp/${file.realfilename}">
						</div>
						<div class="eachFileName">
							<small>${fn:substringAfter(file.realfilename,'!park_')}</small>
						</div>
						<input type="checkbox" id="${file.realfilename }" class="multiDown"
							value="${file.realfilename }"> <label for="${file.realfilename }"></label>
					</div>
				</c:forEach>
			</div>
			<div id="selectfilecnt">선택된 갯수 : 0</div>
			<input id="multiDown" type="button" value="다운로드">
		</div>
		<input type="hidden" value="${sessionScope.id }" id="userNick">
		<input type="hidden" value="${sessionScope.pro_id}" id="projectId">
	</div>
</body>
<style>
#fileInsModal {
	z-index: 0;
	display: none;
	position: fixed;
	visibility: hidden;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .2);
}
#fileprPreviewModal {
	z-index: 0;
	display: none;
	position: fixed;
	visibility: hidden;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, .2);
}

#fileInsArea {
	width: 60%;
	height: 60%;
	position: relative;
	top: 45%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	text-align: center;
}

#fileInsArea #insbox {
	float: left;
	width: 60%;
	height: 100%;
}
#fileInsArea #insbox #tablewrap{
     margin: auto;
    margin-top: 50px;
    height: 300px;
    width: 500px;
}

#fileInsArea #insbox #tablewrap #filetable th:nth-child(2){
width: 450px;
max-width: 450;
height: 22px;
max-height: 22px;
}
#fileInsArea #insbox #tablewrap #filetable td:nth-child(2){
    font-size: small;
    overflow: hidden;
    width: 450px;
    max-width: 450px;
    word-break: break-all;
}
#fileInsArea #filepreviewArea {
float: left;
	width: 40%;
	height: 100%;
}

#filePreviewImg {
	width: 80%;
	height: 80%;
	position: relative;
	top: 45%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	text-align: center;
	overflow: auto;
}

.multiDown+label {
	display: block;
	margin: 0.2em;
	cursor: pointer;
	padding: 0.2em;
}

.multiDown {
	display: none;
}

.multiDown+label:before {
	content: "\2714";
	border: 0.1em solid #000;
	border-radius: 0.2em;
	display: inline-block;
	width: 1em;
	height: 1em;
	padding-left: 0.2em;
	padding-bottom: 0.3em;
	margin-right: 0.2em;
	vertical-align: bottom;
	color: transparent;
	transition: .2s;
}

.multiDown+label:active:before {
	transform: scale(0);
}

.multiDown:checked+label:before {
	background-color: MediumSeaGreen;
	border-color: MediumSeaGreen;
	color: #fff;
}

.multiDown:disabled+label:before {
	transform: scale(1);
	border-color: #aaa;
}

.multiDown:checked:disabled+label:before {
	transform: scale(1);
	background-color: #bfb;
	border-color: #bfb;
}

#eachFileArea {
	overflow: auto;
	width: 98%;
	height: 80%;
}

.eachFile {
	float: left;
	margin-top: 20px;
	margin-left: 40px;
	width: 180px;
	height: 180px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0
		rgba(0, 0, 0, .12) !important;
}

.eachFileName {
    word-break: break-all;
    overflow: hidden;
    max-height: 40px;
    margin: auto;
    width: 150px;
}

.eachFileImg {
	margin: auto;
	margin-top: 10px;
	width: 80px;
	height: 80px;
}

.eachFileImg .efimg {
	width: 80px;
	height: 80px;
}
</style>
<script type="text/javascript">
	$('#filelabel').click(function() {
		$('#fileInsModal').css({
			'visibility' : 'visible',
			'z-index' : '10',
			'display' : 'block'
		});
	})
	$('.multiDown').click(function() {
		$('#selectfilecnt').text("선택된 갯수 : " + $(".multiDown:checked").length);
	})
	$('.replyimg').click(function() {
		$('#fileprPreviewModal').css({
			'visibility' : 'visible',
			'z-index' : '10',
			'display' : 'block'
		});
		$('#filePreviewImgSrc').attr('src', $(this).attr('src'));
		/* $(this).attr('src') */
	})
	$('#multiDown').click(
			function() {
				$('.multiDown:checked')
						.each(
								function() {
									var a = $("<a>").attr("href",
											"/tmi/temp/" + $(this).val()).attr(
											"download", $(this).val())
											.appendTo("body");
									a[0].click();
									a.remove();
								})
			})
			$('#filePreviewImg').mouseleave(function(){
				 $('#fileprPreviewModal').css({'visibility' : 'hidden','z-index' : '0','display' : 'none'}); 
			})
			//파일 첨부 모달창에서 파일올라가는 테이블의 전부 체크버튼 처리
			$('#chkall').change(function(){
				if($('#chkall').is(":checked")){
					$('.notall').prop("checked", true);
				}else{
					$('.notall').prop("checked", false);
				}
			});
	$(document).on('click', '.notall', function(){
	if($(this).is(":checked")==false){
		$('#chkall').prop("checked", false);
	}
});
</script>
</html>