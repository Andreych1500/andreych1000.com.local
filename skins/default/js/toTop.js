// JavaScript Document
window.onload = function() { // після загрузки сторінки	
	jQuery( document ).ready(function() {
		$('.scrollup').remove();
		
		$('body').append('<div class="scrollup"><img alt="На верх" src="/skins/default/img/up.jpg"></div>');
		
		var to_top_block = $('.scrollup');
		
		$(to_top_block).unbind('click').click(function(){
			$('body,html').animate({scrollTop:0},600);
		});
		
		$(window).scroll(function() {
			if($(window).scrollTop()>399) {
				$(to_top_block).show();
			}
			else {
				$(to_top_block).hide();
			}
		});
	
	});
};