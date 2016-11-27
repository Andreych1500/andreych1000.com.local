<div class="content2">
  <div class="contentnews">
    <h1 class="news">
      Новини:
    </h1>
    <?php 
	if(isset($info)){ echo '<h1 class="h1 mar19">'.$info.'</h1>';} 
    if(isset($_GET['cat'])){ echo '<h1 class="h1 mar19">'.hsc($name['name']).'</h1>';}else{ echo '<h1 class="h1 mar19">Усі</h1>'; }
	?>
    <div class="cat_news">
      <a href="/news">Усі</a>
      <?php 
      while($row = $news_cat->fetch_assoc()){
          echo '<a href="/news?cat='.hsc($row['id']).'&num=1">'.hsc($row['name']).'</a>';
      } 
      ?>
    </div>
    <div class="clear"></div> 
    <div class="view3">
      <?php if(isset($info2)){ echo '<h1 class="h2">'.$info2.'</h1>';}?>
       <?php  while($row = $cat->fetch_assoc()){ ?> 
      <div class="news_block">
	    <div class="word">
	      <span class="title"><?php echo nl2br(hsc($row['title'])); ?></span>
	    </div>
	    <div>
	    <p class="description"><?php echo nl2br(hsc($row['description']));?>...</p>
	  </div>
	  <a href="/news/view/<?php echo (int)$row['id']; ?>">Прочитати повністю</a>
	  <span class="date"><?php echo $row['date']; ?></span>
	  <div class="clear"></div>
      </div><hr>       
      <?php } ?>         
    </div>
    <div class="pagination">
    <?php PR::pagination($all_page,$_GET['num'],(isset($_GET['cat'])? 'cat='.(int)$_GET['cat'].'&' : ''),2); ?>
    </div>    
    <div class="clear"></div>
  </div>  
  <div class="clear"></div>     
</div>