<?php 
Core::$META['title'] = 'Calculator';

// калькулятор
function calc($num1, $num2, $action){
	if($action == '+'){
		$result = $num1 + $num2;
	} elseif ($action == '-'){
		$result = $num1 - $num2;
	} elseif ($action == '/'){
		if ($num2 != 0){
	    	$result = $num1 / $num2 ;
        } else {
			$result = 'На 0 ділити неможна';
		}
	} elseif ($action == '*'){
		$result = $num1 * $num2;
	} else {
		$result = 'Ошибка';
	}
	return $result;
}

// з радіан у градуси
function rad($number){
	$result = rad2deg($number);
	return $result;
}

// з градусів у радіани
function deg($number){
	$result = deg2rad($number);
	return $result;
}

// градуси
function kyt($number,$vud){
	if($vud == 'sin'){
		$result = sin($number);
	} elseif ($vud == 'cos'){
		$result = cos($number);
	} elseif ($vud == 'tan'){
		$result = tan($number);
	} elseif ($vud == 'asin'){
		$result = asin($number);
	} elseif ($vud == 'acos'){
		$result = acos($number);
	} elseif ($vud == 'atan'){
		$result = atan($number);
	}
	return $result;
}