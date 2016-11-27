// JavaScript Document
window.onload = function() { // після загрузки сторінки	
	jQuery(document).ready(function(){
		$("div.moresmall").click(function(){
			$(this).parent().children("img.width1,p.text3_2,a.sulkablock3_1").slideToggle();
		});
    });
};
