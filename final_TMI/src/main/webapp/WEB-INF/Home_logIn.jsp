<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->
<script src="../js/home.js" type='text/javascript'></script>
<link href='../css/homeLogin.css' type='text/css' rel='stylesheet'>
<link href='../css/COMMON.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">

<!---------------------------------------- 구글 로그인 연결 ---------------------------------------->
<meta name="google-signin-client_id"
	content="671834931461-oho886cp17h30uvureqappjn4q2ul6j1.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="include/Header.jsp"></jsp:include>

<title>세계의 모든일 Task Universe</title>
</head>
<body>
	<div id='bodywrap'>
		<div id="pro_div">
			<div id="pro_list">
                	<div class="pro_list_per no-drag">진행률</div>
                	<div class="pro_list_man no-drag">프로젝트 매니저</div>
                	<div class="pro_list_dday no-drag">남은시간</div>
                	<div class="pro_list_end no-drag">종료일</div>
                	</div>
			<div class='project'>
                <div class="pro_header">
                    <div class="pro_name no-drag">project01</div>
                </div>
                <div class="pro_body">
                	<div class="pro_per no-drag"><p>74</p>%</div>
                	<div class="pro_man no-drag">홍철민</div>
                	<div class="pro_dday no-drag"><p>27</p>day</div>
                	<div class="pro_end no-drag"><p>10</p>월<p>08</p>일</div>
                </div>
			</div>
						<div class='project'>
                <div class="pro_header">
                    <div class="pro_name">project02</div>
                </div>
                <div class="pro_body">                	
                <div class="pro_per no-drag"><p>59</p>%</div>
                	<div class="pro_man no-drag">이해람</div>
                	<div class="pro_dday no-drag"><p>44</p>day</div>
                	<div class="pro_end no-drag"><p>10</p>월<p>24</p>일</div></div>
			</div>
						<div class='project'>
                <div class="pro_header">
                    <div class="pro_name">project03</div>
                </div>
                <div class="pro_body">                
                	<div class="pro_per no-drag"><p>112</p>%</div>
                	<div class="pro_man no-drag">문주성</div>
                	<div class="pro_dday no-drag"><p>2</p>day</div>
                	<div class="pro_end no-drag"><p>09</p>월<p>11</p>일</div></div>
			</div>
		</div>
	</div>
</body>
</html>