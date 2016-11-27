<?php
Core::$META['title'] = 'File Managers';

// файловий менеджер
$papka = '<img src="/skins/default/img/papka.jpg">';
$fail = '<img src="/skins/default/img/fail.jpg"';

if(isset($_GET['modpage'])) {
    $dir = $_GET['modpage'];
} else {
    $dir = './'; 
}

$var = scandir($dir);

$array['dir'] = '';
$array['files'] = '';

unset($var['0']);
