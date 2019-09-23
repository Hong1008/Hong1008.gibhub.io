<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href='../plugin/core/main.css' rel='stylesheet' />
<link href='../plugin/daygrid/main.css' rel='stylesheet' />

<script src='../plugin/core/main.js'></script>
<script src='../plugin/core/locales/ko.js'></script>
<script src='../plugin/daygrid/main.js'></script>
<script src="https://unpkg.com/popper.js@1"></script>
<script src="https://unpkg.com/tippy.js@4"></script>
<!-------------------------------------- js,css연결 -------------------------------------->
<script src="../js/project_calender.js" type='text/javascript'></script>
<link href='../css/project_calender.css' type='text/css'
	rel='stylesheet'>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap"
	rel="stylesheet">
<div class='filterBox'>
	<label class="container">프로젝트 <input type="checkbox"
		class="filterType" value="p" checked="checked"> <span
		class="checkmark"></span>
	</label> <label class="container">스케줄 <input type="checkbox"
		class="filterType" value="s" checked="checked"> <span
		class="checkmark"></span>
	</label> <label class="container">할일 <input type="checkbox"
		class="filterType" value="t" checked="checked"> <span
		class="checkmark"></span>
	</label>
</div>


<div id='calendar'></div>

<script>
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins : [ 'dayGrid' ],
		locale: 'ko',
		eventLimit: true, // for all non-TimeGrid views
		views: {
		  timeGrid: {
		    eventLimit: 4 // adjust to 6 only for timeGridWeek/timeGridDay
		  }
		},
		eventRender: function(info){
			tippy(info.el, {
				animation: 'scale',
				  duration: 0,
				  arrow: true,
				  content: info.event.extendedProps.description
				})
			return filter(info);
		},
		eventMouseEnter: function(info){
			$(info.el).css("cursor",'pointer');
		}
		  
	});
	$.ajax({
		url : 'calendarPro',
		method : "POST",
		success : function(res) {
			$(res).each(function(i, v) {
				calendar.addEvent({
					id : 'p'+i,
					type : 'p',
					title : v.pro_name,
					start : v.pro_start,
					end : v.pro_end,
					description: v.pro_info,
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
					type : 's',
					title : v.sch_name,
					start : v.sch_start,
					end : v.sch_end,
					description: v.sch_info,
					backgroundColor : '#c471ed'
				});		
				$(v.todoList).each(function(j,val){
					calendar.addEvent({
						id : 't'+j,
						type : 't',
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
	function filter(info){
		var type = $('input:checkbox.filterType:checked').map(function () {
			return $(this).val();
		}).get();
		return type.indexOf(info.event.extendedProps.type)>=0;
	}
	$('.filterType').on('click', function(){
		calendar.rerenderEvents();
	})
</script>