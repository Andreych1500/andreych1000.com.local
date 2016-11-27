<?php
// добавлення товару
if(isset($_POST['ok'],$_POST['title'],$_POST['description'],$_POST['text'],$_POST['cat_news'])){
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['title'])){
		$errors['title'] = 'Ви незаповнили назву новості!';
	}
	if(empty($_POST['description'])){
		$errors['description'] = 'Ви незаповнили опис новості!';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'Ви незаповнили повний опис новості!';
	}
	
	if(!count($errors)){
		$res = q("
		    SELECT `id`
			FROM `news_cat`
			WHERE `name` = '".mres($_POST['cat_news'])."'					
		");
		$row = $res->fetch_assoc();
	}

	if(!count($errors)){
		q("
			INSERT INTO `news` SET
			`title`       = '".mres($_POST['title'])."',
			`text`        = '".mres($_POST['text'])."',
			`description` = '".mres($_POST['description'])."',
			`cat`         = '".mres($_POST['cat_news'])."',
			`cat_id`      = ".(int)$row['id'].",
			`date`        = NOW()
		");
		$_SESSION['info'] = 'Запис був доданий!';
		header("Location: /admin/news");
		exit();
	}
}

$res = q("
	SELECT *
	FROM `news_cat`
	ORDER BY `name` ASC
");