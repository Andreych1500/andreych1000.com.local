<?php 
// редагування книг
$res = q("
	SELECT *
	FROM `avtor`
");


////////////////////////////////////////////////////////////////////////////////////////////

$id_avtor_book = array();
$delete = array();
$delete_avtor = array();
$sql_file = '';

//обробка чекбокса до роботи з ним!
$authors = q("
	SELECT `avtor_id`
	FROM `avtor2book`
	WHERE `book_id` = ".(int)$_GET['key2']."
");

while($cheked = $authors->fetch_assoc()){
	$id_avtor_book[] = $cheked['avtor_id'];
}

if(isset($_POST['ok'],$_POST['id'])){
	foreach($_POST['id'] as $v){
		$delete[] = $v;
	}
	
	while($del = $res->fetch_assoc()){
		if(!in_array($del['id'],$delete)){
			$delete_avtor[] = $del['id'];
		}
	}
}
$sql_file = implode(',',$delete_avtor);

////////////////////////////////////////////////////////////////////////////////////////////

if(isset($_POST['name'],$_POST['description'],$_POST['ok'],$_POST['text'],$_POST['price'])){	
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
		$errors['avtor'] = 'Вибаріть автора(ів) до даної книги!';
	}
	
	if($_FILES['foto']['size'] != 0){
		if($_FILES['foto']['error'] == 0 && $_FILES['foto']['name'] != '') {
			
			if(Uploader::upload($_FILES['foto'],150) != 1){	
				$errors['foto'] = Uploader::$error;
			}
			
			q("UPDATE `book` SET 
				`foto` = '".mres(Uploader::$filename)."'
				WHERE `id` = ".(int)$_GET['key2']."
			");
			 
    	} else {
			$errors['foto'] = 'Винекнула ошибка при відправці....';
		}
	}
	
	if(!count($errors)){
		q(" UPDATE `book` SET 
			`name`        = '".mres($_POST['name'])."',
			`text`        = '".mres($_POST['text'])."',
			`description` = '".mres($_POST['description'])."',
			`cost`        = ".(int)$_POST['price']."			
			 WHERE `id`   = ".(int)$_GET['key2']."
		");
		
		foreach($_POST['id'] as $v){
				
			$res3 = q("SELECT * FROM `avtor2book` WHERE `avtor_id` = ".(int)$v." AND `book_id` = ".(int)$_GET['key2']."");
			if(!$res3->num_rows){
			  q("INSERT INTO `avtor2book` SET `avtor_id` = ".(int)$v.", `book_id` = ".(int)$_GET['key2'].""); // add avtor2book
			}
			
		}
		
		if($sql_file != ''){		
			q("DELETE FROM `avtor2book` WHERE `avtor_id` IN (".$sql_file.") AND `book_id` = ".(int)$_GET['key2']."");
		}
		
		$_SESSION['info'] = 'Зміни  провели успішно!';
		header("Location: /admin/book");
		exit();
	}
}

$res->data_seek(0);

$book = q("
	SELECT *
	FROM `book`
	WHERE `id` = ".(int)$_GET['key2']."
	LIMIT 1	
");

// перевірка на те чи існують новості
if(!$book->num_rows){
	$_SESSION['info'] = '<span style="color:#FFF;"">Книг неіснує!</span>';
	header("Location: /admin/book");
	exit();
}

$row = $book->fetch_assoc();







