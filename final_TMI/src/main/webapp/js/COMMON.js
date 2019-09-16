$(document).ready(function(){	

	$('.gotoHome').on('click',function(){
		location.href="/tmi/home";
	})
	
	$('input[type="text"]').attr('autocomplete','off');
})