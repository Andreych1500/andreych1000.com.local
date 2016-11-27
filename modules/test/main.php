<?php

if(isset($_POST['submit'])){
	$errors = array();
	$width = array();
	
	if(empty($_FILES['file1']['tmp_name']) && empty($_FILES['file2']['tmp_name']) && empty($_FILES['file3']['tmp_name'])){
		$errors['file'] = 'файлів не додано';
	}
	if(!empty($_FILES['file1']['tmp_name'])){
		$width[1] = 400;
	} 
	if(!empty($_FILES['file2']['tmp_name'])){
		$width[2] = 600;
	} 
	if(!empty($_FILES['file3']['tmp_name'])){
		$width[3] = 800;
	}
	
	if(!count($errors)){
		for($i = 1; $i <= 3; ++$i){
			if($_FILES['file'.$i]['error'] == 0){
				if(Uploader::upload($_FILES['file'.$i],$width[$i]) != 1){	
					$errors['file'] = Uploader::$error;
				} else {
					$temp = getimagesize('.'.Uploader::$filename);
					if($temp[0] == 400){
						$img1 = Uploader::$filename;
					} elseif($temp[0] == 600){
						$img2 = Uploader::$filename;
					} elseif($temp[0] == 800){
						$img3 = Uploader::$filename;
					}
				}
    		}
		}
	}
	if(!count($errors)){
		
		q("
			INSERT INTO `test` SET 
			`img1`  = '".mres($img1)."',
			`img2`  = '".mres($img2)."',
			`img3`  = '".mres($img3)."'				
		");
		
		$_SESSION['info'] = '<span class="color11">Зміни  провели успішно!</span>';
		header("Location: /test");
		exit();
	}
	
}

if(isset($_SESSION['info'])){
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}
