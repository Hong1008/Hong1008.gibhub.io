<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->
<script src="/tmi/js/home.js" type='text/javascript'></script>
<link href='/tmi/css/home.css' type='text/css' rel='stylesheet'>
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
	

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="include/Header.jsp"></jsp:include>

<!---------------------------------------- 어사이드 연결 ---------------------------------------->
<jsp:include page="include/aside.jsp"></jsp:include>


<!---------------------------------------- 구글 로그인 연결 ---------------------------------------->
<meta name="google-signin-client_id"
	content="671834931461-oho886cp17h30uvureqappjn4q2ul6j1.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>


<title>세계의 모든일 Task Universe</title>
</head>
<body>
	<div id='bodywrap'>
		<div id="pro_div">
			<div class='project'>
                <div class="pro_header">
                    <div class="pro_name">project01</div>
                </div>
                <div class="pro_body"></div>
			</div>
		</div>
	</div>
</body>
</html>