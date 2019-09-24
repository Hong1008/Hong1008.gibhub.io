<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
.group {
	width: 220px;
	height: 700px;
	background: black;
	margin-right: 30px;
	float: left;
	border-radius: 21px 21px 0px 0px;
}

#sch_info{
	width: 420px;
	height: 700px;
	background: green;
	float:left;
}

.g_head{
	height: 50px;
	background: red;
	border-radius: 21px 21px 0px 0px;
}

.sch_todo{
	height:40px;
	background: blue;
	margin-bottom: 3px;
	transition: .52s;
}
.sch_todo:hover, .clicked{
	height: 140px;
}

#sch_wrap {
	width: 1600px;
	padding-left: 70px;
	margin-top: -50px;
}

#returnBtn {
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>
	<button id='returnBtn'>뒤로가기</button>
	<div id='sch_wrap'>
		<div class='group' id='before'>
			<div class='g_head'></div>
			<div class='sch_todo'></div>
			<div class='sch_todo'></div>
			<div class='sch_todo'></div>
			<div class='sch_todo'></div>
			<div class='sch_todo'></div>
		</div>
		<div class='group' id='progress'>
			<div class='g_head'></div>
		</div>
		<div class='group' id='overtime'>
			<div class='g_head'></div>
		</div>
		<div class='group' id='after'>
			<div class='g_head'></div>
		</div>
		
		<div id= 'sch_info'>
		
		</div>
	</div>
</body>
<script type="text/javascript">
	$('#returnBtn').click(function() {
		window.location.href = 'management';
	})
	
	$('.sch_todo').on('click',function(){
		$('.sch_todo').removeClass('clicked');
		$(this).addClass('clicked');
	});
	
</script>
</html>