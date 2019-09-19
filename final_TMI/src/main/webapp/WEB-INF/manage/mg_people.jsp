<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/Header.jsp"%>
<%@include file="../include/aside.jsp"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/tmi/css/manage_people.css" type="text/css">
<script src="/tmi/js/manage.js"></script>

</head>
<body>
	<c:forEach items="${people}" var="dto">
		<input type="hidden" value="${dto.pro_id }" id="pro_id">
	</c:forEach>
	<div id="pj_setting_form">
		<div>

			<div>
				<h2>프로젝트 매니저</h2>
				<div class="form-group">
					<label for="sel1">매니저 선택:</label> <select class="form-control"
						id="sel1">
						<c:forEach items="${people }" var="people">
							<option value="${people.id }" id="manager">${people.id }</option>
						</c:forEach>
					</select>
				</div>

				<input type="submit" class="btn btn-info" id="manegerSet" value="변경">
			</div>

			<div>팀원 수정
			<input type="submit" class="btn btn-primary" id="memAdd" value="추가">
			<input type="submit" class="btn btn-danger" id="memDel" value="제거">
			</div>
			
			<br>
			<c:forEach items="${people }" var="people">
				<c:choose>
					<c:when test="${people.pt_level==1 }">
						<label class="checkbox-inline"> <input type="checkbox"
							value=${people.id } disabled /> ${people.id }
						</label>
					</c:when>
					<c:otherwise>
						<label class="checkbox-inline"> <input type="checkbox" id="chkbox"
							value=${people.id } /> ${people.id }
						</label>
					</c:otherwise>
				</c:choose>
			</c:forEach>

		</div>
		<input type="submit" class="btn btn-warning" id="back" value="뒤로">
	</div>
	
	<div id="modifyModal">
		<p>
			<label for="updateReplyText">아이디 입력</label> <input
				class="for-control" type="text" placeholder="reply text"
				id="memberText">
		</p>
		<p>
			<button id="btnAdd">추가</button>
			<button id="btnClose">닫기</button>
		</p>
	</div>
</body>
</html>