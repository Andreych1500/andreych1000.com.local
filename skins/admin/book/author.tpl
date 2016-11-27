<div class="content2 mar33">
  <div class="contentview">
    <div class="fotobook"><img class="mar34" src="<?php echo hsc(($row['foto']=='')? '/skins/admin/img/default/nofoto.png':hsc($row['foto'])); ?>"></div>
    <div class="text33">
      <span class="name22"><?php echo hsc($row['name']); ?></span>
      <span class="text22"><?php echo hsc($row['text']); ?></span><br>
      <a class="back" href="/admin/book">&larr; До списку книг </a>
    </div>
    <div class="clear"></div>
  </div>    
</div>