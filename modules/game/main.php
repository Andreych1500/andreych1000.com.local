<?php 
Core::$META['title'] = 'Game Fight Club';

// перевіряєм на існування кук
if(!isset($_SESSION['client'])){
	$_SESSION['client'] = 10;
	$_SESSION['server'] = 10;
}

// алгоритм ігри
if(isset($_POST['rand'])){
	if($_POST['rand'] != 0 && $_POST['rand'] <= 3 && $_POST['rand'] >= 1){
		if($_POST['rand'] == rand(1,3)){
			$rand = rand(1,4);
			$_SESSION['client'] = $_SESSION['client'] - $rand;
			$ydar = '<div class="ydar"><p class="abz">Вас ударили на: <span>'.$rand.'</span> HP</p></div>';
			if($_SESSION['client'] <= 0){
				unset($_SESSION['client']);
				unset($_SESSION['server']);
				header("Location: /game/gameover/lose");
				exit();
			} 
	    } else {
			$rand = rand(1,4);
			$_SESSION['server'] = $_SESSION['server'] - $rand;
			$ydar = '<div class="ydar"><p class="abz">Ви ударили на: <span>'.$rand.'</span> HP</p></div>';;
			if($_SESSION['server'] <= 0){
				unset($_SESSION['client']);
				unset($_SESSION['server']);
				header("Location: /game/gameover/win"); 
				exit();
			}	
		}
	} else {
		$umova = '<div class="umova">Введіть число від 1 до 3</div>';
	}
}