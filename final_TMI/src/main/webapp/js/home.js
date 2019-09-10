$(document).ready(function(){	
	var num=1;
	
	/*$('#header').on('click',function(){		
		if(!$('.tmi_skin').hasClass('tmi_skin09')){
			$('.tmi_skin').removeClass('tmi_skin0'+num).addClass('tmi_skin0'+(num+1));
			num++;
		}else{
			$('.tmi_skin').removeClass('tmi_skin09').addClass('tmi_skin01');
			num=1;
		}		
	});*/
	
	  $('#header_sign_in_out').on('click',function(){
          $(location).attr("href", "sign_in.do");
      });
      $('#header_sign_up').on('click',function(){
          $(location).attr("href", "sign_up.do");
      });
})