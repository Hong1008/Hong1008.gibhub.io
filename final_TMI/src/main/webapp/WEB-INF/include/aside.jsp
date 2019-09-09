<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	position: absolute;
	width: 100%;
	height: 100%;
}

#aside {
	float: left;
	width: 70px;
	height: 100%;
	background-size: 2000%;
}

#aside .list .interval{
margin-top: 30px;
margin-left: 15px;
width:40px;
height:40px;
}

 #aside #guideBox{
display:none;
left: 120%;
    position: absolute;
white-space: nowrap;
color:white;
 transition: all 0.7s ease-out;
} 
.arrow_box {
	position: relative;
	background: #823c61;;
}
.arrow_box:after {
	right: 100%;
	top: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(0, 0, 0, 0);
	border-right-color: #823c61;;
	border-width: 8px;
	margin-top: -8px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('.interval').hover(function(){
		var h=$(this).offset().top-65;
		$('#guideBox').css({'display':'block','top':h});
		$('#guideBox').text($(this).attr('name'));
	})
	 $('.interval').mouseout(function(){
		$('#guideBox').css('display','none');
	}) 
})
</script>
</head>
<body>
	<div id="aside"  class='tmi_skin tmi_skin01' >
	<div class="list">
	<a href="#"><img src="resources/asideimg/chart.png" class="interval" name="대쉬보드"></a>
	<a href="#"><img src="resources/asideimg/calendar.png" class="interval" name="일정"></a>
	<a href="#"><img src="resources/asideimg/folder.png" class="interval" name="프로젝트?"></a>
	<a href="#"><img src="resources/asideimg/group.png" class="interval" name="맴버"></a>
	<a href="#"><img src="resources/asideimg/chat.png" class="interval" name="채팅"></a>
	</div>
	<div id="guideBox"  class="arrow_box">
	</div>
	</div>
</body>
</html>
