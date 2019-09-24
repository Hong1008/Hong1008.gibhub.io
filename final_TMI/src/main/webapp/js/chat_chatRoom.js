var websocket;
// 연결
// 배포시 아이피 바꿔야함 192.168.30.65이건 내꺼
websocket = new WebSocket("ws://192.168.30.65:8090/tmi/chatting");
websocket.onopen = onOpen;
websocket.onmessage = onMessage;
websocket.onclose = onClose;
// 파일 담을 리스트
var fileList = [];
$(document)
		.ready(
				function() {
					// ajax 로딩시 나올 이미지
					$('#loading').hide();
					// 시작 시 채팅영역 스크롤 하단으로 내리기
					$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
					var projectId = $('#projectId').val();// 프로젝트 아이디
					var userNick = $('#userNick').val();// 닉네임 또는 아이디
					var myprofimg = $('#myprofimg').val();// 프로필 이미지 저장
					// ajax시작
					$(window).ajaxStart(function() {
						$('#loading').show();
					})
					// ajax 끝
					$(window).ajaxStop(function() {
						$('#loading').hide();
					});
					// 파일 첨부 모달에서의 취소버튼
					$('#fileInsC').click(function() {
						fileInsModalHide();
					})

					// 파일 첨부 모달에서의 삭제버튼
					$('#fileInsDel').click(function() {
						console.log(fileList);
						var chkbox = $('.notall:checked');
						chkbox.each(function(i, v) {
							var td = $(v).parent();
							var td2 = $(td.next()).html();
							fileList.splice(fileList.indexOf(td2), 1);
						})
						$('.notall:checked').closest('tr').remove();
					})

					// 파일 첨부 모달에서의 파일 전송버튼
					$('#fileInsSend')
							.click(
									function() {
										// 객체 담음
										if (fileList == '') {
											alert('파일이 없습니다.');
											return false;
										}

										var formData = new FormData();
										formData.append('id',
												'${sessionScope.id }');
										formData.append('pro_id',
												'${sessionScope.pro_id}');
										if (fileList) {
											for ( var index in fileList) {
												formData.append('filename',
														fileList[index]);
											}
										}
										// ajax 시작
										$
												.ajax({
													url : 'chatInsertFile',
													processData : false,
													contentType : false,
													enctype : 'multipart/form-data',
													dateType : 'text',
													data : formData,
													type : 'POST',
													success : function(result) {
														$
																.each(
																		result,
																		function(
																				i,
																				v) {
																			console
																					.log(v);
																			var name = v
																					.split('!park_');
																			websocket
																					.send('${sessionScope.pro_id}'
																							+ ":"
																							+ '${sessionScope.id }'
																							+ ":"
																							+ '${myImg}'
																							+ ":"
																							+ ":"
																							+ v);
																			$(
																					'#eachFileArea')
																					.prepend(
																							"<div class='eachFile'><div class='eachFileImg'><img class='efimg' src='/tmi/chatting/"
																									+ v
																									+ "'></div><div class='eachFileName'><small>"
																									+ name[1]
																									+ "</small></div><input type='checkbox' id='"
																									+ v
																									+ "'class='multiDown' value='"
																									+ v
																									+ "'><label for='"
																									+ v
																									+ "'></div>");
																			console
																					.log(v);
																		})
														fileInsModalHide();
													}
												});
										// ajax끝
									});
					// 인풋 파일 체인지 발생시
					$('#file').change(
							function() {
								if (fileList.length == 5) {
									alert('한번에 5개까지 업로드 가능합니다.');
									return false;
								}
								inputPreview(this);
								var fileName = $(this).val();
								var showName = $(this).val().substring(
										$(this).val().lastIndexOf("\\") + 1);
								var fileNameLength = fileName.lenght;
								var latDot = fileName.lastIndexOf('.');
								var filetype = fileName.substring(latDot,
										fileNameLength).toLowerCase();
								$('#filetable').append(
										'<tr class="nothead"><td><input type="checkbox" class="notall"/></td><td>'
												+ showName + '</td></tr>');
								fileList.push($('#file')[0].files[0]);
							});
					//채팅 전송
					// 엔터로 메세지 발송
					$('#message').keypress(
							function(event) {
								if (event.keyCode == 13) {
									if (!event.shiftKey) {
										event.preventDefault();
										var msg = $('#message').val();
										if (msg == "")
											return false;
										msg = msg.replace(/(?:\r\n|\r|\n)/g,
												'<br/>');
										// 메시지 전송
										websocket.send(projectId + ":"
												+ userNick + ":" + myprofimg
												+ ":" + msg + ":" + null);
										// 메시지 입력창 초기화
										$('#message').val('');

									}

								}
							});
					//브라우저창을 종료, 이탈 웹소켓 종료
					$(window).on('close', function() {
						websocket.close();
					});
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
								$('.multiDown:checked').each(
										function() {
											var val = $(this).val().split('!park_');
											var a = $("<a>").attr("href",
													"/tmi/chatting/" + $(this).val()).attr(
													"download", val[1]).appendTo("body");
											a[0].click();
											a.remove();
										})
							})
					$('#filePreviewImg').mouseleave(function() {
						$('#fileprPreviewModal').css({
							'visibility' : 'hidden',
							'z-index' : '0',
							'display' : 'none'
						});
					})
					//파일 첨부 모달창에서 파일올라가는 테이블의 전부 체크버튼 처리
					$('#chkall').change(function() {
						if ($('#chkall').is(":checked")) {
							$('.notall').prop("checked", true);
						} else {
							$('.notall').prop("checked", false);
						}
					});
					$(document).on('click', '.notall', function() {
						if ($(this).is(":checked") == false) {
							$('#chkall').prop("checked", false);
						}
					});
				});
// 파일첨부 모달 화면에서 지우기 및 내용 삭제
function fileInsModalHide() {
	$('#fileInsModal').css({
		'visibility' : 'hidden',
		'z-index' : '0',
		'display' : 'none'
	});
	$("#filetable tr:not(:first)").remove();
	$('#filepreviewAreaimg img').remove();
	fileList = [];
	$('#file').val('');
}
//파일 미리보기
function inputPreview(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#filepreviewAreaimg').html("<img src="+ e.target.result +">");
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
	var filepath = dataSplit[3].split('!park_');
	//메세지 출력
	//나 자신일때
	if (itsme == dataSplit[0]) {
		//자료 송신일때
		if (dataSplit[2] == "") {
			$('#chatMessage')
					.append(
							"<div class='mewrap'><div class='inline' id='time'>"
									+ dateD.getHours()
									+ ":"
									+ minut
									+ "</div><br/><div class='replyMessage'><img class='replyimg' src='/tmi/chatting/"+dataSplit[3]+"'><a href='/tmi/chatting/"+dataSplit[3]+"' download='"+filepath[1]+"'>"
									+ filepath[1]
									+ "</a></div><br /></div>");
		} else {
			$('#chatMessage').append(
					"<div class='mewrap'><div class='inline' id='time'>"
							+ dateD.getHours() + ":" + minut
							+ "</div><br/><div class='replyMessage'>"
							+ dataSplit[2] + "</div><br /></div>");
		}
		//상대방일때
		//프로필이미지 널체크
	} else {
		var imgStr="";
		if(dataSplit[1]==""){
			imgStr="<img id='img' src='../resources/memberimg/user.png'>";
		}else{
			imgStr="<img id='img' src='/tmi/profile_img/"+dataSplit[1]+"'>";
		}
		//자료 송신일때
		if (dataSplit[2] == "") {
			$('#chatMessage')
					.append(
							"<div class='opwrap'><div id='img' class='inline'>"+imgStr+"</div><div id='name' class='inline'>"
									+ dataSplit[0]
									+ "</div>&nbsp;<div class='inline' id='time'>"
									+ dateD.getHours()
									+ ":"
									+ dateD.getMinutes()
									+ "</div><br/><div class='replyMessage'><img class='replyimg' src='/tmi/chatting/"+dataSplit[3]+"'><a href='/tmi/chatting/"+dataSplit[3]+"' download='"+filepath[1]+"'>"
									+ filepath[1]
									+ "</a></div><br /></div>");
		} else {
			$('#chatMessage')
					.append(
							"<div class='opwrap'><div id='img' class='inline'>"+imgStr+"</div><div id='name' class='inline'>"
									+ dataSplit[0]
									+ "</div>&nbsp;<div class='inline' id='time'>"
									+ dateD.getHours()
									+ ":"
									+ dateD.getMinutes()
									+ "</div><br/><div class='replyMessage'>"
									+ dataSplit[2] + "</div><br /></div>");
		}

	}
	//채팅영역에 채팅 입력 후 스크롤바 내리기 파일일경우 이미지 불러오는데 시간걸려서 딜레이 걸었음
	setTimeout(function() {
		$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
	}, 8);

}