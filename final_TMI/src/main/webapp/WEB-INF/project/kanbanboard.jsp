<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href='../css/project_schedule.css' type='text/css' rel='stylesheet'>
<script src="../js/project_addSchedule.js" type='text/javascript'></script>
<body>
	<div class="schedules">
		<div class="s_name tmi_skin tmi_skin01">1팀업무</div>
		<div class="todo">
			<p class='todo_name'>칸반보드만들기</p>
			<p class='todo_end'>D</p>
			-89
			<p class='todo_mem'>홍철민</p>
		</div>

		<div class="todo">
			<p class='todo_name'>칸반보드만들기</p>
			<p class='todo_end'>D</p>
			-1
			<p class='todo_mem'>홍철민</p>
		</div>

		<div class="addTodo">
			<div id='addTcon'>
				할일을<br>추가하세요
				<div id='openTModal' class='  tmi_skin tmi_skin01'>
					<a href="#t-form" rel="modal:open">
					<div class='circle'>
						<div class='h   tmi_skin tmi_skin01'></div>
						<div class='v   tmi_skin tmi_skin01' ></div>
					</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="schedules">
		<div class="s_name tmi_skin tmi_skin01">2팀업무</div>
		<div class="todo">
			<p class='todo_name'>칸반보드만들기</p>
			<p class='todo_end'>D</p>
			-7
			<p class='todo_mem'>홍철민</p>
		</div>

		<div class="addTodo">
			<div id='addTcon'>
				할일을<br>추가하세요
				<div id='openTModal' class=' tmi_skin tmi_skin01'>
					<div class='circle'>
						<div class='h tmi_skin tmi_skin01'></div>
						<div class='v tmi_skin tmi_skin01'></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="schedules">
		<div class="s_name tmi_skin tmi_skin01">3팀업무</div>
		<div class="todo">
			<p class='todo_name'>칸반보드만들기</p>
			<p class='todo_end'>D</p>
			-3
			<p class='todo_mem'>홍철민</p>
		</div>
		<div class="todo">
			<p class='todo_name'>칸반보드만들기</p>
			<p class='todo_end'>D</p>
			-3
			<p class='todo_mem'>홍철민</p>
		</div>
		<div class="todo">
			<p class='todo_name'>칸반보드만들기</p>
			<p class='todo_end'>D</p>
			-4
			<p class='todo_mem'>홍철민</p>
		</div>
		<div class="todo">
			<p class='todo_name'>칸반보드만들기</p>
			<p class='todo_end'>D</p>
			-5
			<p class='todo_mem'>홍철민</p>
		</div>

		<div class="addTodo">
			<div id='addTcon'>
				할일을<br>추가하세요
				<div id='openTModal' class='  tmi_skin tmi_skin01'>
					<div class='circle '>
						<div class='h  tmi_skin tmi_skin01'></div>
						<div class='v  tmi_skin tmi_skin01'></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="addSchedules">
		<div id='addScon'>
			스케쥴을<br>추가하세요
			
			<div id='openSModal' class=' tmi_skin tmi_skin01'>
			<a href="#sch-form" rel="modal:open">
				<div class='circle'>
					<div class='h  tmi_skin tmi_skin01'></div>
					<div class='v  tmi_skin tmi_skin01'></div>
				</div>
				</a>
			</div>
		</div>
	</div>
	
	<form id="sch-form" class="modal" action="project/insertProject">
				<label for="sch_name">스케줄 제목</label> 
				<input type="text" required="required"  id="sch_name" name="sch_name" placeholder="스케줄 제목">
				<label for="sch_info">스케줄 간단설명</label> 
				<input type="text" required="required"  id="sch_info" name="sch_info" placeholder="스케줄 간단설명">
				<label for="sch_start">스케줄 기간</label> 
				<input type="text" readonly="readonly" class="start" required="required" id="sch_start" name="sch_start" placeholder="스케줄 시작일">
				<input type="text" readonly="readonly" class="end" required="required" id="sch_end" name="sch_end" placeholder="스케줄 종료일">
				<ul>
					<c:forEach items="${ptList }" var="i">
						<li>${i.id }</li>
					</c:forEach>
				</ul>				
				<input type="submit" value="스케줄 추가">
	</form>
	<form id="t-form" class="modal" action="project/insertProject">
				<label for="t_name">할일 제목</label> 
				<input type="text" required="required"  id="t_name" name="t_name" placeholder="할일 제목">
				<!-- <label for="t_info">프로젝트 간단설명</label> 
				<input type="text" required="required"  id="t_info" name="t_info" placeholder="프로젝트 간단설명"> -->
				<label for="t_start">할일 기간</label> 
				<input type="text" readonly="readonly" class="start" required="required" id="t_start" name="t_start" placeholder="할일 시작일">
				<input type="text" readonly="readonly" class="end" required="required" id="t_end" name="t_end" placeholder="할일 종료일">
				<ul>
					<c:forEach items="${stList }" var="i">
						<li>${i.id }</li>
					</c:forEach>
				</ul>
				
				<input type="submit" value="할일 추가">
	</form>
	<script type="text/javascript">
	
	//스케줄 시작일 종료일****************************************
    var sch_start =  document.getElementById('sch_start');
	var sch_end = document.getElementById("sch_end");
	
	$.ajax({
		url : 'proSelect',
		method : "POST",
		success : function(res) {
			const schPicker = new Lightpick({
				field: sch_start,
			    secondField: sch_end,
				singleDate: false,
				format:'YY/MM/DD',
				repick: true,
				minDate: new Date(res.pro_start),
			    maxDate: new Date(res.pro_end),
				onSelect: function(start, end){
					
				}
			});
		}
	})
	
	
	</script>
</body>