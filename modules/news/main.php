<?php 
Core::$META['title'] = 'news';

$news_cat = q("
	SELECT *
	FROM `news_cat`
");

// для категорій
if(isset($_GET['cat'])){
	$all_news = q("
		SELECT *
        FROM `news`
        WHERE `cat_id` = ".(int)($_GET['cat'])."
	");
} else {
	$all_news = q("
		SELECT * 
		FROM `news`
	");
}

$news_cat = q("
	SELECT *
	FROM `news_cat`
");


$limit = 4; //Скільки буде новостей на сторінці

// категорії
$all_news = q(" 
    SELECT * 
	FROM `news`".(isset($_GET['cat'])? 'WHERE `cat_id` = '.(int)$_GET['cat'].'' : '')."
");

if(isset($_GET['num'])){
	$page = ceil($all_news->num_rows/$limit); // всього новостей
	if($_GET['num']<1){
		$_GET['num'] = 1;
	}
	if($_GET['num'] > $page){
		$_GET['num'] = $page;
	}
} else {
	$_GET['num'] = 1;
}

$start = ($_GET['num']*$limit)-$limit;


$cat = q("
    SELECT *
    FROM `news`
    ".(isset($_GET['cat'])? 'WHERE `cat_id` = '.(int)$_GET['cat'].'' : '')."
	LIMIT $start,$limit
"); 
	 
if(!$cat->num_rows){
	$info2 = 'У данній категорії новостей не інсує...';
}

if(isset($_GET['cat'])){

	$res = q("
		SELECT `name`
		FROM `news_cat`
		WHERE `id` = ".(int)$_GET['cat']."
	");
	
	$name = $res->fetch_assoc();
} 

$all_page = ceil($all_news->num_rows / $limit); // К-сть усіх сторінок яких передамо у клас


if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}


