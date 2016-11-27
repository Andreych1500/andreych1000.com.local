// JavaScript Document

jQuery( document ).ready(function() {
	slideAuto();
	htmSlider();
	
	
	var images = ["img1.jpg","img2.jpg","img3.jpg","img4.jpg","img5.jpg","img6.jpg"];
	var currentimage = 0;
	
	$("#dommik").attr("src", "/skins/default/img/galerey/"+images[currentimage]);
	
	$("#back").click(function(){
		if(currentimage != 0){
			currentimage--;
			$("#dommik").fadeToggle("fast");
			setTimeout(function(){
				$("#dommik").attr("src", "/skins/default/img/galerey/"+images[currentimage]);
			},200);
			$("#dommik").fadeToggle("fast");
		}
	});	
	$("#forvard").click(function(){
		if(currentimage != images.length - 1){
			currentimage++;
			$("#dommik").fadeToggle("fast");
			setTimeout(function(){
				$("#dommik").attr("src", "/skins/default/img/galerey/"+images[currentimage]);
			},200);
			$("#dommik").fadeToggle("fast");
		}
	});
});


function slideAuto() {
	var images2 = ["img1.jpg","img2.jpg","img3.jpg","img4.jpg","img5.jpg","img6.jpg"];
	var currentimage2 = 0;

	
	$("#dommik2").attr("src","/skins/default/img/galerey/"+images2[currentimage2]);
	
	
	var elem = images2.length-1;
	
	
	setInterval(function(){
		$("#dommik2").hide(1000);
		
		if(currentimage2 == 0){
			setTimeout(function(){
				currentimage2++;
				$("#dommik2").attr("src", "/skins/default/img/galerey/"+images2[currentimage2]).show(1000);
			},1500);
		}
		if(currentimage2 > 0 && currentimage2 < elem){
			setTimeout(function(){
				currentimage2++;
				$("#dommik2").attr("src", "/skins/default/img/galerey/"+images2[currentimage2]).show(1000);
			},1500);
		}
		
		if(currentimage2 == elem){
			setTimeout(function(){
				$("#dommik2").attr("src", "/skins/default/img/galerey/"+images2[0]).show(1000);
				currentimage2 = 1;
				currentimage2--;
			},1500);
		}
		
	},5000);
}


function htmSlider(){
	/* Зададим следующие параметры */
	/* обертка слайдера */
	var slideWrap = $('.slide-wrap');
	
	/* кнопки вперед/назад и старт/пауза */
	var nextLink = $('.next-slide');
	var prevLink = $('.prev-slide');
	
	
	/* Проверка на анимацию */
	var is_animate = true;
	
	/* ширина слайда с отступами */
	var slideWidth = $('.slide-item').outerWidth();
	
	/* смещение слайдера */
	var scrollSlider = slideWrap.position().left - slideWidth;
		  
	/* Клик по ссылке на следующий слайд */
	prevLink.click(function(){
	 if(!slideWrap.is(':animated')) {
	  slideWrap.animate({left: scrollSlider}, 1000, function(){
	   slideWrap
		.find('.slide-item:first')
		.appendTo(slideWrap)
		.parent()
		.css({'left': 0});
	  });
	 }
	});
  
	/* Клик по ссылке на предыдующий слайд */
	nextLink.click(function(){
	 if(!slideWrap.is(':animated')) {
	  slideWrap
	   .css({'left': scrollSlider})
	   .find('.slide-item:last')
	   .prependTo(slideWrap)
	   .parent()
	   .animate({left: 0}, 1000);
	 }
	});
		  
	/* Функция автоматической прокрутки слайдера */
	function autoplay(){
	   slideWrap.animate({left: scrollSlider}, 1000, function(){
		   slideWrap
		   .find('.slide-item:first')
		   .appendTo(slideWrap)
		   .parent()
		   .css({'left': 0});
	   });
	}
		  
	/* Клики по ссылкам старт/пауза */

   if(is_animate){
	  timer = setInterval(autoplay, 9000);
   } else {
	  /* Отключаем функцию autoplay() */
	  clearInterval(timer);
   }
	
  
}


































