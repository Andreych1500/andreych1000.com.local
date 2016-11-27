<?php 
$res = q("
    SELECT *
	FROM `avtor`
	WHERE `id` = '".mres($_GET['key1'])."'
");

$row = $res->fetch_assoc();
