// JavaScript Document

function myComments(){
	var namecom = $("#namevalue").val();
    var textcom = $("#textvalue").val();
	var newtime = new Date().getFullYear()+"-"+((parseInt(new Date().getMonth())+1)>9? (new Date().getMonth()+1) : "0"+(new Date().getMonth()+1))+"-"+((parseInt(new Date().getDate())+1)>9? (new Date().getDate()) : "0"+(new Date().getDate()))+" "+new Date().getHours()+":"+((parseInt(new Date().getMinutes()))>9? (new Date().getMinutes()) : "0"+(new Date().getMinutes()))+":"+new Date().getSeconds();
	
	var error   = 0;
	
	if(namecom == ''){
		error = 1;
		resultStat = 'Не забувайте вписати своє ім\'я!';
		$("#resp").text(resultStat).show().delay(1500).fadeOut(800);
	}
	if(textcom == ''){
		error = 1;
		resultStat2 = 'Не забувайте вписати свій текс!';
		$("#resp2").text(resultStat2).show().delay(1500).fadeOut(800);
	}
	
	
	if(error == 0){
	    $("#comadd").prepend("<div class='yourcomments'><span class='name01'>-"+namecom+"</span> <span class='name02'>"+newtime+"</span><br><div class='text011'><span class='name03'>"+textcom+"</span></div></div>");	
		
		$("#comment2").hide(600);
		
		setTimeout(function(){ 
			$(".efect1").show('drop').delay(3000).fadeOut(800);
		}, 1100);
		
		setTimeout(function(){ 
			$("#comment2").show('drop');
		}, 5500);
		
		$("#namevalue").val(namecom);
        $("#textvalue").val("");
				
	    $.ajax({
		    type:"POST",
		    url:"/static/comments?ajax=1",
		    cache:false,
		    data:{ "name" : namecom, "text" : textcom , "date" : newtime },
		  
		    success: function(msg){ // Результат який вертає сервер поміщається у success, без імену функцію! Вертає 1 аргумент
				var response = JSON.parse(msg); // непрацює у IE7
			    //получити в виді обєкта дані
		    },
		
	    });
	}
	
	return false;
}
		
	

		
		
		
		
		
		
		
		
		
		
		
		
		
		