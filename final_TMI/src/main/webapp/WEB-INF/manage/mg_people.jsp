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
<link rel="stylesheet" href="css/manage.css" type="text/css">
<script src="js/manage.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/pj_setting.css" type="text/css">
<script src="js/managecontentupt.js"></script>

<style type="text/css">
.checkbox-inline {
	width: 300px;
	height: 100px;
	border: 1px solid black;
}
</style>
</head>
<body>
	
	<div id="pj_setting_form">
		<div>

			<div>
				<h2>프로젝트 매니저</h2>
				<form>
					<div class="form-group">
						<label for="sel1">매니저 선택:</label> <select class="form-control"
							id="sel1">
							<c:forEach items="${people }" var="people">
								<option value="1">${people.mem_id }</option>
							</c:forEach>
						</select>
					</div>

					<button type="button" class="btn btn-info">Info</button>
				</form>
			</div>

			<div>팀원 수정</div>
			<c:forEach items="${people }" var="people">
			<c:choose >
				<c:when test="${people.pt_level==1 }">
					<label class="checkbox-inline"> <input type="checkbox"
					value="Option 1" disabled/> ${people.mem_id }
				</label>
				</c:when>
				<c:otherwise>
				<label class="checkbox-inline"> <input type="checkbox"
					value="Option 1" /> ${people.mem_id }
				</label>
				</c:otherwise>
			</c:choose>
			</c:forEach>			

		</div>
	</div>
</body>
</html>