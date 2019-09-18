<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<!-- 달력 플러그인 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment-with-locales.min.js"></script>
<script src="/tmi/js/lightpick.js"></script>
<link href='/tmi/css/lightpick.css' type='text/css' rel='stylesheet'>

<!-------------------------------------- js,css연결 -------------------------------------->
<script src="/tmi/js/header.js" type='text/javascript'></script> 
<link href='/tmi/css/header.css' type='text/css' rel='stylesheet' >
<script src="/tmi/js/COMMON.js" type='text/javascript'></script> 
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet' >
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap" rel="stylesheet">
</head>

<body>
<input type="hidden" id="sessionId" value="${sessionScope.id }" >
<input type="hidden" id="sessionproId" value="${sessionScope.pro_id }" >
<input type="hidden" id="sessionproIdList" value="${sessionScope.projectHomeList }" >
    <div id='header' class='tmi_skin tmi_skin01'>
        <div id="header_content" class='center_box'>
			<c:set var="URI" value="${pageContext.request.requestURI}" />
			<c:set var="hiddenURI" value="/tmi/WEB-INF/common/Home_logIn.jsp" />
        	<c:if test="${fn:trim(URI)!=hiddenURI && not empty sessionScope.id }" var="res">
        		<div class="center">
       			<select id="proIdList" class="custom-select sources" placeholder="프로젝트 변경">
    	   			<c:forEach items="${sessionScope.projectHomeList }" var="i">
    	   				<c:choose>
    	   					<c:when test="${sessionScope.pro_id == i.pro_id }">
    	   						<option class="pro_id selected"  value="${i.pro_id }">${i.pro_name }</option>
    	   					</c:when>
    	   					<c:otherwise>
    	   						<option class="pro_id" value="${i.pro_id }">${i.pro_name }</option>
    	   					</c:otherwise>
    	   				</c:choose>
    	   				
       				</c:forEach>
       			</select> </div>	
       		</c:if>
            <span id="header_logo" class='center_box no-drag gotoHome'>TMI</span>
            <div id='header_log'>
                <button id='header_sign_up'>Sign up</button>
                <button id='header_sign_in_out'>Sign in</button>
                <a href="" id="header_account">
                	<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 56 56" style="enable-background:new 0 0 56 56;" xml:space="preserve">
<g>
	<path d="M28,0C12.561,0,0,12.561,0,28s12.561,28,28,28s28-12.561,28-28S43.439,0,28,0z M28,54C13.663,54,2,42.336,2,28
		S13.663,2,28,2s26,11.664,26,26S42.337,54,28,54z"/>
	<path d="M40,16H16c-0.553,0-1,0.448-1,1s0.447,1,1,1h24c0.553,0,1-0.448,1-1S40.553,16,40,16z"/>
	<path d="M40,27H16c-0.553,0-1,0.448-1,1s0.447,1,1,1h24c0.553,0,1-0.448,1-1S40.553,27,40,27z"/>
	<path d="M40,38H16c-0.553,0-1,0.448-1,1s0.447,1,1,1h24c0.553,0,1-0.448,1-1S40.553,38,40,38z"/>
</g>
</svg>
                </a>
                <button id="header_sign_out">Sign out</button>
            </div>
        </div>        
    </div>
</body>
</html>