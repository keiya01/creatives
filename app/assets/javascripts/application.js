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
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function() { 
	// flash slide
	function headerFlash(flash){
	  	if($(flash).length){
			$(flash).slideDown(500);
			setTimeout(function(){
				$(flash).slideUp(500);
			},5000);
		};
	};
	headerFlash("#flash");
	headerFlash("#flash-home");

	// form textarea 可変
	$('.form-tag').on('submit', function () {
        $(this).find('input:submit').prop('disabled', true);
        $("#load").show();
    });

	// loading display
	$('#top').css('display','none'); //初期状態ではメインコンテンツを非表示
	$('#home-load').css('display','block'); //ウィンドウの高さに合わせでローディング画面を表示
	$(window).on('turbolinks:load',function () {
		$('#home-load').delay(1000).fadeOut(1000); //$('#loader-bg').fadeOut(800);でも可
		$('#top').css('display', 'block'); // ページ読み込みが終わったらメインコンテンツを表示する
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
		}
	})


});