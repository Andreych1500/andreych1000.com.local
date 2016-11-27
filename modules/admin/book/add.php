<?php
// добавлення товару
if(isset($_POST['ok'],$_POST['name'],$_POST['description'],$_POST['text'],$_POST['price'],$_FILES['foto'])){
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['name'])){
		$errors['name'] = 'Ви незаповнили назву книги!';
	}
	if(empty($_POST['description'])){
		$errors['description'] = 'Ви незаповнили короткий опис книги!';
	}
	if((mb_strlen($_POST['description']) > 170)){
		$errors['description'] = 'Короткий опис немає перевищувати 170 символів!';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'Ви незаповнили повний опис книги!';
	}
	if(empty($_POST['price'])){
		$errors['price'] = 'Ви незаповнили ціну книги!';
	}
	if(!isset($_POST['id'])){
		$errors['avtor'] = 'Виберіть автора(ів) книги';
	}
	
	if(!count($errors)){
		if($_FILES['foto']['error'] == 0) {
			if(Uploader::upload($_FILES['foto'],150) != 1){	
				$errors['foto'] = Uploader::$error;
			}
    	}
	}
	
	if(!count($errors)){
		q("
			INSERT INTO `book` SET
			`name`        = '".mres($_POST['name'])."',
			`text`        = '".mres($_POST['text'])."',
			`description` = '".mres($_POST['description'])."',
			`cost`        = ".(float)$_POST['price'].",
			`foto`        = '".mres(Uploader::$filename)."'
		");
		
		$id_book = DB::_()->insert_id;
		
		foreach($_POST['id'] as $k=>$v){
			q(" 
				INSERT INTO `avtor2book` SET 
				`avtor_id` = ".(int)$k.", 
				`book_id` = ".(int)$id_book."
			");
		}
		
		$_SESSION['info'] = 'Книга була додана!';
		header("Location: /admin/book");
		exit();
	}
}

$res = q("
	SELECT *
	FROM `avtor`
	ORDER BY `name` DESC
");
