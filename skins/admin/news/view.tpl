<div class="content2">
  <div class="contentview">
    <div class="word">
      <p class="cat">Категорія: <?php echo nl2br(hsc(($row['cat']))); ?></p>
      <span class="title mar21"><?php echo nl2br(hsc(($row['title']))); ?></span>
    </div>
    <div>
      <p class="text"><?php echo nl2br(hsc(($row['text']))); ?></p>
    </div>
    <span class="date"><?php echo hsc($row['date']);?></span>
    <div class="clear"></div>
    <a class="exit" href="/admin/news?cat=<?php echo (int)$row['cat_id'];?>">Вернутись до новастей даної категорії</a>
    <a class="exit" href="/admin/news">Вернутись до новастей</a>
  </div>    
</div>