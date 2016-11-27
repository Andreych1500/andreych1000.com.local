<?php 
// редагування товару
if(isset($_POST['cat'],$_POST['ok'],$_POST['text'],$_POST['description'],$_POST['title'])){	
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['title'])){
		$errors['title'] = 'Ви незаповнили назву новості!';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'Ви повний опис новості!';
	}
	if(empty($_POST['description'])){
		$errors['description'] = 'Ви незаповнили опис новості!';
	}
	if(empty($_POST['cat'])){
		$errors['cat'] = 'Ви незаповнили категорію новості!';
	}
	
	if(!count($errors)){
		$res = q("
		    SELECT `id`
			FROM `news_cat`
			WHERE `name` = '".mres($_POST['cat'])."'					
		");
		$row = $res->fetch_assoc();
	}

	
	if(!count($errors)){
		q(" UPDATE `news` SET 
			`title`          = '".mres($_POST['title'])."',
			`text`           = '".mres($_POST['text'])."',
			`description`    = '".mres($_POST['description'])."',
			`cat`            = '".mres($_POST['cat'])."',
			`cat_id`         = ".(int)$row['id'].",
			`date`           = NOW()
			 WHERE `id`      = ".(int)$_GET['key2']."
		");
		$_SESSION['info'] = 'Зміни  провели успішно!';
		header("Location: /admin/news");
		exit();
	}
}

$news = q("
	SELECT *
	FROM `news`
	WHERE `id` = ".(int)$_GET['key2']."
	LIMIT 1	
");

$news_cat = q("
	SELECT *
	FROM `news_cat`
	ORDER BY `id` ASC
");

// перевірка на те чи існують новості
if(!$news->num_rows){
	$_SESSION['info'] = '<span style="color:#FFF;"">Новостей неіснує!</span>';
	header("Location: /admin/news");
	exit();
}
$row = $news->fetch_assoc();








