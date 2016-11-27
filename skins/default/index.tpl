<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css">
  <link type="image/x-icon" rel="shortcut icon" href="/ico/big_smile.ico">
  <title><?php echo hsc(Core::$META['title']);?></title>
  <meta name="description" content="<?php echo hsc(Core::$META['descrition']); ?>">
  <meta name="keywords" content="<?php echo hsc(Core::$META['ketwords']); ?>">
  <script type='text/javascript' src='http://code.jquery.com/jquery-latest.min.js'></script>
  <?php if(count(Core::$CSS)){ echo implode("\n",Core::$CSS); } ?>
  <?php if(count(Core::$JS)){ echo implode("\n",Core::$JS); } ?>
</head>

<body>
  <div class="header">
    <div class="header-border">
      <div class="conteiner-1">
      <?php if(isset($errors['notuser'])){ echo '<span class="errors_user">'.$errors['notuser'].'</span>';} ?>
      <span onMouseDown="onclicks()" id="auth">AUTH</span>
      <?php if(isset($_SESSION['user'])){ ?>
      <div class="nameuser"><?php echo hsc($_SESSION['user']['login']);?></div>
	  <?php } ?>
        <div id="formauth">
          <p>Авторизація</p>
          <?php if(!isset($_SESSION['user'])){ ?>
          <form action="#" method="post" onsubmit="return authGo();">
            <input placeholder="Логін" type="text" name="login" id="inlog">
            <input placeholder="******" type="password" name="pass" id="inpass"><br>
            <div><input type="checkbox" name="save"><span>Запам'ятати нас</span></div>
            <button type="submit" id="insub" name="open_auth">Війти</button>
          <?php } else { ?>
            <p class="auth_ok">Ви авторизовані</p>
            <a href="/cab/exit">Вийти</a>
          <?php } ?>
          </form>
        </div>
        <div class="block-1">
          <div class="leftblock-1">
            <a class="logo" href="">
              <img src="/skins/default/img/log.png" alt="log">
            </a>
          </div>
          <ul class="blog2list">
            <li><a class="list" href="/static/main">HOME</a></li>
            <li><a class="list" href="/static/about">ABOUT</a></li>
            <li><a class="list" href="/static/calc">CALC</a></li>
            <li><a class="list" href="/static/comments">COMMENTS</a></li>
            <li><a class="list" href="/products">PRODUCTS</a></li>
            <li><a class="list" href="/news">NEWS</a></li>
            <?php if(!isset($_SESSION['user'])){?>
            <li><a class="list" href="/cab/registration">REGISTRATION</a></li>
            <?php } ?>
            <li><a class="list" href="/game">GAME</a></li>
            <li><a class="list" href="/book">BOOK</a></li>
            <?php if(isset($_SESSION['user']) && ($_SESSION['user']['access'] == 5 || $_SESSION['user']['access'] == 1 )){ ?>
			<li class="gg"><a class="list" href="/account">ACCOUNT</a></li>
			<?php } ?>
            <?php if(isset($_SESSION['user']) && $_SESSION['user']['access'] == 5){  ?>
            <li><a class="list" href="/programs">PROGRAMS</a></li>
            <?php } ?>
            <?php if(isset($_SESSION['user'])){ ?>
			<li><a class="list" href="/chat/chat">CHAT</a></li>
			<?php } ?>
            <?php if(isset($_SESSION['user']) && $_SERVER['REMOTE_ADDR'] == '127.0.0.1' && $_SESSION['user']['access'] == 5){?>
            <li><a class="list" href="/admin">ADMIN</a></li>
            <?php } ?>
          </ul> 
          <div class="clear"></div>
        </div>
      </div> 
    </div>
  </div>
  <div id="test"></div>
  <?php echo $content; ?>
  <div id="footer">
    <div class="conteiner-4">
      <div class="footerlast">
        <div class="conteyner">
          <p class="conteynerp">
            company
          </p>
          <ul class="conteynerlist">
            <li><a href="">ABOUT US</a></li>
            <li><a href="">CLIENTS</a></li>
            <li><a href="">PRESENTATION</a></li>
            <li><a href="">SUPPORT</a></li>
            <li><a href="">SCHEDULE</a></li>
          </ul>
        </div>
        <div class="conteyner">
          <p class="conteynerp">
            overview
          </p>
          <ul class="conteynerlist">
            <li><a href="">WHAT WE DO</a></li>
            <li><a href="">NEWS</a></li>
            <li><a href="">SOLUTIONS</a></li>
          </ul>
        </div>
        <div class="conteyner">
          <p class="conteynerp">
            for members
          </p>
          <ul class="conteynerlist">
            <li><a href="">FORUMS</a></li>
            <li><a href="">PROMOTIONS</a></li>
            <li><a href="">SIGN IN</a></li>
            <li><a href="">NEWS</a></li>
          </ul>
        </div>
        <div class="conteyner">
          <p class="conteynerp">
            archive
          </p>
          <ul class="conteynerlist">
            <li><a href="">MAY 2011</a> (24)</li>
            <li><a href="">JULY 2011</a> (24)</li>
            <li><a href="">SEPTEMBER 2011</a> (24)</li>
            <li><a href="">NOVEMBER 2011</a> (24)</li>
            <li><a href="">MARCH 2012</a> (24)</li>
          </ul>
        </div>
        <div class="clear"></div>
        <div class="copy">
          &copy; <?php echo data(CORE::$CREATED); ?> | <a href="" class="company"> PRIVAT SITE</a>
        </div>
        <div class="sites">
          <div class="sites2">
            <div><a class="sitessss" href=""></a></div>
            <div><a class="sitessss2" href=""></a></div>
            <div><a class="sitessss3" href=""></a></div>
            <div><a class="sitessss4" href=""></a></div>
            <div class="clear"></div>
          </div>
        </div>
      </div>    
    </div>
  </div>
</body>
</html>