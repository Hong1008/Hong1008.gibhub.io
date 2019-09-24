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
		swal({
			  title: "매니저 변경",
			  text: "변경하시겠습니까?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: false,
			})
			.then((willDelete) => {
				if (willDelete) {
					location.href="manager?pro_id="+pro_id+"&id="+manager;    
				}
			});
		
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
		/*
		 * error: function(request, status, error, res){
		 * console.log("AJAX_ERROR"); console.log(res); }
		 */
		});
		
	});
	
	//검색****************************************
	$('#pro-form #search_id').on({
		focus:function(){
			$('#pro-form #search_result').show();
		},
		blur:function(){
			if($('#pro-form #search_result').val()=='' || $('#pro-form #search_result').val()==null)
				return;
			$('#pro-form #search_result').hide();
		},
		keyup:function(){
			$('#pro-form #search_result').empty();
			var id = $(this).val();
			if(id == null || id == '')
				return;
			$.ajax({
				url:'searchId',
				type:'POST',
				data:'id='+id,
				success:function(res){
					$('#pro-form #search_result').empty();
					$(res).each(function(i,v){						
						$('#pro-form #search_result').append('<li class="autocomplete-item">'+v+'</li>')
					})
				}
			})
		}
	})
	
	//유저추가*****************************************
	$(document).on('click', '.autocomplete-item', function(){
		var input = $(this).text();
		var result = false;
		
		$('.table-list-item').each(function(i,v){
			console.log($(v).attr('id'));
			if($(v).attr('id')==input){
				result = true;
				return false;
			}
		})
		$('#pro-form #search_id').val('');
		$('#pro-form #search_result').empty();
		if(input==$('#sessionId').val()){
			swal("Warning", "본인은 추가할 수 없습니다.","error");
			return;
		}
		if(result){
			swal("Warning", "유저가 이미 팀에 속해있습니다","error");
			return;
		}
		$('#pro_team_list').append('<li class="table-list-item" id="'+input+'"><span class="table-list-cell">'+input+'</span>'+
		'<span class="table-list-cell"></span><span class="table-list-cell"></span><span class="table-list-cell" id="remove-item">x</span>'+
		'<input type="hidden" name="pro_team_list" value="'+input+'"/></li>')
		
	})
	
	//유저제거****************************************
	$(document).on('click','#remove-item', function(){
		$(this).parent().remove();
	})
	
	
	
	/*$('#modifyModal').addClass('modifyHide');

	$('#memAdd').on('click', member_add);

	$('#btnClose').on('click', function() {
		$('#modifyModal').removeClass('modifyShow');
		$('#modifyModal').addClass('modifyHide');
		$(document).on('click','#btnAdd', member_add);
		urno = "";
	});

	$('#btnAdd').on('click', reply_update_send);*/	
		
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
