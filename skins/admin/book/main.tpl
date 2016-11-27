<div class="content2">
  <div class="contentbook">
    <h1 class="book">
      Розділ Книги:
    </h1>
    <?php if(isset($info)){ echo '<h1 class="h1 mar19">'.$info.'</h1>';} ?>
    <div class="clear"></div>
    <div class="option2">
      <a class="newsadd2" href="/admin/book/add_avtor">Опції Авторів</a>
    <?php if($avtot->num_rows >= 1){ ?>  
      <a class="newsadd" href="/admin/book/add">Добавити книгу</a>
    <?php } ?>  
    </div>  
    <div class="viev_book">
      <form action="" method="post">
      <input class="submitdelete3" type="submit" name="delete" value="Видалити">
      <?php while($row = $res->fetch_assoc()){ ?>
      <div class="books">
        <a class="sulka9" href="/admin/book/edit/<?php echo (int)$row['id']; ?>">Редагувати товар</a>
        <div class="fotos11"><img alt="/" title="/" src="<?php echo hsc(($row['foto']=='')? '/skins/admin/img/default/nofoto.png':hsc($row['foto'])); ?>"></div>
        <input class="checkbox8" type="checkbox" name="ids[]" value="<?php echo (int)$row['id']; ?>">
        <div class="clear"></div>
        <div class="opus21">
          <a href="/admin/book/view/<?php echo (int)$row['id'];?>"><?php echo hsc($row['name']);?></a>
          <p class="descriptions11"><?php echo hsc($row['description']);?>...</p>
        </div>
        <div class="cost21"><b>Ціна:</b><span class="cost11"> <?php echo (float)$row['cost']; ?></span> грн.</div>
      </div>
	  <?php } ?>
      </form>
      <div class="clear"></div>
    </div>
  <div class="clear"></div>  
  </div>
</div>