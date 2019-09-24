<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀부분</title>
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->
<script src="../js/project_schedule.js" type='text/javascript'></script>
<link href='../css/project_schedule.css' type='text/css' rel='stylesheet'>
<link href='../css/COMMON.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
</head>
<body>
<button id="back">&#60;</button>
<button id="sch_end">스케줄종료</button>
<p>schedule.jsp</p>
<div><c:out value="${schOne }"></c:out></div>
</body>
<script type="text/javascript">
	$('#back').click(function(){
		window.location.href='management';
	})
	
	$('#sch_end').click(function(){
		
	}
	
</script>
</html>