

$(document).ready(function(){

	$('#update').on('click', function(){
		var id = $('#pro_id').val();
		var name = $('#pro_name').val();
		var info = $('#pro_info').val();
		var start = $('#pro_start').val();
		var end = $('#pro_end').val();
		var rend = $('#pro_rend').val();
		
		location.href="pj_content_upt.do?pro_id="+id+"&pro_name="
				+name+"&pro_info="+info+"&pro_start="+start+"&pro_end="+end+"&pro_rend="+rend;
		/*$('#setting_form').attr('action', "pj_content_upt.do?pro_id="+id+"&pro_name="
				+name+"&pro_info="+info+"&pro_start="+start+"&pro_end="+end+"&pro_rend="+rend);
		$('#setting_form').submit;*/

	});
});	
