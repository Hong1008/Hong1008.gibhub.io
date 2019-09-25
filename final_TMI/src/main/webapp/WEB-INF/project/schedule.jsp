<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href='../plugin/jquery-ui.min.css' type='text/css'
	rel='stylesheet'>
<style type="text/css">
.group {
	    width: 255px;
    height: 700px;
    background: #fefefe;
    margin-right: 25px;
    float: left;
    border-radius: 21px 21px 0px 0px;
    border: 1px solid #d4d4d4;
}

.g_head {
	height: 37px;
    border-radius: 21px 21px 0px 0px;
    color: #fcfcfc;
    text-align: center;
    padding-top: 13px;
    font-size: 20px;
}

.sch_todo {
	height: 16px;
    background: #fefefe;
    overflow: hidden;
    margin: 0 5px 4px 5px;
    padding: 5px;
    font-size: 14px;
    cursor: pointer;
    border-bottom: 1px solid #a9a0a0;
    width: 213px;
    margin: 0 auto;
    margin-top: 8px;
	transition: 0.6s;
}

.ui-sortable-helper {
	cursor: grabbing;
	transition: 0s !important;
}

.clicked {
	height: 140px;
    border: 1px solid #ccc8c8;
    color: #0c0c0c;
    font-size: 14px;
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



#sch_info {
	width: 420px;
	height: 676px;
    background: white;
    border: 1px solid #d4d4d4;
    float: left;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    text-align: center;
    padding-top: 24px;
}

#sch_info_top >div{
    padding-top: 18px;
    border-bottom: 1px solid #ccc8c8;
    width: 370px;
    margin: 0 auto;
    margin-bottom: 4px;
    padding-bottom: 10px;
}

#sch_info_name{
    font-weight: 400;
    font-size: 21px !important;
}

#sch_info_dis{
}

#sch_info_start{
}

#sch_info_end{
}

#sch_info_mem{
	height: 30px;
    font-size: 22px;
    border-bottom: #ccc8c8 1px dotted;
    padding-bottom: 8px;
    width: 370px;
    margin: 0 auto;
}

#sch_info_top{
height: 317px;
}

.sch_mem_img_wrap{
	margin-top: 30px;
    margin-left: 29px;
}

.sch_mem_img{
	width: 90px;
    height: 90px;
    margin-right: 23px;
    margin-top: 10px;
    background: #e0d5d5;
    float: left;
    border-radius: 45px;
}

#sch_info div span{
	color: #1f1e1e;
    float: left;
    margin-left: 3px;
    width: 111px;
    font-weight: 100;
    font-size: 17px;	
}


#sch_info_endBtn{
    width: 392px;
    height: 65px;
    border: 1px solid #c7c7c799;
    color: white;
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 100;
    font-size: 23px;
    cursor: pointer;
    margin-top: 21px;

}

p{
	display: inline-block;
    width: 240px;
    border-left: 1px solid #d4d1d1;
    padding-left: 10px;
}

.sch_todo_name{
	border-bottom: 1px solid #ccc8c8;
    width: 203px;
    display: inline-block;
    padding-bottom: 5px;
    margin-bottom: 18px;
    font-size: 15px;
    font-weight: 400;
}

.sch_todo_label{
	border-right: 1px solid #ccc8c8;
    height: 18px;
    display: inline-block;
    padding-top: 0px;
    padding-right: 4px;
    font-weight: 100;
    margin-right: 5px;
    font-size: 13px;
}

.sch_todo_body{
	border-bottom: 1px solid #ccc8c8;
    padding-bottom: 4px;
    margin-top: 8px;
    width: 203px;
}

.sch_todo_body_end{
	border-bottom: none;
}

.sch_todo_for{
	text-align: center;
    display: inline-block;
    width: 137px;
}

#before .g_head{
background-size: 400%;
}

#progress .g_head{
background-size: 400%;
    background-position-x: 33%;
}

#overtime .g_head{
    background-size: 400%;
    background-position-x: 66%;
}

#after .g_head{
background-size: 400%;
    background-position-x: 100%;
}
</style>
<script>
	
</script>
</head>
<body>
	<button id='returnBtn'>뒤로가기</button>
	<div id='sch_wrap'>
		<div class='group' id='before'>
			<div class='g_head tmi_skin tmi_skin1'>시작전</div>
			<ul id="sortable1" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="tdDto">
					<c:if
						test="${tdDto.t_end>0 && tdDto.t_start>0 && empty tdDto.t_rend}">
						<li class='sch_todo' id="${tdDto.t_id }"><span class = 'sch_todo_name'>${tdDto.t_name}</span><br>
						<div class='sch_todo_body'><span class='sch_todo_label'>담당인원</span><span class='sch_todo_for'>${tdDto.id}</span></div>						
						<div class='sch_todo_body'><span class='sch_todo_label'>시작까지</span><span class='sch_todo_for'>${tdDto.t_start}</span></div>	
						<div class='sch_todo_body sch_todo_body_end'><span class='sch_todo_label'>종료까지</span><span class='sch_todo_for'> ${tdDto.t_end}</span></div>	
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class='group' id='progress'>
			<div class='g_head tmi_skin tmi_skin1'>진행중</div>
			<ul id="sortable2" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="tdDto">
					<c:if
						test="${tdDto.t_end>0 && tdDto.t_start<=0 && empty tdDto.t_rend}">
						<li class='sch_todo' id="${tdDto.t_id }"><span class = 'sch_todo_name'>${tdDto.t_name}</span><br>
						<div class='sch_todo_body'><span class='sch_todo_label'>담당인원</span><span class='sch_todo_for'>${tdDto.id}</span></div>						
						<div class='sch_todo_body'><span class='sch_todo_label'>시작까지</span><span class='sch_todo_for'>${tdDto.t_start}</span></div>	
						<div class='sch_todo_body sch_todo_body_end'><span class='sch_todo_label'>종료까지</span><span class='sch_todo_for'> ${tdDto.t_end}</span></div>	
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class='group' id='overtime'>
			<div class='g_head tmi_skin tmi_skin1'>기한초과</div>
			<ul id="sortable3" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="tdDto">
					<c:if
						test="${tdDto.t_end<=0 && tdDto.t_start<=0 && empty tdDto.t_rend}">
						<li class='sch_todo' id="${tdDto.t_id }"><span class = 'sch_todo_name'>${tdDto.t_name}</span><br>
						<div class='sch_todo_body'><span class='sch_todo_label'>담당인원</span><span class='sch_todo_for'>${tdDto.id}</span></div>						
						<div class='sch_todo_body'><span class='sch_todo_label'>시작까지</span><span class='sch_todo_for'>${tdDto.t_start}</span></div>	
						<div class='sch_todo_body sch_todo_body_end'><span class='sch_todo_label'>종료까지</span><span class='sch_todo_for'> ${tdDto.t_end}</span></div>	
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div class='group' id='after'>
			<div class='g_head tmi_skin tmi_skin1'>종료됨</div>
			<ul id="sortable4" class="connectedSortable">
				<c:forEach items="${schOne.todoList }" var="tdDto">
					<c:if test="${not empty tdDto.t_rend}">
						<li class='sch_todo' id="${tdDto.t_id }"><span class = 'sch_todo_name'>${tdDto.t_name}</span><br>
						<div class='sch_todo_body'><span class='sch_todo_label'>담당인원</span><span class='sch_todo_for'>${tdDto.id}</span></div>						
						<div class='sch_todo_body'><span class='sch_todo_label'>시작까지</span><span class='sch_todo_for'>${tdDto.t_start}</span></div>	
						<div class='sch_todo_body sch_todo_body_end'><span class='sch_todo_label'>종료까지</span><span class='sch_todo_for'> ${tdDto.t_end}</span></div>	
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<div id='sch_info'>
		<div id='sch_info_top'>
			<div id='sch_info_name'>
				<span>스케쥴</span><p>${schOne.sch_name }</p></div>
			<div id='sch_info_dis'>
				<span>설명</span><p>${schOne.sch_info }</p></div>
			<div id='sch_info_start'>
				<span>시작일</span><%-- ${schOne.sch_start } --%><p>2019-09-27</p></div>
				<div id='sch_info_end'>			
				<span>종료예정일</span><%-- ${schOne.sch_end} --%><p>일2019-09-28</p></div>
			</div>
		<div id='sch_info_bottom'>
		<div id='sch_info_mem'>
				<div>팀원</div>
				<div class='sch_mem_img_wrap'>
					<div class='sch_mem_img'></div>
					<div class='sch_mem_img'></div>
					<div class='sch_mem_img'></div>
					<div class='sch_mem_img'></div>
					<div class='sch_mem_img'></div>
				</div>
		</div>
			</div>
			<button id='sch_info_endBtn' class='tmi_skin tmi_skin1'>스케쥴 끝내기</button>
		</div>
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

		/* $("#sortable1, #sortable2, #sortable3, #sortable4").sortable({
			connectWith : ".connectedSortable",
			change: function(event, ui){
				
			}
		}).disableSelection(); */
		$("#sortable1").sortable({
			connectWith : "#sortable2"
		}).disableSelection();
		$("#sortable2").sortable({
			connectWith : "#sortable4",
			receive: function(event, ui){
				swal({
					  title: "할일이 진행중인 상태로 바뀝니다",
					  text: "시작일이 현재날짜로 바뀌며 다시 되돌릴 수 없습니다",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal("할일이 진행 중으로 바뀌었습니다", {
					      icon: "success",
					    });
					    $.ajax({
					    	url:'uptTdStart',
					    	data:'t_id='+$(ui.item).attr('id'),
					    	type:'POST'
					    })
					  } else {
						  $( ".connectedSortable" ).sortable( "cancel" );
					  }
					});
			}
		}).disableSelection();
		$("#sortable3").sortable({
			connectWith : "#sortable4",
			receive: function(event, ui){
				
			}
		}).disableSelection();
		$("#sortable4").sortable({
			items: 'cancel',
			receive: function(event, ui){
				swal({
					  title: "할일이 종료됩니다",
					  text: "할일이 종료되며 다시 되돌릴 수 없습니다",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal("할일이 종료 되었습니다", {
					      icon: "success",
					    });
					    $.ajax({
					    	url:'uptTdRend',
					    	data:'t_id='+$(ui.item).attr('id'),
					    	type:'POST'
					    })
					  } else {
						  $( ".connectedSortable" ).sortable( "cancel" );
					  }
					});
			}
		})
	});
</script>
</html>