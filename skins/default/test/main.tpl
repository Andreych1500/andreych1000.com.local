<div class="content2">
<?php if(!isset($info)){ ?>
<form action="" method="post" enctype="multipart/form-data">
  1: width 400 <input name="file1" type="file"> <?php if(isset($errors['file'])){echo $errors['file']; } ?><br>
  2: width 600 <input name="file2" type="file"><br>
  3: width 800 <input name="file3" type="file"><br>
  <input type="submit" name="submit" value="ok">
</form>
<?php } else { echo $info; }  ?>
</div>