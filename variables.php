<?php
//обробка Rewrite
if(isset($_GET['route'])){
	$temp = explode('/',$_GET['route']);
	
	if($temp[0] == 'admin'){
		Core::$CONT = Core::$CONT.'/admin';
		Core::$SKIN = 'admin';	
		unset($temp[0]);
	}
	$i = 0;
	foreach($temp as $k => $v){
		if($i == 0){
			if(!empty($v)){
				$_GET['module'] = $v;
			}
		} elseif($i == 1){
			if(!empty($v)){
				$_GET['page'] = $v;
			}
		} else {
			if(!empty($v)){		
				$_GET['key'.($k-1)] = $v;
			}
		}
		++$i;
	}
	unset($_GET['route']);
}

// алгоритм на неспівпадіння модулів у rewrite
if(!isset($_GET['module'])){
	$_GET['module'] = 'static';
} else {
	$res = q("
		SELECT *
		FROM `pages`
		WHERE `module` = '".mres($_GET['module'])."'
		LIMIT 1
	");
	if(!$res->num_rows){
	    header("Location: /404");
		exit();
	} else {
		$staticpage = $res->fetch_assoc();
		$res->close();
		if($staticpage['static'] == 1){
			$_GET['module'] = 'staticpage';
			$_GET['page'] = 'main';
		}
	}
}

if(!isset($_GET['page'])){
	$_GET['page'] = 'main';
} 

// якщо недопустимі символи в адресній строці то перекидуєм на 404
if(!preg_match('#^[a-z-_]*$#iu',$_GET['page'])){
	header("Location: /404");
	exit();
}


/*
$allowe = array('static','errors','game','programs','modules','cab','products','news','account','test');
if(!isset($_GET['module'])){
	$_GET['module'] = 'static';
} elseif(!in_array($_GET['module'],$allowe) && Core::$SKIN != 'admin'){
	header("Location: /errors/404");
}


$page = array('about','main','contact','comments','auth','admin','exit','gameover','registration','add','edit','activate','testsend','calc');

if(!in_array($_GET['page'],$page)){
	header("Location: /errors/404");
}
*/


