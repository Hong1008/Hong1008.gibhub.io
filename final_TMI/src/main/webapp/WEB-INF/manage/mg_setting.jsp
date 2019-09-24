<%@page import="java.sql.Date"%>
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
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="/tmi/css/manage_people.css" type="text/css">
<script src="/tmi/js/managecontentupt.js"></script>

</head>
<body>
	<form id="set_form" method="post">
	<div id="pj_set">
		
			<c:set value="${dto }" var="pjcontent" />
			<input type="hidden"
					value="${pjcontent.pro_id }" id="pro_id" name="pro_id">
			
			<div class="container">
				<h2>프로젝트 정보 수정</h2>
				
					<div class="form-group">
						<label for="pro_name">프로젝트 이름:</label>
						<input type="text" class="form-control" id="pro_name" name="pro_name" required="required"
						value="${pjcontent.pro_name }" placeholder="프로젝트 이름을 입력하세요">
					</div>
					
					<div class="form-group">
						<label for="pro_start">프로젝트 시작일:</label> 
						<input type="date" class="form-control" id="pro_start" name="pro_start" required="required"
						value="${pjcontent.pro_start }">
					</div>
					<div class="form-group" id="end_form">
						<label for="pro_end">프로젝트 종료일:</label> 
						<input type="date" class="form-control" id="pro_end" name="pro_end" required="required"
						value="${pjcontent.pro_end }">
					</div>
					<div class="form-group">
						<label for="pro_rend">프로젝트 실종료일:</label> 
						<input type="date" class="form-control" id="pro_rend" name="pro_rend" required="required" readonly="readonly"
						value="${pjcontent.pro_rend }" >
					</div>
					
					<div class="form-group">
						<label for="pro_info">프로젝트 정보:</label>
						<br/> 						
						<textarea rows="5" cols="40" id="pro_info" name="pro_info"
						 class="form-control">${pjcontent.pro_info }</textarea>
					</div>
					
					<input type="submit" class="btn btn-warning" value="뒤로" id="back">
					<input type="submit" class="btn btn-success" value="수정" id="update">
									
			</div>
		
	</div>
	</form>


</body>
</html>