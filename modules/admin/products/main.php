<?php 
// видалення товарів по флажках
if(isset($_POST['delete']) && isset($_POST['ids'])){
	foreach($_POST['ids'] as $k=>$v){
		$_POST['ids'][$k] = (int)$v;
	}
	$ids = implode(',',$_POST['ids']);
	
	q(" DELETE FROM `products` 
		WHERE `id` IN (".$ids.")
	");
	
	$_SESSION['info'] = '<span style="color:#FFF;">Видалено успішно!</span>';
	header("Location: /admin/products");
	exit();
}

// вивід категорії
if(isset($_POST['cat']) && ($_POST['cat'] == 'Телевізор' || $_POST['cat'] == 'Телефон' || $_POST['cat'] == 'Ноутбук')){
	$products = q("
		SELECT *
		FROM `products`	
		WHERE `cat` = '".mres($_POST['cat'])."'
		ORDER BY `id` DESC
	");
} else {
	$products = q("
		SELECT *
		FROM `products`	
		ORDER BY `id` DESC
	");
}

if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}
