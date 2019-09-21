<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href='../css/project_schedule.css' type='text/css' rel='stylesheet'>
<script src="../js/project_addSchedule.js" type='text/javascript'></script>
<body>
<div id="kanban_wrap">
		<c:choose>
			<c:when test="${not empty schList }">
				<c:forEach items="${schList }" var="sdto">
					<div class="schedules">
						<div class="s_name tmi_skin tmi_skin01">${sdto.sch_name }</div>
						<c:choose>
						<c:when test="${not empty sdto.todoList }">
						<c:forEach items="${sdto.todoList }" var="tdDto">
							<div class="todo">
								<p class='todo_name'>${tdDto.t_name }</p>
								<p class='todo_end'>D</p>
								- ${tdDto.t_end }
								<p class='todo_mem'>${tdDto.id }</p>
							</div>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="todo">
								<p class='todo_name' >할일이 없습니다</p>
								<span style="font-size: 15px;">스케줄 리더가 할일을 추가해주세요</span>
							</div>
						</c:otherwise>
						</c:choose>
						<c:if test="${sdto.sch_mgr==sessionScope.id }">
							<div class="addTodo">
								<div id='addTcon'>
									할일을<br>추가하세요
									<div id='openTModal' class='tmi_skin tmi_skin01'>
										<a href="#${sdto.sch_id }" rel="modal:open" class="td_insert">
											<input type="hidden" id="sch_start"
											value="<c:out value="${sdto.sch_start}"></c:out>"> <input
											type="hidden" id="sch_end"
											value="<c:out value="${sdto.sch_end}"></c:out>">
											<div class='circle'>
												<div class='h   tmi_skin tmi_skin01'></div>
												<div class='v   tmi_skin tmi_skin01'></div>
											</div>
										</a>
									</div>
								</div>
							</div>
						</c:if>
					</div>
					<form id="${sdto.sch_id }" class="modal" action="insertTodo">
						<input type="hidden" name="sch_id" value="${sdto.sch_id }">
						<label for="t_name">할일 제목</label> <input type="text"
							required="required" id="t_name" name="t_name" placeholder="할일 제목">
						<!-- <label for="t_info">프로젝트 간단설명</label> 
				<input type="text" required="required"  id="t_info" name="t_info" placeholder="프로젝트 간단설명"> -->
						<label for="t_start">할일 기간</label> <input type="text"
							readonly="readonly" class="start" required="required"
							id="t_start" name="t_start" placeholder="할일 시작일"> <input
							type="text" readonly="readonly" class="end" required="required"
							id="t_end" name="t_end" placeholder="할일 종료일">
						<ul class="table-list" id="id">


						</ul>
						<ul class="team-list" id="stList">
							<c:forEach items="${stList }" var="i">
								<c:if test="${sdto.sch_id == i.sch_id }">
									<li class="team-list-item">${i.id }</li>
								</c:if>
							</c:forEach>
						</ul>

						<input type="submit" value="할일 추가">
					</form>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="schedules">
						<div class="s_name tmi_skin tmi_skin01">스케줄이 없습니다</div>
						<div class="todo" style="font-size: 16px;">
								<span>프로젝트 팀장이 스케줄을 추가해주세요</span>
						</div>
					</div>
			</c:otherwise>
		</c:choose>
		<c:forEach items="${ptList }" var="i">
		<c:if test="${i.id == sessionScope.id && i.pt_level == 1 }">
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
		</c:if>
		</c:forEach>
	</div>
</div>

	<form id="sch-form" class="modal" action="insertSchedule">
				<label for="sch_name">스케줄 제목</label> 
				<input type="text" required="required" autocomplete="off" id="sch_name" name="sch_name" placeholder="스케줄 제목">
				<label for="sch_info">스케줄 간단설명</label> 
				<input type="text" required="required" autocomplete="off" id="sch_info" name="sch_info" placeholder="스케줄 간단설명">
				<label for="sch_start">스케줄 기간</label> 
				<input type="text" readonly="readonly" class="start" required="required" id="sch_start" name="sch_start" placeholder="스케줄 시작일">
				<input type="text" readonly="readonly" class="end" required="required" id="sch_end" name="sch_end" placeholder="스케줄 종료일">
				<ul class="table-list" id="sch_team_list">
					
				</ul>
				<p class="teamExp" id="leader">스케줄 리더을 정해주세요</p>
				<ul class="team-list" id="ptList">
					<c:forEach items="${ptList }" var="i">
						<li class="team-list-item">${i.id }</li>
					</c:forEach>
				</ul>				
				<input type="submit" value="스케줄 추가">
	</form>
	
	<script type="text/javascript">
	
	
	</script>
</body>
