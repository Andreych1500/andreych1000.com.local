<?php 
// редагування товара
if(isset($_POST['ok'],$_POST['text'],$_POST['cat'],$_POST['description'],$_POST['cod'],$_POST['price'],$_POST['name'],$_POST['available'])){	
	$_POST = trimAll($_POST);
	$errors = array();
	
	if(empty($_POST['cod'])){
		$errors['cod'] = 'Ви незаповнили код товару!';
	}
	if(empty($_POST['text'])){
		$errors['text'] = 'Ви незаповнили текс!';
	}
	if(empty($_POST['description'])){
		$errors['description'] = 'Ви незаповнили опис товару!';
	}
	if(empty($_POST['cat'])){
		$errors['cat'] = 'Ви незаповнили категорію товару!';
	}
	if(empty($_POST['price']) || !(int)$_POST['price']){
		$errors['price'] = 'Ви незаповнили ціну товару!';
	}
	if(empty($_POST['name'])){
		$errors['name'] = 'Ви незаповнили Ім\'я товару!';
	}
	if($_POST['available'] != 0 && $_POST['available'] != 1){
		$errors['available'] = 'Ви незаповнили наявність товару!';
	}
	if(empty($_POST['size'])){
		$_POST['size'] = 200;
	}
	if($_POST['size'] < 200 || $_POST['size'] > 400){
		$errors['size'] = 'Розмір не задовільняє вимогам!';
	} 
	
	// зміна зображення товара
	if($_FILES['file']['size'] != 0){
		if($_FILES['file']['error'] == 0 && $_FILES['file']['name'] != '') {
			
			if(Uploader::upload($_FILES['file'],150) != 1){	
				$errors['file'] = Uploader::$error;
			}
			
			q("UPDATE `products` SET 
				`img` = '".mres(Uploader::$filename)."'
				WHERE `id` = ".(int)$_GET['key2']."
			");
			 
    	} else {
			$errors['foto'] = 'Винекнула ошибка при відправці....';
		}
	}
	
	if(!count($errors)){
		q(" UPDATE `products` SET 
			`cat`          = '".mres($_POST['cat'])."',
			`cod`          = '".mres($_POST['cod'])."',
			`description`  = '".mres($_POST['description'])."',
			`text`         = '".mres($_POST['text'])."',
			`name`         = '".mres($_POST['name'])."',
			`is_available` = ".(int)$_POST['available'].",
			`price`        = ".(int)$_POST['price'].",
			`date`         = NOW()
			 WHERE `id`    = ".(int)$_GET['key2']."
		");
		$_SESSION['info'] = '<span style="color:#FFF;"">Зміни  провели успішно!</span>';
		header("Location: /admin/products");
		exit();
	}
}

// перевірка чи товар існує
$products = q("
	SELECT *
	FROM `products`
	WHERE `id` = ".(int)$_GET['key2']."
	LIMIT 1	
");

if(!$products->num_rows){
	$_SESSION['info'] = '<span style="color:#FFF;"">Товара неіснує!</span>';
	header("Location: /admin/products");
	exit();
}
$row = $products->fetch_assoc();














