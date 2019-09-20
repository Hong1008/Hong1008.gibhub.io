<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href='../plugin/core/main.css' rel='stylesheet' />
<link href='../plugin/daygrid/main.css' rel='stylesheet' />

<script src='../plugin/core/main.js'></script>
<script src='../plugin/daygrid/main.js'></script>
<!-------------------------------------- js,css연결 -------------------------------------->
<script src="../js/project_calender.js" type='text/javascript'></script>
<link href='../css/project_calender.css' type='text/css'
	rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">


<div id='calendar'></div>

<script>
	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins : [ 'dayGrid' ],
	});
	$.ajax({
		url : 'calendarPro',
		method : "POST",
		success : function(res) {
			$(res).each(function(i, v) {
				calendar.addEvent({
					id : 'p'+i,
					title : v.pro_name,
					start : v.pro_start,
					end : v.pro_end,
					backgroundColor : '#12c2e9'
				});				
			})
		}
	})
	$.ajax({
		url : 'calendarSchTd',
		method : "POST",
		success : function(res) {
			$(res).each(function(i, v) {
				calendar.addEvent({
					id : 's'+i,
					title : v.sch_name,
					start : v.sch_start,
					end : v.sch_end,
					backgroundColor : '#c471ed'
				});		
				$(v.todoList).each(function(j,val){
					calendar.addEvent({
						id : 't'+j,
						title : val.t_name,
						start : val.t_start,
						end : val.t_end,
						backgroundColor : '#f64f59'
					});	
				})
			})
		}
	})

	calendar.render();
</script>