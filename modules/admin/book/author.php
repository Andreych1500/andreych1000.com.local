<?php 

$res = q("
    SELECT *
	FROM `avtor`
	WHERE `id` = ".(int)$_GET['key2']."
");

$row = $res->fetch_assoc();
