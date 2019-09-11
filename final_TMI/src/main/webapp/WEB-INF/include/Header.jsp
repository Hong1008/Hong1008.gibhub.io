<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-------------------------------------- 제이쿼리 연결 -------------------------------------->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-------------------------------------- js,css연결 -------------------------------------->
<!-- <script src="/tmi/js/header.js" type='text/javascript'></script> -->
<link href='/tmi/css/header.css' type='text/css' rel='stylesheet' >
<link href='/tmi/css/COMMON.css' type='text/css' rel='stylesheet' >

<!---------------------------------------- 웹폰트 연결 ---------------------------------------->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,700|Raleway:100,400,700,900|Dancing+Script:400,700&display=swap" rel="stylesheet">

<script type="text/javascript">
$(document).ready(function(){	
	var id=$('#sessionId').val();
	
	
	if(id==null || id=="")
       {
		  $("#header_account").css("display","none");
		  $("#header_sign_out").css("display","none");
       }
	else
		{
		  $('#header_sign_up').css("display","none");
		  $('#header_sign_in_out').css("display","none");
		  $("#header_account").css("display","inline");
		  $("#header_sign_out").css("display","inline");
		}
	
	  
	  
	  $('#header_sign_in_out').on('click',function(){
        $(location).attr("href", "sign_in.do");
    });
    $('#header_sign_up').on('click',function(){
        $(location).attr("href", "sign_up.do");
    });
    $('#header_account').on('click',function(){
        $(location).attr("href", "home");
    });
    $('#header_sign_out').on('click',function(){
        $(location).attr("href", "sign_out");
    });
    
    $("#proIdList").change(function(){
  	  var pro_id = $(this).val();
  	  location.href="management?pro_id="+pro_id;
    })
    
})

</script>
</head>

<body>
<input type="hidden" id="sessionId" value="${sessionScope.id }" >
    <div id='header' class='tmi_skin tmi_skin01'>
        <div id="header_content" class='center_box'>
        	<c:if test="${not empty sessionScope.pro_id }">
       			<select id="proIdList">
    	   			<c:forEach items="${sessionScope.pro_id_list }" var="i">
    	   				<c:choose>
    	   					<c:when test="${sessionScope.pro_id == i }">
    	   						<option class="pro_id" selected="selected">${i }</option>
    	   					</c:when>
    	   					<c:otherwise>
    	   						<option class="pro_id">${i }</option>
    	   					</c:otherwise>
    	   				</c:choose>
    	   				
       				</c:forEach>
       			</select> 	
       		</c:if>
            <span id="header_logo" class='center_box no-drag'>TMI</span>
            <div id='header_log'>
                <button id='header_sign_up'>Sign up</button>
                <button id='header_sign_in_out'>Sign in</button>
                <a href="" id="header_account"><img src="/tmi/resources/common/account.png"/></a>
                <button id="header_sign_out">Sign out</button>
            </div>
        </div>        
    </div>
</body>
</html>