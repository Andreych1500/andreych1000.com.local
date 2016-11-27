<div class="content2">
  <div class="ramka"> 
    <div class="forma1"> 
      <form action="" method="post">
        <h1 class="h1s">Online Калькулятор</h1>
        <div class="action">Оберіть дію:<br>
          <label><input type="radio" name="action" value="+">+</label><br>
          <label><input type="radio" name="action" value="-">-</label><br>
          <label><input type="radio" name="action" value="*">*</label><br>
          <label><input type="radio" name="action" value="/">/</label>
        </div>
        <div class="number1"> Число 1 <input type="text" name="num1" value=""></div><br>
        <div class="number2"> Число 2 <input type="text" name="num2" value=""></div>
        <div class="clear"></div>
        <input class="input2" type="submit" value="Обчислити">
        <div class="answer2">Відповідь: 
		  <?php 
		  if(isset($_POST['num1'],$_POST['num2'],$_POST['action'])){
			  echo (real)$_POST['num1'].$_POST['action'].(real)$_POST['num2'].'= '.calc((real)$_POST['num1'],(real)$_POST['num2'],$_POST['action']);
		  } else {
			  echo 'Оберіть дію!';
		  }
		  ?> 
        </div>
      </form>
    </div>  
    <div class="forma2">
      <h2 class="h2s">Міні інженерний</h2>
      <div class="radaction">
        <form action="" method="post">
          <div class="rad2rad">Перетворює значення з радіанів в градуси :<input class="block_11" type="text" name="chuslo1"></div>
          <div class="answer2">Відповідь: 
            <?php 
		    if(isset($_POST['chuslo1'])){
				echo (real)$_POST['chuslo1'].' = '.rad((real)$_POST['chuslo1']);
			} 
		    ?> 
          </div>
          <div class="deg2rad">Перетворює значення з градусів в радіани :<input class="block_11" type="text" name="chuslo2"></div>
          <input class="input2" type="submit" value="Перевести">
          <div class="answer2">Відповідь: 
            <?php 
		    if(isset($_POST['chuslo2'])){
				echo (real)$_POST['chuslo2'].' = '.deg((real)$_POST['chuslo2']);
			} 
		    ?> 
          </div>
        </form>
      </div>
      <div class="forma3">
        <form class="f3" action="" method="post">
          <div class="vud">Вид :<br>
            <label><input type="radio" name="vudd" value="sin">sin</label><br>
            <label><input type="radio" name="vudd" value="cos">cos</label><br>
            <label><input type="radio" name="vudd" value="tan">tan</label><br>
            <label><input type="radio" name="vudd" value="asin">asin</label><br>
            <label><input type="radio" name="vudd" value="acos">acos</label><br>
            <label><input type="radio" name="vudd" value="atan">atan</label>
          </div>
          Градуси : <input type="text" name="chuslo3">
          <input type="submit" value="Перевести">
        </form>  
        <div class="clear"></div>
        <div class="answer2">Відповідь: 
          <?php 
		  if(isset($_POST['chuslo3'],$_POST['vudd'])){
			  echo kyt((real)$_POST['chuslo3'],$_POST['vudd']);
		  } else {
			  echo 'Оберіть дію!';
		  }		
	      ?> 
        </div>
      </div>
    </div>
  </div> 
</div>  