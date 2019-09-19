$(document).ready(function(){	
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
})