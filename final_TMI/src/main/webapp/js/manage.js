var nrno = '';
var userfile='';
var fileList='';

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
	
	
	$('#modifyModal').addClass('modifyHide');

	$('#memAdd').on('click', reply_update_delete);

	$('#btnClose').on('click', function() {
		$('#modifyModal').removeClass('modifyShow');
		$('#modifyModal').addClass('modifyHide');
		$(document).on('click', '.timeline button', reply_update_delete);
		urno = "";
	});

	$('#replyAddBtn').on('click', reply_list);
	$('#btnModify').on('click', reply_update_send);	
		
});

function reply_update_send() {
	$.ajax({
		type : 'get',
		dateType : 'json',
		url : 'replyUpdate.do?bno=${boardDTO.bno}&rno=' + urno
				+ "&replytext=" + $('#updateReplyText').val(),
		success : reply_list_result
	})
	$('#updateReplyText').val('');
	$('#modifyModal').removeClass('modifyShow');
	$('#modifyModal').addClass('modifyHide');
	$(document).on('click', '.timeline button', reply_update_delete);
	urno = "";
}

function reply_update_delete() {
	if($(this).text() == 'update') {
		urno = $(this).prop("id");
		var stop = $(window).scrollTop();
		$('#modifyModal').css('top', 50 + stop);
		$('#modifyModal').removeClass('modifyHide');
		$('#modifyModal').addClass('modifyShow');
		$(document).off('click', '.timeline button');
	}
}
