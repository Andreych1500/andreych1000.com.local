<?php

if(isset($_POST['name_avtor'],$_POST['description'],$_FILES['foto'])){
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['name_avtor'])){
		$errors['name_avtor'] = 'Ви незаповнили повне Ім\'я автора!';
	}
	if(empty($_POST['description'])){
		$errors['description'] = 'Ви не заповнили короткі відомості про автора!';
	}
	
	if(!count($errors)){
		if($_FILES['foto']['error'] == 0) {
			if(Uploader::upload($_FILES['foto'],200) != 1){	
				$errors['foto'] = Uploader::$error;
			}
    	}
	}
	
	if(!count($errors)){
		q("
			INSERT INTO `avtor` SET
			`name`     = '".mres($_POST['name_avtor'])."',
			`text`     = '".mres($_POST['description'])."',
			`foto`     = '".mres(Uploader::$filename)."'
 		");
		
		$_SESSION['info'] = 'Автор успішно доданий!';
		header("Location: /admin/book");
		exit();
	}
}

if(isset($_POST['ok2'],$_POST['edit'],$_POST['edit_cat'])){
	$_POST = trimAll($_POST);
	$errors2 = array();
	
	if(empty($_POST['edit'])){
		$errors2['edit'] = 'Ви незаповнили назву автора!';
	}
	
	$res = q("
	  SELECT * 
	  FROM `avtor` 
	  WHERE `name` = '".mres($_POST['edit'])."'
	");
	
	if($res->num_rows){
		$errors2['edit'] = 'Даний автор вже існує!';
	}
	
	if(!count($errors2)){
		q("
		    UPDATE `avtor` SET
			`name`       = '".mres($_POST['edit'])."',
			`foto`       = '".mres(Uploader::$filename)."'
			WHERE `name` = '".mres($_POST['edit_cat'])."'
		");
		
		$_SESSION['info'] = 'Назву автора успішно змінено!';
		header("Location: /admin/book");
		exit();
	}
}

if(isset($_POST['ok4'],$_POST['edit_cat3'])){
	$errors4 = array();
	if($_FILES['foto2']['error'] == 0 && $_FILES['foto2']['name'] != '') {
		if(Uploader::upload($_FILES['foto2'],150) != 1){	
			$errors4['foto2'] = Uploader::$error;
		}
    }else{
		$errors4['error'] = 'Відбулась помилка при завантажені!';	
	}
	if(!count($errors4)){
		q("
		    UPDATE `avtor` SET
			`foto`       = '".mres(Uploader::$filename)."'
			WHERE `name` = '".mres($_POST['edit_cat3'])."'
		");
		
		$_SESSION['info'] = 'Фото автора успішно змінено!';
		header("Location: /admin/book");
		exit();
	}
}

if(isset($_POST['ok3'],$_POST['delete'])){
	$_POST = trimAll($_POST);
	$errors3 = array();
	
	if(empty($_POST['yes'])){
		$errors3['yes'] = 'Ви не підтвердили що хочите видалити!';
	}
	if(!count($errors3)){
		q("
	       DELETE FROM `avtor`
	       WHERE `name` = '".mres($_POST['delete'])."'
  	    ");
 	    
		$_SESSION['info'] = '<span>Назва автора була видалена!</span>';
        header("Location: /admin/book");
        exit();
	}
}

$res = q("
	SELECT *
	FROM `avtor`
	ORDER BY `name` DESC
");

