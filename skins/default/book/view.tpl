<div class="content2 mar33">
  <div class="contentview">
    <div class="fotobook"><img src="<?php echo hsc(($row['foto']=='')?'/skins/admin/img/default/nofoto.png':hsc($row['foto'])); ?>"></div>
    <div class="text33">
      <span class="name22"><?php echo hsc($row['name']); ?></span>
      <span class="text22"><?php echo hsc($row['text']); ?></span>
      <p class="text19">Автор:<br>
      <?php if($data->num_rows){?>
      <?php while($avtor = $avtors->fetch_assoc()){ ?>
      <a href="/book/author/<?php echo (int)$avtor['id']; ?>"><?php echo hsc($avtor['name']);?></a><br>
      <?php }} ?>
      </p>
      <span class="cost22"><b>Ціна:</b><span class="cost12"> <?php echo (int)$row['cost']; ?></span> грн.<span>
      <a class="back" href="/book">&larr; Назад до списку </a>
    </div>
    <div class="clear"></div>
  </div>    
</div>