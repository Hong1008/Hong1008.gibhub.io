<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href='../plugin/jquery-ui.min.css' type='text/css'
	rel='stylesheet'>
<style type="text/css">
.group {
	width: 220px;
	height: 700px;
	background: black;
	margin-right: 30px;
	float: left;
	border-radius: 21px 21px 0px 0px;
}

#sch_info {
	width: 420px;
	height: 700px;
	background: green;
	float: left;
}

.g_head {
	height: 50px;
	background: red;
	border-radius: 21px 21px 0px 0px;
}

.sch_todo {
	height: 40px;
	background: blue;
	height: 22px;
	background: blue;
	overflow: hidden;
	margin: 0 5px 4px 5px;
	padding: 5px;
	font-size: 15px;
	cursor: pointer;
}

.ui-sortable-helper{
	cursor: grabbing ;
}

.clicked {
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

.ui-draggable-dragging {
	transition: 0s !important;
}

#sortable1, #sortable2, #sortable3, #sortable4 {
	width: 100%;
	height: 100%;
	list-style-type: none;
	margin: 0;
	padding: 5px 0 0 0;
	float: left;
	margin-right: 10px;
	height: 100%;
}
</style>
<script>
	
</script>
</head>
<body>
	<button id='returnBtn'>뒤로가기</button>
	<div id='sch_wrap'>
		<div class='group' id='before'>
			<div class='g_head'></div>
			<ul id="sortable1" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="a">
					<li class='sch_todo'>${a.t_name}</li>
				</c:forEach>
			</ul>
		</div>
		<div class='group' id='progress'>
			<div class='g_head'></div>
			<ul id="sortable2" class="connectedSortable">
			</ul>
		</div>
		<div class='group' id='overtime'>
			<div class='g_head'></div>
			<ul id="sortable3" class="connectedSortable">
			</ul>
		</div>
		<div class='group' id='after'>
			<div class='g_head'></div>
			<ul id="sortable4" class="connectedSortable">
			</ul>
		</div>
		<div id='sch_info'></div>
	</div>
</body>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$('#returnBtn').click(function() {
		window.location.href = 'management';
	})

	$('.sch_todo').on('click', function() {
		if ($(this).hasClass('clicked')) {
			$(this).removeClass('clicked');
		} else {
			$('.sch_todo').removeClass('clicked');
			$(this).addClass('clicked');
		}
	})

	$(function() {
		$(".group").droppable({
			accept : ".clicked",
			drop : function(event, ui) {
				$(this).css('background', 'white');
			}
		});

		$("#sortable1, #sortable2, #sortable3, #sortable4").sortable({
			connectWith : ".connectedSortable"
		}).disableSelection();
	});
</script>
</html>