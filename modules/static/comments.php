<?php 
Core::$META['title'] = 'comments';
Core::$JS[] =  '<script type="text/javascript" src="/skins/default/js/comments.js"></script>';



$res = q( "SELECT * FROM `comments` ORDER BY `id` DESC");

// коментарії
if(isset($_POST['name'],$_POST['text'])){
	$errors = array();
	
	if(empty($_POST['name'])){
		$errors['name'] = 'Ви не заповнили Name';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'Ви не заповнили ваш коментарій';
	}
	if(!count($errors)){
		q(" INSERT INTO `comments` SET
			`name` = '".mres($_POST['name'])."',
			`text` = '".mres($_POST['text'])."',
			`date` = NOW()
		");
		echo json_encode(array('status' => 'ok'));
		exit();
	}
}

