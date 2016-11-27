<?php

if(isset($_POST['ok'],$_POST['cat'])){
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['cat'])){
		$errors['cat'] = 'Ви незаповнили назву нової категорії!';
	}
	
	if(!count($errors)){
		q("
			INSERT INTO `news_cat` SET
			`name`       = '".mres($_POST['cat'])."'
		");
		
		$_SESSION['info'] = 'Категорія була додана!';
		header("Location: /admin/news");
		exit();
	}
}

if(isset($_POST['ok2'],$_POST['edit'])){
	$_POST = trimAll($_POST);
	$errors2 = array();
	
	if(empty($_POST['edit'])){
		$errors2['edit'] = 'Ви незаповнили назву нової категорії!';
	}
	
	$res = q("
	  SELECT * 
	  FROM `news_cat` 
	  WHERE `name` = '".mres($_POST['edit'])."'
	");
	
	if($res->num_rows){
		$errors2['edit'] = 'Дана категорія вже існує';
	}
	
	if(!count($errors2)){
		q("
		    UPDATE `news_cat` SET
			`name`   = '".mres($_POST['edit'])."'
			WHERE `name` = '".mres($_POST['edit_cat'])."'
		");
		
		$_SESSION['info'] = 'Категорія була змінена!';
		header("Location: /admin/news");
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
	       DELETE FROM `news_cat`
	       WHERE `name` = '".mres($_POST['delete'])."'
  	    ");
 	    
		$_SESSION['info'] = 'Категорія була видалена!';
        header("Location: /admin/news");
        exit();
	}
}

$res = q("
	SELECT *
	FROM `news_cat`
	ORDER BY `name` DESC
");
