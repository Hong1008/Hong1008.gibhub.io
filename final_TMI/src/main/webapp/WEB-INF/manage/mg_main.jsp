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

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/gentelella/1.4.0/css/custom.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="/tmi/css/manage.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/tmi/js/manage.js"></script>

    
</head>
<body>
	<input type="hidden" value="<c:out value="${content.pro_id }"/>"
		id="pro_id">

	<c:set value="${content }" var="content" />
	<div class="pj_contentForm">
		<div class="pj_name">
			<c:out value="${content.pro_name }" />
		</div>
		<table id="customers">
			<tr>
				<th>프로젝트 시작일</th>
				<th>프로젝트 종료일</th>
				<th>실제종료일</th>
			</tr>
			<tr>
				<td>
					<c:out value="${content.pro_start }" />
				</td>
				<td>
					<c:out value="${content.pro_end }" />
				</td>
				<td>
					<c:choose>
						<c:when test="${content.pro_rend == null }">
							<a href="#search-bar" class="btn" rel="modal:open">추가</a>
						</c:when>
						<c:otherwise>
							<c:out value="${content.pro_rend }" />
						</c:otherwise>						
					</c:choose>
				</td>
			</tr>		
		</table>
		<br/>
		
		<div id="pj_info">
			<c:out value="${content.pro_info }" />
		</div>

		<input class="pj_setting" type="submit" value=' '>
		
		<div class="pj_name">프로젝트 팀원</div>
		<table id="customers">
			<tr>
				<th>아이디</th>
				<th>관리 등급</th>
			</tr>
			<c:forEach items="${people }" var="people">

				<tr>
					<td>${people.id }</td>
					<c:choose>
					<c:when test="${people.pt_level==1 }">
					<td>관리자</td>
					</c:when>
					<c:otherwise>
					<td>일반팀원</td>
					</c:otherwise>
					</c:choose>
				</tr>
				
			</c:forEach>
		</table>
		<input class="pj_people" type="submit" value=" ">

	</div>
	
	<form id="search-bar" class="modal" action="rendSet">
				<label for="search_id">실제 종료 날짜를 선택해주세요</label>
				<input type="date" id="search_id" name="rendSetting">				
				<input type="submit" value="종료일 추가">
	</form>


</body>
</html>