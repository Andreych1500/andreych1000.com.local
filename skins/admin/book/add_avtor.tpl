<div class="content2">
  <div class="addform">
    <span class="style6">
      Добавити Автора:
    </span>
    <form action="" method="post" enctype="multipart/form-data">
      <div class="title2">
        Повне ім'я Ф.І.О:<br>
        <input type="text" name="name_avtor" value="<?php if(isset($errors)){ echo hsc($_POST['name_avtor']);} ?>">
        <?php echo '<span class="color7">'.@$errors['name_avtor'].'<span>'; ?>
      </div>
      <div class="title2">
        Короткий опис автора:<br>
        <textarea name="description"><?php if(isset($errors)){ echo hsc($_POST['description']);} ?></textarea>
        <?php echo '<span class="color7">'.@$errors['description'].'<span>'; ?>
      </div>
      <div class="title2">
        <span class="style7">Портрет *:</span><br>
        <input type="file" name="foto">
        <?php echo '<span class="color7">'.@$errors['foto'].'<span>'; ?>
      </div>
      <input class="submit5" type="submit" name="ok" value="ок">
    </form>
    
    <?php if($res->num_rows){ ?>
    <span class="style6">
      Змінити назву автора:
    </span>
    <span class="style7 mar16">
        Виберіть назву автора яку хочите змінити:
    </span>
    <form action="" method="post" enctype="multipart/form-data">
      <select name="edit_cat">
      <?php  while($row = $res->fetch_assoc()){ ?>
        <option value="<?php echo hsc($row['name']);?>"<?php if(isset($errors2) && $_POST['edit_cat'] == $row['name']){echo 'selected="selected"';} ?>>
          <?php echo hsc($row['name']); ?>
        </option>
      <?php } ?>
      </select><br><br>
      <span class="style7 mar15">
        Змінити на назву:
      </span>
      <input type="text" name="edit" value="<?php if(isset($errors2)){ echo hsc($_POST['edit']);} ?>">
        <?php echo '<span class="color7">'.@$errors2['edit'].'<span>'; ?>
      <input class="submit5 mar17" type="submit" name="ok2" value="ок">
    </form>
    <div class="title2">
        <span class="style6 ">Змінити портрет *:</span><br>
        <form action="" method="post" enctype="multipart/form-data">
          <span class="style7">Ім'я автора для зміни *:</span><br>
          <select name="edit_cat3">
          <?php $res->data_seek(0); ?>
		  <?php  while($row = $res->fetch_assoc()){ ?>
            <option value="<?php echo hsc($row['name']);?>"<?php if(isset($errors4) && $_POST['edit_cat3'] == $row['name']){echo 'selected="selected"';} ?>>
              <?php echo hsc($row['name']); ?>
            </option>
          <?php } ?>
          </select><br><br>
          <input type="file" name="foto2">
          <?php echo '<span class="color7">'.@$errors4['foto2'].'<span>'; ?>
          <input class="submit5 mar17" type="submit" name="ok4" value="ок">
        </form>  
    </div>
    <span class="style6">
        Видалити автора:
    </span>
    <span class="style7 mar16">
        Виберіть назву автора яку хочите видалити:
    </span>
    <?php $res->data_seek(0); ?>
    <form action="" method="post">
      <select name="delete">
      <?php while($row2 = $res->fetch_assoc()){ ?>
        <option value="<?php echo hsc($row2['name']);?>" <?php if(isset($errors3) && $_POST['delete'] == $row2['name']){ echo 'selected="selected"';} ?>>
          <?php echo hsc($row2['name']); ?>
        </option>
      <?php } ?>
      </select>
      <input type="checkbox" name="yes"><?php echo '<span class="color7">'.@$errors3['yes'].'<span>'; ?>
      <span class="style7 mar16">
        Поставте галочку якщо дійсно хочите дивалити!
      </span>
      <input class="submit5 mar18" type="submit" name="ok3" value="ок">
    </form>
    <?php } else { echo '<span class="style6 mar15">Створіть спершу назву автора, щоб відкрити додаткові налаштування</span>'; } ?> 
  </div>  
</div>