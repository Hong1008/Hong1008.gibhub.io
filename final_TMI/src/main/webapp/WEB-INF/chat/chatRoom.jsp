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
<script src="/tmi/js/chat_chatRoom.js" type='text/javascript'></script>
<link href='/tmi/css/chat_chatRoom.css' type='text/css' rel='stylesheet'>
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
			<div id="filepreviewArea">
				<div id="filepreviewAreaimg"></div>
			</div>
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
														<img class='replyimg'
															src="/tmi/chatting/${dto.realfilename}">
													</c:if>
													<a href="/tmi/chatting/${dto.realfilename}"
														download="${fn:substringAfter(dto.realfilename,'!park_')}">${fn:substringAfter(dto.realfilename,'!park_')}</a>
												</div>
												<br />
											</div>

										</c:if>
										<c:if test="${sessionScope.id!=dto.id }">
											<div class='opwrap'>
												<div id='img' class='inline'>
													<c:if test="${dto.profile_img!=null}">
														<img id='img' src="/tmi/profile_img/${dto.profile_img}">
													</c:if>
													<c:if test="${dto.profile_img==null}">
														<img id='img' src="../resources/memberimg/user.png">
													</c:if>
												</div>
												<div id='name' class='inline'>${dto.id}</div>
												&nbsp;
												<div class='inline' id='time'>${dto.chat_time}</div>
												<br />
												<div class='replyMessage'>${dto.chat_content}
													<c:if test="${dto.realfilename!=null}">
														<img class='replyimg'
															src="/tmi/chatting/${dto.realfilename}">
													</c:if>
													<a href="/tmi/chatting/${dto.realfilename}"
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
							<img class="efimg" src="/tmi/chatting/${file.realfilename}">
						</div>
						<div class="eachFileName">
							<small>${fn:substringAfter(file.realfilename,'!park_')}</small>
						</div>
						<input type="checkbox" id="${file.realfilename }"
							class="multiDown" value="${file.realfilename }"> <label
							for="${file.realfilename }"></label>
					</div>
				</c:forEach>
			</div>
			<div id="selectfilecnt">선택된 갯수 : 0</div>
			<input id="multiDown" type="button" value="다운로드">
		</div>
		<input type="hidden" value="${sessionScope.id }" id="userNick">
		<input type="hidden" value="${myImg}" id="myprofimg"> <input
			type="hidden" value="${sessionScope.pro_id}" id="projectId">
	</div>
	<div id="footer"></div>
</body>
</html>