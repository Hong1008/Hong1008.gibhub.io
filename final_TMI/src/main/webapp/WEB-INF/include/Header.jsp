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
<script>
var socket = null;
var sessionUId = null;
$(document).ready( function() {
    sessionUId="<%=session.getAttribute("id") %>";
    console.log(sessionUId);
if (sessionUId!="null")
	{
	connectWS();
	
	
	}
$(document).on("click","#btn_yes",function(){
	 var pro_id=$(this).prev().val();
	 var invite_id=$(this).prev().prev().val();//초대받은사람
	 var noti_id=$(this).prev().prev().prev().val();//초대보낸사람
	 var pro_name=$(this).prev().prev().prev().prev().val();//프로젝트이름
	 var result;
	$.ajax({

	    url: "notifi_yes", 
	    traditional : true,
	    data: { "id":noti_id , //초대보낸사람
	            	"pro_id":pro_id, //pro_id
	            	"noti_id":sessionUId //받은사람
	            	
	    },               

	    type: "post",                            

	    dataType: "text",
	    success:function(res)
	    {
	    	
	
	    	 
	    	 
	    	 swal("Good job!", "팀에 가입했습니다!", "success")
				.then((value) => {
					socket.send("yes,"+noti_id+","+pro_id+","+sessionUId+","+pro_name);
					location.href="home";
				});
		    	
        }
	 

	}
	  
	)
	
	//socket send해줘야됨 no에도 
	/*
	  1. yes 눌렀을때
	       누른사람 팀에 들어감
	       보낸사람 팀에 들어왔다고알림
	  2. no눌렀을때
	     보낸사람에게 팀 거절했다고알림 
	     
	     3. open 
	      모든거  알려줌
	     
	     4. invite
	     초대 보냄
	*/
	$(this).parent().css("display","none"); 
	
})	

$(document).on("click","#btn_no",function(){
	 var pro_id=$(this).prev().prev().val();
	 var invite_id=$(this).prev().prev().prev().val();//초대받은사람
	 var noti_id=$(this).prev().prev().prev().prev().val();//초대보낸사람
	 var pro_name=$(this).prev().prev().prev().prev().prev().val();//프로젝트이름
	 var result;
	$.ajax({

	    url: "notifi_no", 
	    data: { "id":noti_id , //초대보낸사람
	            	"pro_id":pro_id, //pro_id
	            	"noti_id":sessionUId //받은사람
	            	
	    },               

	    type: "post",                            
	    traditional : true,
	    dataType: "text",
	    success:function(res)
	    {
	    	 swal("Good job!", "거부하였습니다", "success")
				.then((value) => {
					socket.send("no,"+noti_id+","+pro_id+","+sessionUId+","+pro_name);
					location.href="home";
				});
		    	
        }
	 

	}
	  
	)
	
	//socket send해줘야됨 no에도 
	/*
	  1. yes 눌렀을때
	       누른사람 팀에 들어감
	       보낸사람 팀에 들어왔다고알림
	  2. no눌렀을때
	     보낸사람에게 팀 거절했다고알림 
	     
	     3. open 
	      모든거  알려줌
	     
	     4. invite
	     초대 보냄
	*/
	$(this).parent().css("display","none"); 
	
})	

	
$("#pro-form_btn").click(function(){
	
	
	if($(this).children('#pro_start').val()=='' || $(this).children('#pro_end').val()==''){
		swal("Warning", "날짜를 지정해주세요","error");
		return false;
	}

	var pro_team_list_array=new Array();
	if($("input[name='pro_team_list']").val()!=null)
		{
		$("input[name='pro_team_list']").each(function(i,v){

			
			pro_team_list_array.push($(v).val());
		
	      

	})
		}
	
	$.ajax({

	    url: "project/insertProject", 
	    traditional : true,
	    data: { "pro_name": $("#pro_name").val(),
	            	"pro_info":$("#pro_info").val(),
	            	"pro_start":$("#pro_start").val(),
	            	"pro_end":$("#pro_end").val(),
	            	"pro_team_list":pro_team_list_array
	            	
	    
	    },               

	    type: "post",                            

	    dataType: "text",
	    success:function(res)
	    {
	    	
	    	
	    	swal("Good job!", "프로젝트 추가 성공!", "success")
			.then((value) => {
				
				if($("input[name='pro_team_list']").val()!=null)
					{
					$("input[name='pro_team_list']").each(function(i,v){

			    		socket.send("invite,"+$(v).val()+","+res);
			    	
			    })
					}
			
				location.href="home";
			});
	    	
	    	
	    	/* var res=sessionUId+","; */
         }

	})
		
	
	


})
});

function connectWS() {
    console.log("tttttttttttttt")
    var ws = new WebSocket("ws://localhost:8090/tmi/count");
    socket = ws;
	
    ws.onopen = function () {
        console.log('Info: connection opened.');
        ws.send("open,");
    };

    ws.onmessage = function (event) {
      
    	var res = event.data.split(",");	
    	
   	$('#header_notiCount').text(res[0]);
   	if(res[1]=="invite" ||res[1]=="yes" || res[1]=="no" || res[1]=="delete")
   		{
   		$("#header_notiNum").append(res[2]);
   		}
   	
   	else
   		{
   		for(var i=1;i<res.length;i++)
   			{
   			$("#header_notiNum").append(res[i]);
   			}
   		   
   		}
   
   	
   /* 	header_notiNum */
        /* console.log("ReceiveMessage:", event.data+'\n');
        let $socketAlert = $('div#socketAlert');
        $socketAlert.html(event.data);
        $socketAlert.css('display', 'block');
        
        setTimeout( function() {
        	$socketAlert.css('display', 'none');
        }, 3000); */
    };

    ws.onclose = function (event) { 
        console.log('Info: connection closed.');
        //setTimeout( function(){ connect(); }, 1000); // retry connection!!
    };
    ws.onerror = function (err) { console.log('Error:', err); };
}




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
<script type="text/javascript">
$(document).ready(function(){
	var sessionTheme="<%=session.getAttribute("theme")%>";
	var skin = $('.tmi_skin');
	if(sessionTheme!="null")
		{
		for(var i =1; i<21;i++){
			$('.tmi_skin').removeClass('tmi_skin'+i);
		}	
		skin.addClass(sessionTheme);	
		}
	
	$(document).on("click","#notification_deleteBtn",function(){
		
		var noti_id=$(this).prev().prev().val();     //받은사람
		var pro_id= $(this).prev().val();    //pro_id
		var header_notiCount=$("#header_notiCount").text();
		var this_click=$(this);
		$.ajax({

		    url: "notiDelete",

		    data: { "noti_id": noti_id,
		    	     "pro_id":pro_id},                

		    type: "POST",                            
		    
		    dataType: "text" ,
		    success:function(res)
		    {
		    	$(this_click).parent().css("display","none");
		    	$("#header_notiCount").text(header_notiCount-1);
		    	alert(res);
		    	
		    }

		})
		
		
		 /*  var form = document.createElement("form");
    	  form.setAttribute("method", "POST"); // Get 또는 Post 입력
    	  form.setAttribute("action", "notiDelete");
    	  $(form).append($(this).children('#pro_id'));
    	  document.body.appendChild(form);
    	  form.submit(); */
			
	})
	
})

</script>
</head>

<body>
<input type="hidden" id="sessionTheme" value="${sessionScope.theme }" >
<input type="hidden" id="sessionId" value="${sessionScope.id }" >
<input type="hidden" id="sessionproId" value="${sessionScope.pro_id }" >
<input type="hidden" id="sessionproIdList" value="${sessionScope.projectHomeList }" >
<c:choose>
<c:when test="${empty sessionScope.theme}">
<div id='header' class='tmi_skin tmi_skin1'>
</c:when>
<c:otherwise>
<div id='header' class='tmi_skin ${sessionScope.theme}'>
</c:otherwise>
</c:choose>
    
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

