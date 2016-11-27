<div class="content2">
  <h1 class="content4">
    Товари:
  </h1> 
  <form action="" method="post">
    <select name="cat">
      <option <?php if(isset($_POST['cat']) && $_POST['cat'] == 'all'){ echo 'selected="selected"';} ?>>
        all
      </option>
    <?php foreach(Core::$CAT as $k=>$v){ ?>
      <option <?php if(isset($_POST['cat']) && $_POST['cat'] == $v){ echo 'selected="selected"';} ?>>
        <?php echo $v; ?>
      </option>
    <?php } ?>  
    </select>
    <input type="submit" name="submit" value="ok" >
  </form>
  <?php while($row = $products->fetch_assoc()){ ?>
  <div class="content5">
    <div class="nameadd">
      <span class="stylename">
        <?php echo nl2br(hsc($row['name'])); ?>
      </span>
      <span class="styledate">
        <?php echo hsc($row['date']); ?>
      </span>
    </div>
    <div class="fotoadd">
      <img src="<?php echo hsc(($row['img']=='')?'/skins/admin/img/default/nofoto.png':$row['img']); ?>">
      <div class="addcod">
        Код: <?php echo nl2br(hsc($row['cod'])); ?>
      </div>
      <div class="addprice">
        <span class="styleprice">Ціна: <?php echo nl2br(hsc($row['price'])); ?>.грн</span>
      </div>
      <div class="isavailable">
        <span class="styleavailable"><?php if($row['is_available'] == '1'){ echo  'В наявності';} else { echo 'Немає';}?></span>
      </div>
    </div>
    <div class="adddescription">
        <span class="styleopus">Опис:<br></span><?php echo nl2br(hsc(($row['description']))); ?>
    </div>
    <div class="addopus">
      <span class="styletext">Доставка:<br></span><?php echo nl2br(hsc(($row['text']))); ?>
    </div>
    <div class="clear"></div>
  </div>
<?php } ?>

</div>