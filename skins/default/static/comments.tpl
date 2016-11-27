<div class="content2">
  <div class="commentview">
    <p>
      Коментарії
    </p> 
    <div id="comadd">
    <?php 
    if($res->num_rows){
        while($row = $res->fetch_assoc()){ ?>
            <div class="yourcomments">
              <span class="name01">-<?php echo hsc($row['name']);?></span>
              <span class="name02"><?php echo hsc($row['date']);?></span><br>
              <div class="text011"><span class="name03"><?php echo nl2br(hsc($row['text']));?></span></div>	 
            </div>
    <?php } } ?>
    </div> 
  </div>
  <hr>
  <?php if(isset($_SESSION['user']) && $_SESSION['user']['active'] == 1){ ?>
  <div id="comment">
    <div class="efect1">Дякуємо за ваш коментарій, з вами приємно спілкуватись.</div>
    <div id="comment2">
      <form action="#" method="post" onsubmit="return myComments();">
        <table>
          <tr>
            <td>
              <span class="namespan">Name *</span> 
                <input type="text" id="namevalue" name="name" value="<?php echo (isset($_POST['name'])? hsc($_POST['name']):$_SESSION['user']['login']); ?>">
                <span id="resp"></span><?php echo '<span class="color6">'.@$errors['name'].'</span>'; ?>
            </td>
          </tr>  
          <tr>
            <td> 
              <span class="namespan2">Ваший коментарій *</span><span id="resp2"></span><br>
              <textarea id="textvalue" name="text"></textarea>
              <?php echo '<span class="color6">'.@$errors['text'].'</span>'; ?>
            </td> 
          </tr> 
          <tr>
            <td>
              <input type="submit" name="submit" id="submit23">
            </td>
          </tr>  
        </table>      
      </form>
    </div>
  </div>
  <?php } ?>
</div>

