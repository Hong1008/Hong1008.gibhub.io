<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %> 
<!DOCTYPE html>
<html>
<head>
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%-- <security:authorize access="isAuthenticated()" >

		<security:authentication property="principal.bNick" var="nick"/>  --%>

	

	<!-- 웹 소켓 사용해서 현재 몇개의 쪽지가 도착했는지 구해오기. --> 

    <script type="text/javascript">
$(document).ready(function(){
	
	 var sessionUId = "<%=session.getAttribute("id") %>";
		websocket = new WebSocket("ws://localhost:8090/tmi/count");
	if(sessionUId!=null)
		{
		
		websocket.onopen = onOpen;
		websocket.onmessage = onMessage;
	
		
		}
	

	
	$("#pro-form").submit(function(){
		
		alert("asdf");
		if($(this).children('#pro_start').val()=='' || $(this).children('#pro_end').val()==''){
			swal("Warning", "날짜를 지정해주세요","error");
			return false;
		}
		
		var res=sessionUId+",";
		$("input[name='pro_team_list']").each(function(i,v){
	    
			alert(v);
			var l=$(this).length-1;
			if(i!=l)
				{
				res+=$(v).val()+",";
				}
			else
				{
				res+=$(v).val();
				}
		
			
					})
		
					websocket.send(res);
		  console.log("찍히나");
		  console.log(res);
		websocket.onmessage = onMessage;

	
   })

    function onOpen(evt) 

    {
       //로그인되면 session에있는 아이디 클라이언트로보냄
       websocket.send(sessionUId);

    }

    function onMessage(evt) {

    		$('#header_notiCount').append(evt.data);

    }

    function onError(evt) {

    }

})
   
 
   
   
    		

    

        </script>


<%-- </security:authorize> --%>


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
    <div id='header' class='tmi_skin tmi_skin1'>
        <div id="header_content" class='center_box'>
			<c:set var="URI" value="${pageContext.request.requestURI}" />
			<c:set var="hiddenURI" value="/tmi/WEB-INF/common/Home_logIn.jsp" />
		
        	<c:if test="${fn:trim(URI)!=hiddenURI && not empty sessionScope.id && sessionScope.grade ==1}" var="res">
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
       			</select>
       			
       			
       			 </div>	
       		</c:if>
            <span id="header_logo" class='center_box no-drag gotoHome'>TMI</span>
            <div id='header_log' class= 'no-drag'>
                <button id='header_sign_up_mypage' class=''></button>
                <button id='header_notification' class=''></button>
                <span id="header_notiCount"></span>				
                <button id='header_sign_in_out' class=''></button>
                <div id='header_notiNum'></div>
            </div>
        </div>        
    </div>
</body>
</html>

