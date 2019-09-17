$(document).ready(function(){
	var pro_id= $('#pro_id').val();
	$('.pj_setting').on('click',function(){
		location.href="pj_setting_set.do?pro_id="+pro_id
	});
	
	$('.pj_people').on('click',function(){
		location.href="pj_setting_people.do?pro_id="+pro_id;
	});
	
});