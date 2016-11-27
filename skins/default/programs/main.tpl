<div class="content2">
	<div class="content9">
<?php 
foreach($var as $k => $v){
	if(is_dir($dir.'/'.$v)){
		$array['dir'] .= '<div><a href="/programs?modpage='.(isset($_GET['modpage'])?$_GET['modpage'].'/'.$v:$v).'">'.$v.'</a>'.$papka.'</div>';
	} else {
		$array['files'] .= '<div><span>'.$v.$fail.'</span></div>';
	}
}
foreach($array as $k => $v){
	echo $v;
}	
?>
	</div>
    <div class="razpakovka"></div>
</div>

