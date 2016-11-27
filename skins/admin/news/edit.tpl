<div class="content2">
  <div class="addform">
    <span class="style6">
      Змінити новость
    </span>
    <form action="" method="post">
      <div class="title2">
        Категорія:<br>
        <select name="cat">
        <?php while($row2 = $news_cat->fetch_assoc()){ ?>
          <option value="<?php echo hsc($row2['name']);?>" <?php if(($row['cat'] == $row2['name']) && !isset($errors)){ echo 'selected="selected"';}elseif(isset($errors) && ($_POST['cat'] == $row2['name'])){ echo 'selected="selected"';} ?>>
            <?php echo hsc($row2['name']); ?>
          </option>
		<?php } ?>
        </select><br>
        Заголовок:<br>
        <input type="text" name="title" value="<?php if(isset($errors)){echo hsc($_POST['title']) ;}else{ echo hsc($row['title']); }?>">
        <?php echo '<span class="color7">'.@$errors['title'].'<span>'; ?>
      </div>
      <div class="description2">
        Опис Новості:<br>
        <textarea class="description2_2" name="description"><?php if(isset($errors)){echo hsc($_POST['description']) ;}else{ echo hsc($row['description']); }?></textarea>
        <?php echo '<span class="color7">'.@$errors['description'].'<span>'; ?>
      </div>
      <div class="text2">
        Попний текст новості:<br>
        <textarea class="text2_2" name="text"><?php if(isset($errors)){echo hsc($_POST['text']) ;}else{ echo hsc($row['text']); }?></textarea>
        <?php echo '<span class="color7">'.@$errors['text'].'<span>'; ?>
      </div>
      <input class="submit5" type="submit" name="ok" value="Змінити">
    </form>
  </div>  
</div>
