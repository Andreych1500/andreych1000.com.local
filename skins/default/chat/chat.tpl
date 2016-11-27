<div class="content2<?php if($_SESSION['user']['access'] == 5){ echo ' we_are_adim'; } ?>">
  <div class="contentnews ch-contentnews">
    <div class="title-chat"><h1 class="content4">Онлайн Чат</h1></div>
    <?php echo (isset($errors['text'])? '<div id="chatErrorMessage">'.$errors['text'].'</div>': ''); ?>
    <div class="chat">
      <div id="tv-block">
        <?php foreach($new_message as $result_mess){ 
			      if(is_array($result_mess)) {?>
          <div class="list-itom <?php if(SearchBlock::search($_SESSION['user']['login'],hsc($result_mess['message']))){ echo 'specific_block'; }?> mess_block_<?php echo $result_mess['id']; ?>">
            <p class="name-i" onclick="addname(this)"><?php echo hsc($result_mess['user_name']); ?></p>
			<p><?php echo hsc($result_mess['date_message']); ?></p>
            <p><?php echo Smile::replace(nl2br(hsc($result_mess['message']))); ?></p>
			<?php if($_SESSION['user']['access'] == 5){ ?>
			<span class="remove" rel_id="<?php echo $result_mess['id'];?>">x</span>
			<?php } ?>
          </div>
        <?php     }   
		      } 
		?>
      </div>
      <div class="userblock">
        <p class="online-user">В онлайні:</p>
        <ul>
        <?php while($result_user = $user->fetch_assoc()){ ?>     	
          <li onclick="addname(this)"><span></span><?php echo hsc($result_user['name']);  ?></li>     
		<?php } ?>
        </ul>
      </div>
      <form action="#" method="post" onsubmit="return add_message();">
        <p class="name-user-chat">Ваш нік: <span><?php echo hsc($_SESSION['user']['login']); ?></span></p>
        <textarea id="chat-message" class="textchat" name="message"></textarea>
        <input type="submit" value="Надіслати" name="ok">
      </form>
	  <div class="info_nl2b">
	     <span>Перевод строки: Shift+Enter</span>
      </div>
	  <div class="itom_smile">
	    <div onclick="addsmile(' :|() ')"><img src="/skins/default/img/smiles/img0001.png" alt="/"></div>
		<div onclick="addsmile(' :}() ')"><img src="/skins/default/img/smiles/img0002.png" alt="/"></div>
		<div onclick="addsmile(' :{|| ')"><img src="/skins/default/img/smiles/img0003.png" alt="/"></div>
		<div onclick="addsmile(' :*}| ')"><img src="/skins/default/img/smiles/img0004.png" alt="/"></div>
		<div onclick="addsmile(' :/)| ')"><img src="/skins/default/img/smiles/img0005.png" alt="/"></div>
		<div onclick="addsmile(' :%(( ')"><img src="/skins/default/img/smiles/img0006.png" alt="/"></div>
		<div onclick="addsmile(' ^^:} ')"><img src="/skins/default/img/smiles/img0007.png" alt="/"></div>
		<div onclick="addsmile(' ^^:/ ')"><img src="/skins/default/img/smiles/img0008.png" alt="/"></div>
		<div onclick="addsmile(' :))) ')"><img src="/skins/default/img/smiles/img0009.png" alt="/"></div>
		<div onclick="addsmile(' :{:} ')"><img src="/skins/default/img/smiles/img00010.png" alt="/"></div>
		<div onclick="addsmile(' :}}} ')"><img src="/skins/default/img/smiles/img00011.png" alt="/"></div>
		<div onclick="addsmile(' :??| ')"><img src="/skins/default/img/smiles/img00012.png" alt="/"></div>
		<div onclick="addsmile(' :[*| ')"><img src="/skins/default/img/smiles/img00013.png" alt="/"></div>
		<div onclick="addsmile(' :||| ')"><img src="/skins/default/img/smiles/img00014.png" alt="/"></div>
		<div onclick="addsmile(' :[*] ')"><img src="/skins/default/img/smiles/img00015.png" alt="/"></div>
		<div onclick="addsmile(' :]*[ ')"><img src="/skins/default/img/smiles/img00016.png" alt="/"></div>
		<div onclick="addsmile(' :$$| ')"><img src="/skins/default/img/smiles/img00017.png" alt="/"></div>
		<div onclick="addsmile(' :^^^ ')"><img src="/skins/default/img/smiles/img00018.png" alt="/"></div>
		<div onclick="addsmile(' :^^{ ')"><img src="/skins/default/img/smiles/img00019.png" alt="/"></div>
		<div onclick="addsmile(' :((| ')"><img src="/skins/default/img/smiles/img00020.png" alt="/"></div>	
		<div onclick="addsmile(' :~~| ')"><img src="/skins/default/img/smiles/img00021.png" alt="/"></div>
		<div onclick="addsmile(' :^?? ')"><img src="/skins/default/img/smiles/img00022.png" alt="/"></div>
		<div onclick="addsmile(' :/_| ')"><img src="/skins/default/img/smiles/img00023.png" alt="/"></div>
	  </div>
      <div class="smile" onclick="opensmile()"></div>
      <div class="clear"></div> 
    </div>
  </div>
  <div class="clear"></div>    
</div>
<script type="text/javascript">
	var last_mess_id=<?php echo $new_message['last_id']?>;
</script>