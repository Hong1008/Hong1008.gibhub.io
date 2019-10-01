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
				
			    /* 프로젝트 완료목록 클릭시 이동하는거  */
				$(".project_success").click(function(){
					 var form = document.createElement("form");
			    	  form.setAttribute("method", "POST"); // Get 또는 Post 입력
			    	  form.setAttribute("action", "project/management");
			    	  $(form).append($(this).children('#pro_id_success'));
			    	  document.body.appendChild(form);
			    	  form.submit();
				})
				
				
				$(".projectDelete").click(function(){
				
					  var pro_mgr=$(this).prev().children(".pro_mgr").text();
					  var form = document.createElement("form");
			    	  form.setAttribute("method", "POST"); // Get 또는 Post 입력
			    	  form.setAttribute("action", "deleteProject");
			    	  $(form).append($(this).prev().children('#pro_id_success'));
			    	  
				  if($("#sessionId").val()==pro_mgr)
					  {
					  
					  swal({
						  title: "프로젝트 삭제",
						  text: "프로젝트가 삭제됩니다",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
					    	
							  
						 
							swal("Good job!", "삭제 성공!", "success")
							.then((value) => {
								var tf = $('<input type="hidden" value="true" name="tf">');
								$(form).append(tf);
								document.body.appendChild(form);
								
								  form.submit();
							});
						 
						    
						    
						    
						    
						  } else {
							  swal("Warning", "취소 되었습니다.",
								"error");
						  }
						});
					 
					    
					  }
				  else
					  {
					  swal({
						  title: "프로젝트 탈퇴",
						  text: "프로젝트에서 탈퇴됩니다",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
							  
							  
							  swal("Good job!", "탈퇴 성공!", "success")
								.then((value) => {
									var tf = $('<input type="hidden" value="false" name="tf">');
									$(form).append(tf);
									document.body.appendChild(form);
									  form.submit();
								});
							 
						  } else {
							  swal("Warning", "취소 되었습니다.",
								"error");
						  }
						});
					  }
					
					
				})
				
				
				var skin;
				
				$('.theme').on('click',function(){
					for(var i =1; i<21;i++){
						$('.tmi_skin').removeClass('tmi_skin'+i);
					}					
					 	skin = $(this).children().val();
					 	$('.tmi_skin').addClass(skin);
					 	$("input[name='theme']").val(skin);
				});
				
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

#my_wrap {
	padding-top: 100px;
	padding-left: 250px;
	background: #fcf7fd;
}

#imgfile {
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

.theme {
	width: 41px;
	height: 41px;
	float: left;
	margin-left: 10px;
	cursor: pointer;
}

#my_theme {
	width: 510px;
	height: 120px;
}
</style>
</head>
<body>
	<div id='my_wrap'>
		<form name="frm" method="post" action="mypage_update"
			enctype="multipart/form-data">
			<div>
				<c:set var="profile_img" value="${dto.profile_img}" />
				<c:choose>
					<c:when test="${not empty dto.profile_img}">
						<img src="/tmi/profile_img/${dto.profile_img}" id="img" />
						<br />
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
			
			<div id='my_theme'>
			<c:choose>
			<c:when test="${empty dto.theme}">
			<input type="hidden" name="theme" value="tmi_skin1"/>
			</c:when>
			<c:otherwise>
			<input type="text" name="theme" value='${dto.theme}'/>
			</c:otherwise>
			</c:choose>
			
				<div class='theme tmi_skin1' id='theme01'><input type="hidden" value="tmi_skin1"></div>
				<div class='theme tmi_skin2' id='theme02'><input type="hidden" value="tmi_skin2"></div>
				<div class='theme tmi_skin3' id='theme03'><input type="hidden" value="tmi_skin3"></div>
				<div class='theme tmi_skin4' id='theme04'><input type="hidden" value="tmi_skin4"></div>
				<div class='theme tmi_skin5' id='theme05'><input type="hidden" value="tmi_skin5"></div>
				<div class='theme tmi_skin6' id='theme06'><input type="hidden" value="tmi_skin6"></div>
				<div class='theme tmi_skin7' id='theme07'><input type="hidden" value="tmi_skin7"></div>
				<div class='theme tmi_skin8' id='theme08'><input type="hidden" value="tmi_skin8"></div>
				<div class='theme tmi_skin9' id='theme09'><input type="hidden" value="tmi_skin9"></div>
				<div class='theme tmi_skin10' id='theme10'><input type="hidden" value="tmi_skin10"></div>
				<br>
				<div class='theme tmi_skin11' id='theme11'><input type="hidden" value="tmi_skin11"></div>
				<div class='theme tmi_skin12' id='theme12'><input type="hidden" value="tmi_skin12"></div>
				<div class='theme tmi_skin13' id='theme13'><input type="hidden" value="tmi_skin13"></div>
				<div class='theme tmi_skin14' id='theme14'><input type="hidden" value="tmi_skin14"></div>
				<div class='theme tmi_skin15' id='theme15'><input type="hidden" value="tmi_skin15"></div>
				<div class='theme tmi_skin16' id='theme16'><input type="hidden" value="tmi_skin16"></div>
				<div class='theme tmi_skin17' id='theme17'><input type="hidden" value="tmi_skin17"></div>
				<div class='theme tmi_skin18' id='theme18'><input type="hidden" value="tmi_skin18"></div>
				<div class='theme tmi_skin19' id='theme19'><input type="hidden" value="tmi_skin19"></div>
				<div class='theme tmi_skin20' id='theme20'><input type="hidden" value="tmi_skin20"></div>
			</div>
			<div>
				아이디 <input type="text" name="id" value="${dto.id}" readonly />
			</div>
			<div>
				이름<input type="text" name="name" value="${dto.name}" />
			</div>
			<input type="submit" value="변경하기">
		</form>
		<div>
	<div>
	프로젝트 완료 목록
	</div>
	<div>
	<c:choose>
	<c:when test="${empty pdto}">
	프로젝트 완료 목록이없습니다.
	</c:when>
	
	<c:otherwise>
	<span>프로젝트이름</span> <span>매니저이름</span><span>종료일</span>
	<c:forEach items="${pdto}" var="pdto">
		<div class="project_success"><input type="hidden" id="pro_id_success" name="pro_id" value="${pdto.pro_id}"><span>${pdto.pro_name }</span>
		 <span class="pro_mgr">${pdto.pro_mgr }</span><span>${pdto.pro_rend}</span></div><input type="button" class="projectDelete" value="삭제"/>
		 
	</c:forEach>
	</c:otherwise>
	</c:choose>
	
	
	</div>
	
	
	</div>
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
	
	
	</div>
</body>
</html>