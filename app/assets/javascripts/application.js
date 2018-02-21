// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.infinitescroll
//= require bootstrap-sprockets
//= require data-confirm-modal
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function() { 
	// flash slide
	function headerFlash(flash){
	  	if($(flash).length){
			$(flash).slideDown(500);
			setTimeout(function(){
				$(flash).slideUp(500);
			},2000);
		};
	};
	headerFlash("#flash");
	headerFlash("#flash-home");

	// form textarea
	$('.form-tag').on('submit', function () {
        $(this).find('input:submit').prop('disabled', true);
        $("#load").show();
    });

	// loading display
	$('#top').css('display','none');
	$('#home-load').css('display','block');
	$(window).on('turbolinks:load',function () {
		$('#home-load').delay(1000).fadeOut(1000);
		$('#top').css('display', 'block');
		});
	$('.logout').on('click', function(){
		$('#load').show();
		setTimeout(function(){
			$('#load').fadeOut(1000);
		}, 1000)
	});

	// header menu slide
	$('#header-menu-down').on('click', function(){
		var headLogo = $(this).children('i');
		if(headLogo.hasClass('fa-angle-down')){
			headLogo.removeClass('fa-angle-down');
			headLogo.addClass('fa-angle-up');
			$('.point').stop(false, true).fadeOut(300);
			$('#header-menu').stop(false, true).slideDown(300);
		}else{
			headLogo.addClass('fa-angle-down');
			$('.point').stop(false, true).fadeIn(300);
			$('#header-menu').stop(false, true).slideUp(300);
		};
	});

	// user show menu
	$('.list-menu').click(function(){
		if($(this).hasClass('active')){
			$('.list-menu').css("background-color","#fff");
			$(this).css("background-color","#eee");
			$('#show-user-posts').show();
			$('#show-user-goods').hide();
		}else{
			$('.list-menu').css("background-color","#fff");
			$(this).css("background-color","#eee");
			$('#show-user-goods').show();
			$('#show-user-posts').hide();
		}
	})
});