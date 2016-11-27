<div class="content2">
  <div class="addform">
    <span class="style6">
      Добавити книгу
    </span>
    <form action="" method="post" enctype="multipart/form-data">
      <div class="title2">
        Назва книги:<br>
        <div>
          <input name="name" type="text" value="<?php if(isset($errors)){ echo hsc($_POST['name']);} ?>">
          <?php echo '<span class="color7">'.@$errors['name'].'<span>'; ?>
        </div>  
      </div>
      <div class="title2">
        Автор книги:<br>
        <div class="overavtor">
        <?php while($avtor = $res->fetch_assoc()){ ?>
          <label>&bull; <?php echo hsc($avtor['name']); ?>
            <input class="chekboksik1" type="checkbox" name="id[<?php echo (int)$avtor['id'];?>]" value="<?php echo (int)$avtor['id'];?>"
            <?php if(isset($errors,$_POST['id'][(int)$avtor['id']])){echo 'checked="checked"';} ?>>
          </label>
          <div class="clear"></div>
        <?php } ?>  
        </div>  
        <?php echo '<span class="color7">'.@$errors['avtor'].'<span>'; ?>
        <div class="clear"></div>
      </div>
      <div class="description2">
        Короткий опис:<br>
        <textarea class="description2_2" name="description"><?php if(isset($errors)){ echo hsc($_POST['description']);} ?></textarea>
        <?php echo '<span class="color7">'.@$errors['description'].'<span>'; ?>
      </div>
      <div class="text2">
        Попний текст:<br>
        <textarea class="text2_2" name="text"><?php if(isset($errors)){ echo hsc($_POST['text']);} ?></textarea>
        <?php echo '<span class="color7">'.@$errors['text'].'<span>'; ?>
      </div>
      <div>
        <span class="style7">Ціна *:</span><br>
        <input type="text" name="price" value="<?php if(isset($errors)){ echo hsc($_POST['price']);} ?>">
        <?php echo '<span class="color7">'.@$errors['price'].'<span>'; ?>
      </div>
      <div>
        <span class="style7">Зображення *:</span><br>
        <input type="file" name="foto">
        <?php echo '<span class="color7">'.@$errors['foto'].'<span>'; ?>
      </div>
      <input class="submit5" type="submit" name="ok" value="Добавити">
    </form>
  </div>  
</div>