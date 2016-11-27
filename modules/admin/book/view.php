<?php 
$res = q("
    SELECT *
	FROM `book`
	WHERE `id` = ".(int)$_GET['key2']."
");

$row = $res->fetch_assoc();

$data = q("
	SELECT *
	FROM `avtor2book`
	WHERE `book_id` = ".(int)$row['id']."
");

if($data->num_rows){

	$avtors_id = array();

	while($row2 = $data->fetch_assoc()){
		$avtors_id[] = (int)$row2['avtor_id'];	
	}

	$comma = implode(',',$avtors_id);

	$avtors = q("
		SELECT *
		FROM `avtor`
		WHERE `id` IN (".$comma.") 
	");
}