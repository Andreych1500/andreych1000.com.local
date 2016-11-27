<div class="content2">
  <div class="contentbook">
    <h1 class="book">
      Розділ Книги:
    </h1> 
    <div class="viev_book">
      <form action="" method="post">
      <?php while($row = $res->fetch_assoc()){ ?>
      <div class="books">
        <div class="fotos11"><img alt="/" title="/" src="<?php echo hsc(($row['foto']=='')?'/skins/admin/img/default/nofoto.png':hsc($row['foto'])); ?>"></div>
        <div class="clear"></div>
        <div class="opus21">
          <a href="/book/view/<?php echo (int)$row['id'];?>"><?php echo hsc($row['name']);?></a>
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