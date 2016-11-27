function OnLoad() {
	$('.we_are_adim span.remove').unbind('click').click(function(){
		$.ajax({
			url:'/chat/chat?ajax=1&remove='+$(this).attr('rel_id'),
		});
		$(this).parent('.mess_block_'+$(this).attr('rel_id')).remove();
	});
}

$(document).ready(function(){
	
	OnLoad();
	
	//користувачі онлайн	
	setTimeout(function run() {
		$.ajax({
			url:'/chat/chat?ajax=1&user_online&more_user',
			cache:false,
			success: function(data){
				var response = JSON.parse(data);
				var deleta_user = [];
				for (var key in response) {
					var user = response[key];
					deleta_user[key] = user.name;
					
					if($.inArray(user.name, users()) < 0){
						if(typeof(user.name)!='undefined') {	
							if($('.userblock').is("ul li")){
								$('.userblock ul').find('li').appendTo("<li onclick=\"addname(this)\"><span></span>"+ user.name +"</li>");
							} else {
								$('.userblock ul').append("<li onclick=\"addname(this)\" ><span></span>"+ user.name +"</li>");
							}
						}
					} 
				}
				
				function_delate_blockthis_not_user(deleta_user);
			}
		});
		
		$(".online-user + ul li span").fadeOut(1600, "linear", complete);
		
		setTimeout(run, 10000);
	}, 10000);
	
	//підгрузка даних
	setInterval(function(){
		var user = $('.name-user-chat span').text();
		$.ajax({
			url:'/chat/chat?ajax=1&stop_code&message&last_mess_id='+last_mess_id,
			cache:false,
			success: function(data){
				var response = JSON.parse(data);

				if(response.last_id>last_mess_id) {
					last_mess_id = response.last_id;
				}
				for (var key in response) {
					var line = response[key];

					if(typeof(line.removed)!='undefined') {
						if(line.removed==1) {
							$(".mess_block_"+line.id).remove();
						} else {
							if(user != line.user_name){
								if(typeof(line.user_name)!='undefined') {			
									if($('#tv-block').is(".list-itom")){
										$('#tv-block').find('.list-itom').appendTo("<div class=\"list-itom"+" mess_block_"+line.id+ spec_bock(user, hsc(line.message)) +" \"><p class=\"name-i\" onclick=\"addname(this)\">"+ line.user_name +"</p><p>"+ line.date_message +"</p><p>"+ convertSmile(nl2br(hsc(line.message))) +"</p>"+((response.user_access == 5)? "<span class=\"remove\" rel_id="+line.id+">x</span>" : "")+"</div>");
									} else {
										$('#tv-block').append("<div class=\"list-itom"+" mess_block_"+line.id+ spec_bock(user, hsc(line.message)) +" \"><p class=\"name-i\" onclick=\"addname(this)\">"+ line.user_name +"</p><p>"+ line.date_message +"</p><p>"+ convertSmile(nl2br(hsc(line.message))) +"</p>"+((response.user_access == 5)? "<span class=\"remove\" rel_id="+line.id+">x</span>" : "")+"</div>");
									}
									scrollBottom();
								}						
							}
						}
					}								
				} 
				OnLoad();
			}
		});
	}
	,5000);
	
	//клавіші
	$('#chat-message').keypress(function(enent){
			if(event.which == 13){
				if(event.shiftKey){
					this.innerHTML=this.innerHTML+nl2br("");
				} else {
					$('input[type="submit"]').trigger('click');	
					event.preventDefault();
					return false;
				}
			}
	});
	
});

//добавлення даних
function add_message(){
	var message = $('#chat-message').val();
	var user_name = $('.name-user-chat span').text();
	var newtime = new Date().getHours()+":"+((parseInt(new Date().getMinutes()))>9? (new Date().getMinutes()) : "0"+(new Date().getMinutes()))+":"+((parseInt(new Date().getSeconds()))>9? (new Date().getSeconds()) : "0"+(new Date().getSeconds()));
	var error   = 0;
	
	if($.trim(message) == ''){
		error = 1;
		if($("div").is("#chatErrorMessage")){
			$('#chatErrorMessage').slideDown("slow");
		} else {
			var error_block = $("<div id='chatErrorMessage'>Для того щоб відправити повідомлення введіть текст</div>").hide();
			$(".ch-contentnews").append(error_block);
			$(error_block).slideDown("slow");
		}
		setTimeout(function(){
			$('#chatErrorMessage').slideUp();
		},4000);
	} 
	
	if(error == 0){
		
		$("#chat-message").val("");

		$.ajax({
		    type:"POST",
		    url:"/chat/chat?ajax=1&stop_code&each_massage",
		    cache:false,
		    data:{ "user_name" :  user_name, "message" : message},
		  
		    success: function(msg){
				var response = JSON.parse(msg);
	
				if($('#tv-block').is(".list-itom")){
					$('#tv-block').find('.list-itom').appendTo("<div class=\"list-itom"+" mess_block_"+response.last_id+ spec_bock(response.user_name, hsc(response.message)) +" \"><p class=\"name-i\" onclick=\"addname(this)\">"+ response.user_name +"</p><p>"+ response.date_message +"</p><p>"+ convertSmile(nl2br(hsc(message))) +"</p>"+((response.access_user == 5)? "<span class=\"remove\" rel_id="+response.last_id+">x</span>" : "")+"</div>");
				} else {
					$('#tv-block').append("<div class=\"list-itom"+" mess_block_"+response.last_id+ spec_bock(response.user_name, hsc(response.message)) +" \"><p class=\"name-i\" onclick=\"addname(this)\">"+ response.user_name +"</p><p>"+ response.date_message +"</p><p>"+ convertSmile(nl2br(hsc(message))) +"</p>"+((response.access_user == 5)? "<span class=\"remove\" rel_id="+response.last_id+">x</span>" : "")+"</div>");
				}
				
				scrollBottom();
			},
		
	    });
	}
	
	return false;
}


//cмайлики
function convertSmile(elem){
	return elem.replace(/\:\|\(\)/g, '<img src="/skins/default/img/smiles/img0001.png" alt="/">').
	replace(/\:\}\(\)/g, '<img src="/skins/default/img/smiles/img0002.png" alt="/">').
	replace(/\:\{\|\|/g, '<img src="/skins/default/img/smiles/img0003.png" alt="/">').
	replace(/\:\*\}\|/g, '<img src="/skins/default/img/smiles/img0004.png" alt="/">').
	replace(/\:\/\)\|/g, '<img src="/skins/default/img/smiles/img0005.png" alt="/">').
	replace(/\:\%\(\(/g, '<img src="/skins/default/img/smiles/img0006.png" alt="/">').
	replace(/\^\^\:\}/g, '<img src="/skins/default/img/smiles/img0007.png" alt="/">').
	replace(/\^\^\:\//g, '<img src="/skins/default/img/smiles/img0008.png" alt="/">').
	replace(/\:\)\)\)/g, '<img src="/skins/default/img/smiles/img0009.png" alt="/">').
	replace(/\:\{\:\}/g, '<img src="/skins/default/img/smiles/img00010.png" alt="/">').
	replace(/\:\}\}\}/g, '<img src="/skins/default/img/smiles/img00011.png" alt="/">').
	replace(/\:\?\?\|/g, '<img src="/skins/default/img/smiles/img00012.png" alt="/">').
	replace(/\:\[\*\|/g, '<img src="/skins/default/img/smiles/img00013.png" alt="/">').
	replace(/\:\|\|\|/g, '<img src="/skins/default/img/smiles/img00014.png" alt="/">').
	replace(/\:\[\*\]/g, '<img src="/skins/default/img/smiles/img00015.png" alt="/">').
	replace(/\:\]\*\[/g, '<img src="/skins/default/img/smiles/img00016.png" alt="/">').
	replace(/\:\$\$\|/g, '<img src="/skins/default/img/smiles/img00017.png" alt="/">').
	replace(/\:\^\^\^/g, '<img src="/skins/default/img/smiles/img00018.png" alt="/">').
	replace(/\:\^\^\{/g, '<img src="/skins/default/img/smiles/img00019.png" alt="/">').
	replace(/\:\(\(\|/g, '<img src="/skins/default/img/smiles/img00020.png" alt="/">').
	replace(/\:\~\~\|/g, '<img src="/skins/default/img/smiles/img00021.png" alt="/">').
	replace(/\:\^\?\?/g, '<img src="/skins/default/img/smiles/img00022.png" alt="/">').
	replace(/\:\/\_\|/g, '<img src="/skins/default/img/smiles/img00023.png" alt="/">');
}

//htmlspecialchars
function hsc(string){
	var specialChars = {
			"&" : "&amp;",
			"<" : "&lt;",
			">" : "&gt;",
			'"' : "&quot;",		
			"'" : "&prime;"
	};
	
	
	for (key in specialChars){
		string = string.replace(new RegExp(key, "g"), specialChars[key]);
	}
	
	return string;

};

//колір фону блока
function spec_bock(name,message){
	var reg = new RegExp(name, "g")
	var result = message.match(reg);
	
	if(result !== null){
		return ' specific_block';
	} else {
		return '';
	}
}

//відкриваєм закриваєм блок
function opensmile(){
	if($('.itom_smile').css('display') == 'none'){
		$('.itom_smile').show();
	} else {
		$('.itom_smile').hide();
	}
}

//добавлення користувача textarea
function addname(elem){
	var name = $(elem).text();
	var text =$('.textchat');
	text.val(text.val() + ' '+ String(name) + ', ');
	text.focus();
}

//перебір користувачів
function users(){
	var a = [];
	$('.userblock ul li').each(function(i,elem){
		a[i] = $(this).text();
	});

	return a;
};

//неактивні користувачі	видаляються
function function_delate_blockthis_not_user(name){
	$('.userblock ul li').each(function(i,elem){
		if($.inArray($(this).text(),name) < 0){
			$(this).remove();
		}
	});
}

//добавляем смайл в textarea
function addsmile(elem){
	var text = $('.textchat');
	text.val(text.val() + elem + '');
	text.focus();
}

//скролинг в низ
function scrollBottom(){
	document.getElementById('tv-block').scrollTop = document.getElementById('tv-block').scrollHeight;
}

//анімація онлайн
function complete() {
	$(".online-user + ul li span").fadeIn(1600, "linear");
}

//переводи строк
function nl2br(varTest){
  return varTest.replace(/(\r\n|\n\r|\r|\n)/g, "<br>");
};






