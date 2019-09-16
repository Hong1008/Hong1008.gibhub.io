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
