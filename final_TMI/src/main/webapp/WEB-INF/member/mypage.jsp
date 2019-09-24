<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->


<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@charset "UTF-8";

* {
	margin: 0;
	padding: 0;
}

#bodywrap {
	width: 100%;
	height: 1000px;
	background: rgb(252, 247, 253);
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
	margin-top: 62px;
}

#ChangeForm {
	margin: 0 auto;
	margin-top: 232px;
	width: 480px;
	height: 327px;
	background: rgb(255, 255, 255);
	border-radius: 5px;
	border: 1px solid rgba(5, 5, 5, 0.2);
	box-sizing: border-box;
	padding-top: 13px;
}

label {
	font-size: 16px;
	margin-left: 33px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-bottom: 2px;
	display: block;
	margin-top: 14px;
	color: rgb(10, 10, 10);
}

#ChangeForm input {
	display: block;
	width: 410px;
	border-radius: 5px;
	margin-left: 31px;
	margin-bottom: 5px;
}

#ChangeForm input[type=text] {
	border: 1px solid rgba(5, 5, 5, 0.2);
	height: 48px;
}

#ChangePw_submit {
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
	margin-top: 31px;
}

#ChangePw_submit:hover {
	background-position-x: 100%;
}
</style>
<script type="text/javascript">
	$(document).ready(
			
			function() {
				$("#imgfile").click(function() {

					$("#file").click();
				})
				//실제 파일 인풋
				$('#file').change(
						function() {
                           
							var filename = $('#file').val();
							filename = filename.split("\\");
							var filetype = filename[2];
							filetype = filetype.split('.');
							if (filetype[1] == 'jpg' || filetype[1] == 'png'
									|| filetype[1] == 'gif') {
								inputPreview(this);

							}

						});

				function inputPreview(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$("#img").attr("src", e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}

			})
</script>
<%-- <%
String root=application.getRealPath("/")+"profie_img\\";
System.out.println("test.jsp"+root);
%> --%>
<style type="text/css">
#img {
	width: 80px;
    height: 80px;
	border-radius: 123px;
	-moz-border-radius: 123px;
	-khtml-border-radius: 123px;
	-webkit-border-radius: 123px;
}

#my_wrap{
padding-top: 100px;
    padding-left: 250px;
    background: #fcf7fd;
    }
    
    #imgfile{
    margin-top: 10px;
    border: 1px solid #a59fa7;
    width: 70px;
    height: 27px;
    background: #fcf7fd;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    border-radius: 16px;
    cursor: pointer;
    }
</style>
</head>
<body>
	<div id='my_wrap'>
		<form name="frm" method="post" action="mypage_update"
			enctype="multipart/form-data">
			<div>
			<c:set var="profile_img" value="${dto.profile_img}"/>
				<c:choose>
					<c:when test="${not empty dto.profile_img}">
						<img src="/tmi/profile_img/${dto.profile_img}" id="img" />
						<br/>
					</c:when>
					<c:otherwise>
						<img src="/tmi/resources/memberimg/user.png" id="img" />
						<br />
					</c:otherwise>
				</c:choose>

				<input type="button" id="imgfile" value="사진 변경" /> <input
					type="file" id="file" name="file" value="이미지 변경"
					style="display: none;" />
			</div>
			<div>
				아이디 <input type="text" name="id" value="${dto.id}" readonly />
			</div>
			<div>
				이름<input type="text" name="name" value="${dto.name}" />
			</div>
			<input type="submit" value="변경하기">
		</form>
	</div>
	<div id="bodywrap">
		<div id='logo' class='center_div'>TMI</div>
		<div id="ChangeForm" class="center_div">
			<form action="change_pwd.do">
				<label for="pwd">Password</label><input type="text" name="pwd"
					id="pwd" /> <label for="pwdck">Confirm password</label> <input
					type="text" name="pwdck" id="pwdck" /> <span>Make sure it's
					at least 15 characters OR at least 8 characters including a number
					and a lowercase letter.</<span>> <input id="ChangePw_submit"
						type="submit" value="Change PassWord" />
			</form>
		</div>
	</div>
	회원탈퇴
</body>
</html>