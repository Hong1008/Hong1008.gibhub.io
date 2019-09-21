$(document).ready(function(){	
	
	/////////////////////////////////////쿠키////////////////////////////////////
		var a = $('.timelines');
		a.on('click',function(){
			if($(this).hasClass('time_nonchk')){
				var id = $(this).attr('id');
				console.log(id);
				$.removeCookie(id);
				$.cookie(id, 'time_chk', { expires: 365 });
				$(this).removeClass('time_nonchk');
				
			}
		})
		
		for(var i=0;i<a.length;i++){
			var coo = $.cookie('time_0'+(i+1));
			if(coo==undefined){
				$.cookie('time_0'+(i+1), 'time_nonchk', { expires: 365 });
			}else{
				a.eq(i).addClass(coo);
			}
		}	
		/////////////////////////////////////쿠키////////////////////////////////////
		
		//////////////////////////////탐라처리/////////////////////////////////////
		$('.time_todo').append('할일');
		$('.time_start').append('생성');
		$('.time_end').append('종료');
})