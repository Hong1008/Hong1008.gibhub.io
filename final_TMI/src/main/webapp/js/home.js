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
    	  var form = document.createElement("form");
    	  form.setAttribute("method", "POST"); // Get 또는 Post 입력
    	  form.setAttribute("action", "project/management");
    	  $(form).append($(this).children('#pro_id'));
    	  document.body.appendChild(form);
    	  form.submit();
      })
     
      
    //프로젝트 시작일 종료일****************************************
    var pro_start =  document.getElementById('pro_start');
	var pro_end = document.getElementById("pro_end");
	const myPicker = new Lightpick({
		field: pro_start,
	    secondField: pro_end,
		singleDate: false,
		format:'YY/MM/DD',
		repick:true,
		onSelect: function(start, end){
			
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
	
	$('.btn').click(function(e){
		e.preventDefault();
		this.blur();
		$('.modal').modal({
			escapeClose: false,
			clickClose: false
		});
	})
	
	$('.modal').submit(function(){
		if($(this).children('#pro_start').val()=='' || $(this).children('#pro_end').val()==''){
			swal("Warning", "날짜를 지정해주세요","error");
			return false;
		}
		
	})
})