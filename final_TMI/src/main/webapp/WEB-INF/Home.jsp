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
<link href='../css/home.css' type='text/css' rel='stylesheet'>
<link href='../css/COMMON.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="include/Header.jsp"></jsp:include>

<!---------------------------------------- 구글 로그인 연결 ---------------------------------------->
<meta name="google-signin-client_id"
	content="671834931461-oho886cp17h30uvureqappjn4q2ul6j1.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>


<title>세계의 모든일 Task Universe</title>
</head>
<body>
	<div id='bodywrap'>
		<div id="signUpArea">
			<div id="content" class='center_box'>
				<div id='textArea' class='no-drag'>
					<h1 class='no-drag'>
						Project <br>Management
					</h1>
					<h3 class='no-drag'>JooSung is a project management tool
						inspired by minimalism. From university team projects to business,
						simple tasks make it easy and fast to control and manage projects.</h3>
				</div>
				<div id='signForm'>
					<form action="">
						<label for="signUp_username">Username</label> <input type="text"
							name="" id="signUp_username" class="signIn" autocomplete="off">
						<label for="signUp_email">Email</label> <input type="text" name=""
							id="signUp_email" class="signIn" autocomplete="off"> <label
							for="signUp_password">Password</label> <input type="text" name=""
							id="signUp_password" class="signIn" autocomplete="off">
						<div id="signUpSubmitArea">
							<input type="submit" name="" id="signUpSubmit"
								value="sign up for 주성">
						<!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> -->
						</div>
						<div id="signInfo">By clicking “Sign up for GitHub”, you
							agree to our Terms of Service and Privacy Statement. We’ll
							occasionally send you account related emails.</div>
					</form>
				</div>
			</div>
		</div>
		<div id='info'></div>
		<div id='youtube'>
			<iframe class='center_box' width="1280" height="720"
				src="https://www.youtube.com/embed/4nKCAzdHm6A" frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>
		</div>
	</div>
</body>
</html>