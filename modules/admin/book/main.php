<?php 
 
// видалення товарів по флажках
if(isset($_POST['delete']) && isset($_POST['ids'])){
	
	foreach($_POST['ids'] as $k=>$v){
		$_POST['ids'][$k] = (int)$v;
	}
	
	$ids = implode(',',$_POST['ids']);
	
	q(" DELETE FROM `book` 
		WHERE `id` IN (".$ids.")
	");
	
	$_SESSION['info'] = '<span style="color:#FFF;">Видалено успішно!</span>';
	header("Location: /admin/book");
	exit();
}

$res= q("
	SELECT *
	FROM `book`
	ORDER BY `id` DESC
");

$avtot = q("
	SELECT *
	FROM `avtor`
");

if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}