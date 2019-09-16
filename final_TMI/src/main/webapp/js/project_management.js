$(document).ready(function(){
	$('.btn-group button').on('click',function(){
		var where = $(this).attr('id');
		$.ajax({
			type:"GET",
			dataType:'text',
			data:"where="+where,
			url:'showWhat',
			success:function(res){
				console.log(res);
				$('.showWhat').empty();
				$('.showWhat').html(res);
			}
		})
	})
})