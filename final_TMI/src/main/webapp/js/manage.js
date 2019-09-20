var nrno = '';

$(document).ready(function(){
	var pro_id= $('#pro_id').val();
	$('.pj_setting').on('click',function(){
		location.href="pjset?pro_id="+pro_id
	});
	
	$('.pj_people').on('click',function(){
		location.href="setpeople?pro_id="+pro_id;
	});
	
	
	$('#manegerSet').on('click',function(){
		var manager = $('#sel1 option:selected').val();
		
		location.href="manager?pro_id="+pro_id+"&id="+manager;
	});
	
	$('#back').on('click', function(){
		location.href="main";
	});
	
	$('#memDel').on('click', function(){
		var memberArray = [];
		$('#chkbox:checked').each(function(){
			memberArray.push($(this).val());
		})
		
		var params = {
			"pro_id" : $('#pro_id').val(),
			"memList" : memberArray
		}
		
		$.ajax({
			url: "/tmi/setting/delete",
			dataType : "text",
			data: params,
			type : "post",
			success: function(res){
				
			}
		/*	error: function(request, status, error, res){
                console.log("AJAX_ERROR");
                console.log(res);
                
			}*/
		});
		
	});
	
	
	$('#modifyModal').addClass('modifyHide');

	$('#memAdd').on('click', member_add);

	$('#btnClose').on('click', function() {
		$('#modifyModal').removeClass('modifyShow');
		$('#modifyModal').addClass('modifyHide');
		$(document).on('click','#btnAdd', member_add);
		urno = "";
	});

	$('#btnAdd').on('click', reply_update_send);	
		
});

function reply_update_send() {
	location.href='addMember?pro_id='+$('#pro_id').val()+'&id='+$('#memberText').val();
	
	$('#memberText').val('');
	$('#modifyModal').removeClass('modifyShow');
	$('#modifyModal').addClass('modifyHide');
	$(document).on('click','#btnAdd', member_add);
	urno = "";
}

function member_add() {
		urno = $(this).prop("id");
		var stop = $(window).scrollTop();
		$('#modifyModal').css('top', 50 + stop);
		$('#modifyModal').removeClass('modifyHide');
		$('#modifyModal').addClass('modifyShow');
		$(document).off('click','#btnAdd');	
}
