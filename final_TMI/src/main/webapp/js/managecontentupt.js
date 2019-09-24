
$(document).ready(function(){
	
	$('#update').on('click', function(){		
		
		var id = $('#pro_id').val();
		var name = $('#pro_name').val();
		var info = $('#pro_info').val();
		var start = $('#pro_start').val();
		var startArr = start.split('-');
		
		var end = $('#pro_end').val();
		var endArr = end.split('-');
		
		var rend = $('#pro_rend').val();
		var rendArr = rend.split('-');
		
		var startCompare = new Date(startArr[0], parseInt(startArr[1])-1, startArr[2]);
	    var endCompare = new Date(endArr[0], parseInt(endArr[1])-1, endArr[2]);
	    var rendCompare = new Date(rendArr[0], parseInt(rendArr[1])-1, rendArr[2]);
	    
	    if(startCompare.getTime() > endCompare.getTime()){
	    	swal("다시 설정해주세요","시작일이 종료일보다 큽니다","error");
	    	return false;
	    }
	    
	    if(startCompare.getTime() > rendCompare.getTime()){
	    	swal("다시 설정해주세요","시작일이 실제종료일보다 큽니다","error");
	    	return false;
	    }
	    
	    if(endCompare.getTime() > rendCompare.getTime()){
	    	swal("다시 설정해주세요","종료일이 실제종료일보다 큽니다","error");
	    	return false;
	    }
	    
	    if(!(startCompare.getTime() > endCompare.getTime() || startCompare.getTime() > rendCompare.getTime()
				|| endCompare.getTime() > rendCompare.getTime() ) ){
	    	$("#set_form").attr("action", "contentUpt");
	    }
	    
		/*if(!(startCompare.getTime() > endCompare.getTime() || startCompare.getTime() > rendCompare.getTime()
				|| endCompare.getTime() > rendCompare.getTime() ) ){
			location.href="contentUpt?pro_id="+id+"&pro_name="
			+name+"&pro_info="+info+"&pro_start="+start+"&pro_end="+end+"&pro_rend="+rend;
		}*/
		

	});
	
	$('#back').on('click', function(){
		$("#set_form").attr("action", "main");
		//$(location).attr("href", "main");
	});
});	
