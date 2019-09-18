$(document).ready(function(){	
	var id=$('#sessionId').val();	
	if(id==null || id=="")
       {
		  $("#header_account").css("display","none");
		  $("#header_sign_out").css("display","none");
       }
	else
		{
		  $('#header_sign_up').css("display","none");
		  $('#header_sign_in_out').css("display","none");
		  $("#header_account").css("display","inline");
		  $("#header_sign_out").css("display","inline");
		}
	
	  
	  
	  $('#header_sign_in_out').on('click',function(){
        $(location).attr("href", "sign_in.do");
    });
    $('#header_sign_up').on('click',function(){
        $(location).attr("href", "sign_up.do");
    });
    $('#header_account').on('click',function(){
        $(location).attr("href", "home");
    });
    $('#header_sign_out').on('click',function(){
        $(location).attr("href", "sign_out");
    });
    

    //select 디자인 및 동작********************************************
	$(".custom-select").each(function() {
		  var classes = $(this).attr("class"),
		      id      = $(this).attr("id"),
		      name    = $(this).attr("name");
		  var template =  '<div class="' + classes + '">';
		      template += '<span class="custom-select-trigger">' + $(this).children('.selected').text() + '</span>';
		      template += '<div class="custom-options">';
		      $(this).find("option").each(function() {
		        template += '<span class="custom-option ' + $(this).attr("class") + '" data-value="' + $(this).attr("value") + '">' + $(this).html() + '</span>';
		      });
		  template += '</div></div>';
		  
		  $(this).wrap('<div class="custom-select-wrapper"></div>');
		  $(this).hide();
		  $(this).after(template);
		});
		$(".custom-option:first-of-type").hover(function() {
		  $(this).parents(".custom-options").addClass("option-hover");
		}, function() {
		  $(this).parents(".custom-options").removeClass("option-hover");
		});
		$(".custom-select-trigger").on("click", function() {
		  $('html').one('click',function() {
		    $(".custom-select").removeClass("opened");
		  });
		  $(this).parents(".custom-select").toggleClass("opened");
		  event.stopPropagation();
		});
		$(".custom-option").on("click", function() {
		  $(this).parents(".custom-select-wrapper").find("select").val($(this).data("value"));
		  $(this).parents(".custom-options").find(".custom-option").removeClass("selection");
		  $(this).addClass("selection");
		  $(this).parents(".custom-select").removeClass("opened");
		  $(this).parents(".custom-select").find(".custom-select-trigger").text($(this).text());
		  var pro_id = $(this).attr('data-value');
	  	  //location.replace("/tmi/project/management?sessionChange=true&pro_id="+pro_id);
		  location.replace("?proIdChange=true&pro_id="+pro_id);
	});
	//select 디자인 및 동작 끝********************************************
		
		$('#header').on('click',function(){
			var skin = $('.tmi_skin');
			if(skin.eq(0).hasClass('tmi_skin01')){
				skin.removeClass('tmi_skin01');
				skin.addClass('tmi_skin02');				
			}else 	if(skin.eq(0).hasClass('tmi_skin02')){
				skin.removeClass('tmi_skin02');
				skin.addClass('tmi_skin03');				
			}else 	if(skin.eq(0).hasClass('tmi_skin03')){
				skin.removeClass('tmi_skin03');
				skin.addClass('tmi_skin04');				
			}else 	if(skin.eq(0).hasClass('tmi_skin04')){
				skin.removeClass('tmi_skin04');
				skin.addClass('tmi_skin05');				
			}else 	if(skin.eq(0).hasClass('tmi_skin05')){
				skin.removeClass('tmi_skin05');
				skin.addClass('tmi_skin06');				
			}else 	if(skin.eq(0).hasClass('tmi_skin06')){
				skin.removeClass('tmi_skin06');
				skin.addClass('tmi_skin07');				
			}else 	if(skin.eq(0).hasClass('tmi_skin07')){
				skin.removeClass('tmi_skin07');
				skin.addClass('tmi_skin08');				
			}else 	if(skin.eq(0).hasClass('tmi_skin08')){
				skin.removeClass('tmi_skin08');
				skin.addClass('tmi_skin09');				
			}else 	if(skin.eq(0).hasClass('tmi_skin09')){
				skin.removeClass('tmi_skin09');
				skin.addClass('tmi_skin10');				
			}else 	if(skin.eq(0).hasClass('tmi_skin10')){
				skin.removeClass('tmi_skin10');
				skin.addClass('tmi_skin01');				
			}		
			
		})
})
