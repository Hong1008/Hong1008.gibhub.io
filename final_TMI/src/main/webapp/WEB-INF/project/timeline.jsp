<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="../js/project_timeline.js" type='text/javascript'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<body>
 	<div id='timeline_wrap'>
	<div class='timelines_head'>
		<div class='time_head'>
			<span>분류</span>
		</div>
		<div class='time_body'>
			<span class='time_name'>내용</span>
		</div>
	</div>

	<c:forEach items="${timelineList }" var="tdto">
		<div class='timelines' id='time_${tdto.tl_id }'>
			<div class='time_head'>
				<span class='${tdto.tl_type } ${tdto.tl_info }'></span>
			</div>
			<div class='time_body'>
				<span class='time_content ${tdto.tl_type }'></span>&nbsp; <span
					class='time_content ' >${tdto.tl_content }</span>이(가)&nbsp; <span
					class='time_result ${tdto.tl_info }'></span>되었습니다.&nbsp;
			</div>
		</div>
	</c:forEach>
	</div>
</body>