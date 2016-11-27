<div class="content2">
  <div class="addform">
    <span class="style6">
      Редагувати книгу:
    </span>
    <form action="" method="post" enctype="multipart/form-data">
      <div class="title2">
        Назва книги:<br>
        <div>
          <input name="name" type="text" value="<?php if(isset($errors)){ echo hsc($_POST['name']);}else { echo hsc($row['name']); } ?>">
          <?php echo '<span class="color7">'.@$errors['name'].'<span>'; ?>
        </div>  
      </div>
      
      <div class="title2">
        Зміна автора(ів) даної книг:<br>
        <div class="overavtor">
        <?php while($avtor = $res->fetch_assoc()){ ?>
          <label>&bull; <?php echo hsc($avtor['name']);?>
            
            <input type="checkbox" name="id[<?php echo (int)$avtor['id'];?>]" value="<?php echo (int)$avtor['id'];?>"
            <?php 
			
			if(!isset($_POST['id'.(int)$avtor['id']]) && !isset($errors)){
				echo(in_array($avtor['id'],$id_avtor_book)?'checked="checked"' : '');
		    }
			
			echo (isset($errors,$_POST['id'][(int)$avtor['id']])?'checked="checked"' : '');
			
			?>>
          	
          </label>
          <div class="clear"></div>
        <?php } ?>  
        </div>
        <?php echo '<span class="color7">'.@$errors['avtor'].'<span>'; ?>
        <div class="clear"></div>
      </div>
      
      <div class="description2">
        Короткий опис:<br>
        <textarea class="description2_2" name="description"><?php if(isset($errors)){ echo hsc($_POST['description']);}else{echo hsc($row['description']);} ?></textarea>
        <?php echo '<span class="color7">'.@$errors['description'].'<span>'; ?>
      </div>
      <div class="text2">
        Попний текст:<br>
        <textarea class="text2_2" name="text"><?php if(isset($errors)){ echo hsc($_POST['text']);}else{echo hsc($row['text']);} ?></textarea>
        <?php echo '<span class="color7">'.@$errors['text'].'<span>'; ?>
      </div>
      <div>
        <span class="style7">Ціна *:</span><br>
        <input type="text" name="price" value="<?php if(isset($errors)){ echo hsc($_POST['price']);}else{echo hsc($row['cost']);} ?>">
        <?php echo '<span class="color7">'.@$errors['price'].'<span>'; ?>
      </div>
      <div>
        <span class="style6">Зображення *:</span>
        <span class="style7 mar31">Для редагування зображення виберіть файл!</span>
        <input type="file" name="foto">
        <?php echo '<span class="color7">'.@$errors['foto'].'<span>'; ?>
      </div>
      <input class="submit5" type="submit" name="ok" value="Зробити зміни">
    </form>
  </div>  
</div>