<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<!--수정사항  -->
<!-- 캡차 추가되서 밑에밀림 실행해서 보면알꺼임  -->
<!-- 아이디중복검사 이메일 중복검사 말풍선 추가해야됨 지금 alert  -->

<script>
	$(document)
			.ready(
					function() {
						function animateDivers() {
							$('#logo').css({
								'background-position-x' : '0px'
							});
							$('#logo').animate({
								'background-position-x' : '-1000px'
							}, 1000, animateDivers);
						}

						animateDivers();
						var id = false;
						$("#signUpId").on(
								"blur",
								function() {

									if ($("#signUpId").val() != "") {
										$.ajax({

											url : "id_test?id="
													+ $("#signUpId").val(),
											type : "get",
											async : false,
											success : function(res) {
												if (res == 1) {
													id = false;
													alert("중복검사 통과 x");

												} else {
													id = true;
													alert("중복 검사 통과 o");
												}
											}

										})
									}

								})
						var email = false;
						$("#signUpEmail").on(
								"blur",
								function() {
								if($("#signUpEmail").val()!="")
									{
									$.ajax({

										url : "email_test?email="
												+ $("#signUpEmail").val(),
										type : "get",
										async : false,
										success : function(res) {
											if (res == 1) {
												email = false;
												alert("이메일 중복검사 통과 x");

											} else {
												email = true;
												alert("이메일 중복 검사 통과 o");
											}
										}

									})
									}
								

								})
						
						$("#signUpSubmit")
								.click(
										function() {
											if ($("#signUpId").val() == "") {
												swal("Warning", "아이디를 입력해주세요!",
														"error");
											
						
	
												return false;

											} else if ($("#signUpEmail").val() == "") {
												swal("Warning", "이메일을 입력해주세요!",
												"error");
												return false;
											} else if ($("#signUpPassword")
													.val() == "") {
												swal("Warning", "비밀번호를 입력해주세요!",
												"error");
												return false;
											} else if (id == false) {
												swal("Warning", "아이디 중복검사를 확인해주세요!",
												"error");
												return false;
											} 
											else if(email== false)
												{
												swal("Warning", "이메일 중복검사를 확인해주세요!",
												"error");
												}
											
											else {
												$
														.ajax({
															url : 'UserInsert',
															type : 'post',
															data : {
																recaptcha : $(
																		"#g-recaptcha-response")
																		.val(),
																email : $(
																		"#signUpEmail")
																		.val(),
																pwd : $(
																		"#signUpPassword")
																		.val(),
																id : $(
																		"#signUpId")
																		.val()

															},
															success : function(
																	data) {
																switch (data) {
																case "0":
																	swal("Good job!", "가입성공!", "success");
																	break;

																case "1":
																	swal("Warning", "자동 가입 방지 봇을 확인 한뒤 진행 해 주세요!",
																	"error");
																	
																	grecaptcha
																			.reset();
																	return;
																	break;

																default:
																	swal("Warning", "자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : "
																			+ Number(data)
																			+ "]",
																	"error");
																	break;
																}
															}
														});
											}

										});
					});
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

#bodywrap {
	width: 100%;
	height: 1000px;
	background: rgb(252, 247, 253);
}

#content {
	
}

.center_div {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 0);
}

#logo {
	width: 550px;
	text-align: center;
	font-size: 135px;
	font-family: 'Dancing Script', cursive;
	color: white;
	font-weight: 700;
	opacity: 0.9;
	background: linear-gradient(-120deg, #12c2e9, #c471ed, #f64f59, #c471ed, #12c2e9);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-position-x: 0px;
	background-size: 1000px;
	margin-top: 100px;
}

#signUpForm {
	margin: 0 auto;
	padding-top: 15px;
	margin-top: 300px;
	width: 480px;
	height: 750px;
	background: rgb(255, 255, 255);
	border-radius: 5px;
	border: 1px solid rgba(5, 5, 5, 0.2);
	box-sizing: border-box;
	padding-top: 36px;
}

label {
	font-size: 16px;
	margin-left: 33px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-bottom: 5px;
	display: block;
}

#signUpForm input {
	display: block;
	width: 410px;
	border-radius: 5px;
	margin-left: 31px;
	margin-bottom: 5px;
}

.signUpText {
	border: 1px solid rgba(5, 5, 5, 0.2);
	height: 48px;
}

#signUpSubmit {
	background: linear-gradient(-120deg, #12c2e9, #c471ed, #f64f59);
	background-size: 150%;
	border: none;
	color: white;
	height: 71px;
	font-size: 32px;
	font-family: 'Raleway', sans-serif;
	font-weight: 100;
	transition: 0.5s;
	cursor: pointer;
	margin-top: 61px;
}

#signUpSubmit:hover {
	background-position-x: 100%;
}

.swicthtext {
	margin-left: 33px;
	font-family: 'Noto Sans KR', sans-serif;
	color: rgb(153, 153, 153);
}

.g-recaptcha {
	margin-left: 84px;
	margin-top: 28px;
}
</style>

</head>
<div id='bodywrap'>
	<div id='content'>
		<div id='logo' class='center_div'>EasyTask</div>
		<div id='signUpForm' class='center_div'>
			<form action="UserInsert" method="post">
				<label for="signUpEmail">id</label> <input type="text"
					class='signUpText' name="id" id='signUpId' title="음냐"
					value="${dto.id}"> <small class="swicthtext">Please
					write your ID</small> <label for="signUpEmail">email</label> <input
					type="text" class='signUpText' name="email" id='signUpEmail'
					value="${dto.email }"> <small class="swicthtext">Please
					write your email</small> <label for="signUpPassword">password</label> <input
					type="password" class='signUpText' name="pwd" id='signUpPassword'
					value="${dto.pwd }"> <small class="swicthtext">Please
					write your password</small>
				<div id='captcha'>
					<div class="g-recaptcha"
						data-sitekey="6Ld6HLYUAAAAAPuk3EckaPrxf46ilVvdnUD3ECrQ"></div>
				</div>
				<input type="button" id='signUpSubmit' value='Sign Up'>

			</form>


		</div>
	</div>
</div>

</body>
</html>