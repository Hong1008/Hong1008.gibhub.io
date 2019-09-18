<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀부분</title>
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->
<script src="../js/project_management.js" type='text/javascript'></script>
<link href='../css/project_management.css' type='text/css' rel='stylesheet'>
<link href='../css/COMMON.css' type='text/css' rel='stylesheet'>
<link href='../css/project_schedule.css' type='text/css' rel='stylesheet'>
<link href='../css/project_timeline.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>
<!---------------------------------------- 어사이드연결 ---------------------------------------->
<jsp:include page="../include/aside.jsp"></jsp:include>

</head>
<body>
	<div class="btn-group no-drag ">	
		<button id="kanbanboard" class=''>Kanban</button>
		<button id="timeline">TimeLine</button>
		<button id="calender">Calendar</button>
	</div>
	<div class="showWhat">
		<jsp:include page="kanbanboard.jsp"></jsp:include>
	</div>
</body>
</html>