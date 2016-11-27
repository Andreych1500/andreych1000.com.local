<div class="content2">
  <div class="contentnews">
    <h1 class="news">
      Новини:
    </h1>
    <?php 
	  if(isset($info)){ echo '<h1 class="h1 mar19">'.$info.'</h1>';} 
      if(!$news_cat->num_rows){ echo '<h1 class="h1 mar22">Створіть категорію для новостей</h1>';}
      if(isset($_GET['cat'])){ echo '<h1 class="h1 mar19">'.hsc($name['name']).'</h1>';}else{ echo '<h1 class="h1 mar19">Усі</h1>'; }
	?>
    <div class="cat_news">
      <a href="/admin/news">Усі</a>
      <?php 
      while($row = $news_cat->fetch_assoc()){
          echo '<a href="/admin/news?cat='.hsc($row['id']).'">'.hsc($row['name']).'</a>';
      } 
    ?>
    </div>
    <div class="clear"></div> 
    <div class="option2">
      <a class="newsadd2" href="/admin/news/add_cat">Опції категорій</a>
      <?php if($news_cat->num_rows){ echo '<a class="newsadd" href="/admin/news/add">Добавити новину</a>';}?>
    </div>
<div class="view3">
      <?php if(isset($info2)){ echo '<h1 class="h2">'.$info2.'</h1>';}?>
	  <form method="post" action="#">
       <?php  while($row = $cat->fetch_assoc()){ ?> 
      	<div class="news_block">
	      <input class="chekobox5" type="checkbox" name="ids[]" value="<?php echo (int)$row['id']; ?>">
	      <?php if($news_cat->num_rows){ ?>
	      <a class="sulka6" href="/admin/news/edit/<?php echo hsc($row['id']);?>">Редашувати новину</a> 
	      <?php } ?>
	      <div class="word">
	        <span class="title"><?php echo nl2br(hsc($row['title'])); ?></span>
	      </div>
	      <div>
	        <p class="description"><?php echo nl2br(hsc($row['description']));?>...</p>
	      </div>
	      <a href="/admin/news/view/<?php echo (int)$row['id']; ?>">Прочитати повністю</a>
	      <span class="date"><?php echo hsc($row['date']); ?></span>
	      <div class="clear"></div>
        </div><hr>       
        <?php } ?>
        <input class="submitdelete2" type="submit" name="delete" value="Видалити">
      </form>
    </div>
    <div class="pagination">
    <?php PR::pagination($all_page,$_GET['num'],(isset($_GET['cat'])? 'cat='.(int)$_GET['cat'].'&' : ''),1); ?>
    </div>
    <div class="clear"></div>
  </div>  
  <div class="clear"></div>     
</div>