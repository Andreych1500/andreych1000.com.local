<div class="content2">
  <div class="addform">
    <span class="style6">
      Добавити категорію:
    </span>
    <form action="" method="post">
      <div class="title2">
        Назва нової категорії:<br>
        <input type="text" name="cat" value="<?php if(isset($errors)){ echo hsc($_POST['cat']);} ?>">
        <?php echo '<span class="color7">'.@$errors['cat'].'<span>'; ?>
      </div>
      <input class="submit5" type="submit" name="ok" value="ок">
    </form>
    <?php if($res->num_rows){ ?>
    <span class="style6">
      Змінити категорію:
    </span>
    <span class="style7 mar16">
        Виберіть категорію яку хочите змінити:
    </span>
    <form action="" method="post">
      <select name="edit_cat">
      <?php while($row = $res->fetch_assoc()){ ?>
        <option value="<?php echo hsc($row['name']);?>"<?php if(isset($errors2) && $_POST['edit_cat'] == $row['name']){echo 'selected="selected"';} ?>>
            <?php echo $row['name']; ?>
        </option>
      <?php } ?>
      </select>
      <span class="style7 mar15">
        Змінити на категорію:
      </span>
      <input type="text" name="edit" value="<?php if(isset($errors2)){ echo hsc($_POST['edit']);} ?>">
        <?php echo '<span class="color7">'.@$errors2['edit'].'<span>'; ?>
      <input class="submit5 mar17" type="submit" name="ok2" value="ок">
    </form>
    <span class="style6">
        Видалити категорію:
    </span>
    <span class="style7 mar16">
        Виберіть категорію яку хочите видалити:
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
    <?php } else { echo '<span class="style6 mar15">Створіть спершу категорію, щоб відкрити додаткові налаштування</span>'; } ?>
  </div>  
</div>