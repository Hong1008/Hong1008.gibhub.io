$(document).ready(function(){
	
	//스케줄 시작일 종료일****************************************
    var sch_start =  $('#sch-form #sch_start').get(0);
	var sch_end = $('#sch-form #sch_end').get(0);
	$.ajax({
		url : 'proSelect',
		method : "POST",
		success : function(res) {
			const schPicker = new Lightpick({
				field: sch_start,
			    secondField: sch_end,
				singleDate: false,
				format:'YY/MM/DD',
				repick: true,
				minDate: new Date(res.pro_start),
			    maxDate: new Date(res.pro_end),
				onSelect: function(start, end){
					
				}
			});
		}
	})
	
	$('.td_insert').on('click',function(){
		var sch_id = $(this).attr('href').replace('#','');
		var thisForm = document.getElementById(sch_id);
		var min = $(this).children('#sch_start').val();
		var max = $(this).children('#sch_end').val();
		const schPicker = new Lightpick({
			field: $(thisForm).children('#t_start').get(0),
		    secondField: $(thisForm).children('#t_end').get(0),
			singleDate: false,
			format:'YY/MM/DD',
			repick: true,
			minDate: new Date(min),
		    maxDate: new Date(max),
			onSelect: function(start, end){
				
			}
		});
	})
	
	//스케줄/할일유저추가*****************************************
	$(document).on('click', '.team-list-item', function(){
		var result = false;
		var input = $(this).text();
		$(this).parent().prev().each(function(i,v){
			console.log($(v).attr('id'))
			if($(v).attr('id')==input){
				result = true;
				return false;
			}
		})
		if(result){
			swal("Warning", "유저가 이미 팀에 속해있습니다","error");
			return;
		}
		$(this).parent().prev().append('<li class="table-list-item" id="'+input+'"><span class="table-list-cell">'+input+'</span>'+
				'<span class="table-list-cell"></span><span class="table-list-cell"></span><span class="table-list-cell" id="remove-item">x</span>'+
				'<input type="hidden" name="'+$(this).parent().prev().attr('id')+'" value="'+input+'"/></li>');
		if($(this).parent().attr('id')=='stList'){
			$(this).parent().hide();
			return;
		}
		$(this).remove();
	})
	
	//스케줄/할일유저제거****************************************
	$(document).on('click','#remove-item', function(){
		var input = $(this).parent().attr('id');
		if($(this).parents('.table-list').next().attr('id')=='stList'){
			$(this).parents('.table-list').next().show();
		}else{
			$(this).parents('.table-list').next().append('<li class="team-list-item">'+input+'</li>');
		}
		$(this).parent().remove();
		
	})
	
})