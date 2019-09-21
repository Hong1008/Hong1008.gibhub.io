<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-------------------------------------- js,css연결 -------------------------------------->
<script src="/tmi/js/home.js" type='text/javascript'></script>
<link href='/tmi/css/homeLogin.css' type='text/css' rel='stylesheet'>

<!---------------------------------------- 헤더 연결 ---------------------------------------->
<jsp:include page="../include/Header.jsp"></jsp:include>
<title>세계의 모든일 Task Universe</title>
</head>
<body>
	<div id='bodywrap'>
		<div id="pro_div">
			<div id="pro_list">
                	<div class="pro_list_per no-drag">진행률</div>
                	<div class="pro_list_man no-drag">프로젝트 매니저</div>
                	<div class="pro_list_dday no-drag">남은시간</div>
                	<div class="pro_list_end no-drag">종료일</div>
            </div>
            <c:choose>
            	<c:when test="${not empty projectHomeList }">
            		<c:forEach items="${projectHomeList}" var="i">
						<div class='project'>
                			<div class="pro_header">
                    				<div class="pro_name no-drag">${i.pro_name }
                    					<input type="hidden" name="pro_id" id="pro_id" value="${i.pro_id }">
                    				</div>
                			</div>
                			<div class="pro_body">
                				<div class="pro_per no-drag">${i.pro_name }</div>
                				<div class="pro_man no-drag">${i.pro_man }</div>
                				<div class="pro_dday no-drag">${i.pro_dday }</div>
                				<div class="pro_end no-drag">${i.pro_end }</div>
                			</div>
						</div>	
					</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<p>프로젝트를 생성해주세요</p>
            	</c:otherwise>
            </c:choose>            
			<!-- <div class='project'>
                <div class="pro_header">
                    <div class="pro_name no-drag">project01</div>
                </div>
                <div class="pro_body">
                	<div class="pro_per no-drag"><p>74</p>%</div>
                	<div class="pro_man no-drag">홍철민</div>
                	<div class="pro_dday no-drag"><p>27</p>day</div>
                	<div class="pro_end no-drag"><p>10</p>월<p>08</p>일</div>
                </div>
			</div> -->
			<!-- <form action="project/insertProject">
				<input type="submit" value="프로젝트 추가">
				<input type="text" name="pro_name">
				<input type="text" name="pro_info">
				<input type="date" name="pro_start">
				<input type="date" name="pro_end">
			</form> -->
			<form id="pro-form" class="modal" action="project/insertProject">
				<label for="pro_name">프로젝트 제목</label> 
				<input type="text" required="required" autocomplete="off" id="pro_name" name="pro_name" placeholder="프로젝트 제목">
				<label for="pro_info">프로젝트 간단설명</label> 
				<input type="text" required="required" autocomplete="off" id="pro_info" name="pro_info" placeholder="프로젝트 간단설명">
				<label for="pro_start">프로젝트 기간</label> 
				<input type="text" readonly="readonly"  required="required" id="pro_start" name="pro_start" placeholder="프로젝트 시작일">
				<input type="text" readonly="readonly"  required="required" id="pro_end" name="pro_end" placeholder="프로젝트 종료일">
				<label for="search_id">아이디로 팀원들을 찾아보세요</label>
				<ul class="table-list" id="pro_team_list">
					
				</ul>
				<input type="text" id="search_id" >
				<ul id="search_result" hidden="" class="autocomplete-results">
				</ul>
				
				<input type="submit" value="프로젝트 추가">
			</form>

			<a href="#pro-form" class="btn" rel="modal:open">프로젝트 추가</a>
		</div>
	</div>
	
</body>
</html>