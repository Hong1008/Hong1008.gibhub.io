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
		if(!memberArray.length){
			swal("선택된 멤버가 없습니다", "멤버를 선택하고 눌러주세요","error");
			return;
		}
		
		if(memberArray.length){
			$.ajax({
				url: "delete",
				data: params,
				type : "post",
				success: function(res){
					var list = 0;
					for(var i=0; i <res.length; i++){
						console.log(res[i]);
						
						$('#chkbox[value="'+res[i]+'"]').parent().remove();
					}
				}
			
			});
		}
				
	});
	
	//검색****************************************
	$('#search-bar #search_id').on({
		focus:function(){
			$('#search-bar #search_result').show();
		},
		blur:function(){
			if($('#search-bar #search_result').val()=='' || $('#search-bar #search_result').val()==null)
				return;
			$('#search-bar #search_result').hide();
		},
		keyup:function(){
			$('#search-bar #search_result').empty();
			var id = $(this).val();
			if(id == null || id == '')
				return;
			$.ajax({
				url:'searchId',
				type:'POST',
				data:'id='+id,
				success:function(res){
					$('#search-bar #search_result').empty();
					$(res).each(function(i,v){						
						$('#search-bar #search_result').append('<li class="search-item">'+v+'</li>')
					})
				}
			})
		}
	})
	
	//유저추가*****************************************
	$(document).on('click', '.search-item', function(){
		var input = $(this).text();
		var result = false;
		
		$.ajax({
			url: 'idcheck',
			type: 'post',
			data: 'id='+input,
			success: function(res){					
				$('.table-list-item').each(function(i,v){
					console.log($(v).attr('id'));
					if($(v).attr('id')==input){
						result = true;
						return false;
					}
				})
				$('#search-bar #search_id').val('');
				$('#search-bar #search_result').empty();
				if(input==$('#sessionId').val()){
					swal("Warning", "본인은 추가할 수 없습니다.","error");
					return;
				}
				if(result || res=='1'){
					swal("Warning", "유저가 이미 팀에 속해있습니다","error");
					return;
				}
				$('#pro_team_list').append('<li class="table-list-item" id="'+input+'"><span class="table-list-cell">'+input+'</span>'+
				'<span class="table-list-cell"></span><span class="table-list-cell"></span><span class="table-list-cell" id="remove-item">x</span>'+
				'<input type="hidden" name="pro_team_list" value="'+input+'"/></li>')
			}
		});
		
	})
	
	//유저제거****************************************
	$(document).on('click','#remove-item', function(){
		$(this).parent().remove();
	})
	
	
		
});

