<div class="content3">
    <div class="gamefon">
    <?php echo '<div class="rightthp"> HP Компа: '.(int)$_SESSION['server'].'</div>';
          echo '<div class="lefthp"> HP Кліента: '.(int)$_SESSION['client'].'</div>'; ?>
      <img class="fom" src="/skins/default/img/fomwr2.png" alt="foto">
      <div class="foto">
        <div class="form">
          <p class="game">
            GAME:
          </p>
          <form action="" method="post">
            <input class="rand" type="text" name="rand"><br>
            <input type="submit" value="Удар">
          </form>
        </div>
        <?php if(isset($umova)){ echo $umova; } ?> 
      </div> 
      <?php if(isset($ydar)){ echo $ydar; } ?> 
    </div>
    <div class="clear"></div>
  </div>
</div>
