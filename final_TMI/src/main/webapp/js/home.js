$(document).ready(function(){	
	var num=1;
	
	/*$('#header').on('click',function(){		
		if(!$('.tmi_skin').hasClass('tmi_skin09')){
			$('.tmi_skin').removeClass('tmi_skin0'+num).addClass('tmi_skin0'+(num+1));
			num++;
		}else{
			$('.tmi_skin').removeClass('tmi_skin09').addClass('tmi_skin01');
			num=1;
		}		
	});*/
	
	  $('#header_sign_in_out').on('click',function(){
          $(location).attr("href", "sign_in.do");
      });
      $('#header_sign_up').on('click',function(){
          $(location).attr("href", "sign_up.do");
      });
      
      $(".pro_header .pro_name").click(function(){
    	  var pro_id = $(this).children('#pro_id').val();
    	  location.href="project/management?pro_id="+pro_id;
      })
      
    //프로젝트 시작일 종료일****************************************
    var pro_start =  document.getElementById('pro_start');
	var pro_end = document.getElementById("pro_end");
	const myPicker = new Lightpick({
		field: pro_start,
	    secondField: pro_end,
		singleDate: false,
		onSelect: function(start, end){
			pro_start.value = start.format('YY/MM/DD');
			pro_end.value = end.format('YY/MM/DD');
		}
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
				url:'project/searchId',
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
			if($(v).attr('id')==input){
				result = true;
				return false;
			}
		})
		$('#pro-form #search_id').val('');
		$('#pro-form #search_result').empty();
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
})