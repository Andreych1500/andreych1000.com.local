<?php 
Core::$JS[] =  '<script type="text/javascript" src="/skins/default/js/index.js"></script>';
Core::$JS[] =  '<script type="text/javascript" src="/skins/default/js/auth.js"></script>';
Core::$JS[] =  '<script type="text/javascript" src="/skins/default/js/toTop.js"></script>';

//авторизація
if(file_exists("./modules/cab/auth.php")){
	include './modules/cab/auth.php';
} 

// перевірка авторизації на те чи є доступ 
if(isset($_SESSION['user']) && ($_SESSION['user']['active'] == 1)){
	$res = q("
		SELECT *
		FROM `users`
		WHERE `id` = ".(int)$_SESSION['user']['id']."	
		LIMIT 1
	");
	
	$_SESSION['user'] = $res->fetch_assoc();

	if($_SESSION['user']['access'] == 2){
		include './modules/cab/exit.php';	
	}
	if($_SESSION['user']['active'] != 1){
		include './modules/cab/exit.php';
	}
	
} elseif(isset($_COOKIE['authhash'],$_COOKIE['id'])){
	$res = q("
			SELECT *
			FROM `users`
			WHERE `hash` = '".mres($_COOKIE['authhash'])."'
			  AND `id`   = ".(int)$_COOKIE['id']."	
			LIMIT 1	
	");
	
	$data = $res->fetch_assoc();

	if($data['ip'] == $_SERVER['REMOTE_ADDR'] && $data['useragent'] == $_SERVER['HTTP_USER_AGENT']){
		$_SESSION['user'] = $data;
	} else {	
		include './modules/cab/exit.php';
	}	
} 

