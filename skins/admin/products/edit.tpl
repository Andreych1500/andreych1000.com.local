<div class="content2">
  <form action="" method="post" enctype="multipart/form-data">
    <span class="style6">
      РЕДАГУВАТИ ТОВАР
    </span>
    <div>
      <span class="style7">Категорія *:</span><br>
      <select name="cat">
  	    <?php foreach(Core::$CAT as $k=>$v){?>
        <option value="<?php echo $v;?>"<?php if(($row['cat'] == $v) && !isset($errors)){ echo 'selected="selected"';}
		elseif(isset($errors) && ($_POST['cat'] == $v)){ echo 'selected="selected"';} ?>>
		<?php echo $v;  ?>
        </option>
        <?php } ?>
      </select>
      <?php echo '<span class="color7">'.@$errors['cat'].'</span>';?>
    </div>
    <div>
      <div>
        <span class="style7">Наявність *:</span><br>
        <select name="available">
       	  <option value="1" <?php if(($row['is_available'] == '1') && !isset($errors)){ echo 'selected="selected"';}
		  				elseif(isset($errors) && ($_POST['available'] == '1')){ echo 'selected="selected"';} ?>>
            В наявності
          </option>
          <option value="0" <?php if(($row['is_available'] == '0') && !isset($errors)){ echo 'selected="selected"';} 
		  				elseif(isset($errors) && ($_POST['available'] == '0')){ echo 'selected="selected"';} ?>>
            Немає
          </option>
        </select>
        <?php echo '<span class="color7">'.@$errors['available'].'</span>';?>
      </div>
    </div>
    <div>
      <span class="style7">Ім'я товару *:</span><br>
      <textarea name="name"><?php if(isset($errors)){echo $_POST['name'];}else{ echo hsc($row['name']);}?></textarea>
      <?php echo '<span class="color7">'.@$errors['name'].'</span>'; ?>
    </div>
    <div>
      <span class="style7">Опис товару *:</span><br>
      <textarea name="description"><?php if(isset($errors)){echo $_POST['description'];}else{ echo hsc($row['description']);}?></textarea>
      <?php echo '<span class="color7">'.@$errors['description'].'</span>'; ?>
    </div>
    <div>
      <span class="style7">Текс, доставка, гарантія, оплата *:</span><br>
      <textarea name="text"><?php if(isset($errors)){echo $_POST['text'] ;}else{ echo hsc($row['text']); }?></textarea>
      <?php echo '<span class="color7">'.@$errors['text'].'</span>'; ?>
    </div>
    <div>
      <span class="style7">Код товару *:</span><br>
      <input type="text" name="cod" value="<?php if(isset($errors)){echo hsc($_POST['cod']) ;}else{ echo hsc($row['cod']); }?>">
      <?php echo '<span class="color7">'.@$errors['cod'].'</span>'; ?>
    </div>
    <div>
      <span class="style7">Ціна *:</span><br>
      <input type="text" name="price" value="<?php if(isset($errors)){echo hsc($_POST['price']) ;}else{ echo hsc($row['price']); }?>">
      <?php echo '<span class="color7">'.@$errors['price'].'</span>'; ?>
    </div>
    <div>
      <span class="style7">Зображення *:</span><br>
      <input type="file" name="file">
      <?php echo '<span class="color7">'.@$errors['file'].'<span>'; ?>
    </div>
    <div>
      <span class="style7">Розмір зображення ширини(у px від 200 до 400) стандарт 200 :</span><br>
      <input type="text" name="size" value="<?php if(isset($errors)){echo hsc($_POST['size']);} ?>">
      <?php echo '<span class="color7">'.@$errors['size'].'<span>'; ?>
    </div>
    <input class="submit5" type="submit" name="ok" value="Змінити"> 
  </form>
</div>