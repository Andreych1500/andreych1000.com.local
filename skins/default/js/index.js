// JavaScript Document
function onclicks(){
		var x = document.getElementById('auth');
		var y = document.getElementById('formauth');
		var z = document.getElementById('auth').offsetLeft;
		var z = z - 184;
		
		if(y.style.display != 'block'){
			x.style.color = '#FFF';
			x.style.backgroundColor = '#f9ae1d';
			y.style.display = 'block';	
			y.style.left = z+'px';
			
		} else {
			y.style.display = 'none';
			x.style.backgroundColor = '';
		}
		
}

$(document).ready(function() {
    $(".block-1 ul li").each(function( index ) {
		var url = window.location.pathname;
		$(".block-1 .blog2list li a").removeClass("active");
		$('.block-1 .blog2list li a[href="'+url+'"]').addClass('active');
	});
});