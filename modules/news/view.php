<?php 
$res = q("
    SELECT *
	FROM `news`
	WHERE `id` = '".mres($_GET['key1'])."'
");

$row = $res->fetch_assoc();
