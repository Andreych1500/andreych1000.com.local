<?php 
Core::$META['title'] = 'products';

// категорії для окремого товару, якщо телевізор будуть всі телевізори, якщо всі то в випадку else
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
