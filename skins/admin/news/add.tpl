<div class="content2">
  <div class="addform">
    <span class="style6">
      Добавити Книгу
    </span>
    <form action="" method="post">
      <div class="title2">
        Категорія:<br>
        <select name="cat_news">
        <?php while($row = $res->fetch_assoc()){ ?>
          <option value="<?php echo hsc($row['name']);?>" <?php if(isset($errors) && $_POST['cat_news'] == $row['name']){ echo 'selected="selected"';} ?>>
            <?php echo hsc($row['name']); ?>
          </option>
		<?php } ?>
        </select><br>
        Назва:<br>
        <input type="text" name="title" value="<?php if(isset($errors)){ echo hsc($_POST['title']);} ?>">
        <?php echo '<span class="color7">'.@$errors['title'].'<span>'; ?>
      </div>
      <div class="description2">
        Опис Новості:<br>
        <textarea class="description2_2" name="description"><?php if(isset($errors)){ echo hsc($_POST['description']);} ?></textarea>
        <?php echo '<span class="color7">'.@$errors['description'].'<span>'; ?>
      </div>
      <div class="text2">
        Попний текст новості:<br>
        <textarea class="text2_2" name="text"><?php if(isset($errors)){ echo hsc($_POST['text']);} ?></textarea>
        <?php echo '<span class="color7">'.@$errors['text'].'<span>'; ?>
      </div>
      <input class="submit5" type="submit" name="ok" value="Добавити">
    </form>
  </div>  
</div>