<?php 

// добавлення товара
if(isset($_POST['cat'],$_POST['cod'],$_POST['description'],$_POST['text'],$_POST['name'],$_POST['available'],$_FILES['file'],$_POST['size'])){
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
	if($_POST['price'] < 0){
		$errors['price'] = 'Ви незаповнили коректно ціну товару!';
	}
	if(empty($_POST['name'])){
		$errors['name'] = 'Ви незаповнили Ім\'я товару!';
	}
	if($_POST['available'] != 0 && $_POST['available'] != 1){
		$errors['available'] = 'Ви незаповнили наявність товару!';
	}
	if($_POST['size'] < 200 || $_POST['size'] > 400){
		$errors['size'] = 'Розмір не задовільняє вимогам!';
	} 
	
	if(!count($errors)){
		if($_FILES['file']['error'] == 0) {
			if(Uploader::upload($_FILES['file'],$_POST['size']) != 1){	
				$errors['file'] = Uploader::$error;
			}
    	}
	}	
		
	if(!count($errors)){
		q(" INSERT INTO `products` SET
			`cat`          = '".mres($_POST['cat'])."',
			`cod`          = '".mres($_POST['cod'])."',
			`description`  = '".mres($_POST['description'])."',
			`text`         = '".mres($_POST['text'])."',
			`name`         = '".mres($_POST['name'])."',
		    `is_available` = ".(int)$_POST['available'].",
			`price`        = ".(int)$_POST['price'].",
			`img`          = '".mres(Uploader::$filename)."',
			`date`         = NOW()
		");
		
		$_SESSION['info']= '<span style="color:#FFF;"">Товар успішно доданий!</span>';
		header("Location: /admin/products");
		exit();
	}
}