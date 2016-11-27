<div class="content3 height3">
<?php
if(isset($_GET['page'])){
	if($_GET['key1'] == 'lose'){
		echo 'You lose,gameover!<br>';
	} else {
    	echo 'You win, congratulations!<br>';
    }
    echo '<a href="/">Вихід</a>';
}

?>
</div>