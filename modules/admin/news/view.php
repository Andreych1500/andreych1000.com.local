<?php 

$res = q("
    SELECT *
	FROM `news`
	WHERE `id` = '".mres($_GET['key2'])."'
");

$row = $res->fetch_assoc();
