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
		      template += '<span class="custom-select-trigger">' + $(this).attr("placeholder") + '</span>';
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
	  	  location.replace("/tmi/project/management?pro_id="+pro_id);
	});
	//select 디자인 및 동작 끝********************************************
})
