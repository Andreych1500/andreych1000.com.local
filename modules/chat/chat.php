<?php 
Core::$META['title'] = 'chat';
Core::$JS[] =  '<script type="text/javascript" src="/skins/default/js/chat.js?v=1"></script>';

if(isset($_SESSION['user']) && ($_SESSION['user']['access'] == 1 || $_SESSION['user']['access'] == 5)){
		
	$if_isset_user = q("
		SELECT *
		FROM `online2chat_user`
		WHERE `name` = '".mres($_SESSION['user']['login'])."'
		LIMIT 1
	");

		
	if($if_isset_user->num_rows){
		q("
			UPDATE `online2chat_user` SET
			`date` = NOW()
			WHERE `name` = '".mres($_SESSION['user']['login'])."'
		");	
	} else {
		q("
			INSERT INTO `online2chat_user` SET
			`name` = '".mres($_SESSION['user']['login'])."',
			`date` = NOW()
		");
	}
	
	if(isset($_REQUEST['more_user'])){		
		$user = q("
			SELECT *
			FROM `online2chat_user`
			WHERE `date` > NOW() - INTERVAL 20 SECOND
		");
	} elseif(!isset($_REQUEST['stop_code'])){
		$user = q("
			SELECT *
			FROM `online2chat_user`
			WHERE `date` > NOW() - INTERVAL 20 SECOND
		");
	}
	
	
	
	if(isset($_POST['message'])){
		$_POST = trimall($_POST);
		$errors = array();
		
		if(empty($_POST['message'])){
			$errors['message'] = 'Для того щоб відправити повідомлення введіть текст';	
		}
		if(!count($errors)){
			q("INSERT INTO `chat_msg` SET
				`user_name` = '".mres($_SESSION['user']['login'])."',
				`message`   = '".mres($_POST['message'])."',
				`date_message` = '".mres(date("Y-m-d H:i:s"))."'
			");

			$result = array(
				"user_name" => mres($_SESSION['user']['login']),
				"message"   => mres($_POST['message']),
				"date_message" => date("Y-m-d H:i:s"),
				"last_id"      => DB::_()->insert_id,
				"access_user"  => intval($_SESSION['user']['access']),
			);
			echo json_encode($result);
			exit();
		}
	}
	
	if(!isset($_REQUEST['last_mess_id'])){
		$_REQUEST['last_mess_id'] = $new_message['last_id'] = 0;
	}
	

	if(isset($_REQUEST['stop_code']) && $_REQUEST['last_mess_id']>0){
		$message = q("
			SELECT * 
			FROM `chat_msg` 
			WHERE `id` > '".mres($_REQUEST['last_mess_id'])."' OR (`removed` = 1 AND `date_message` > NOW() - INTERVAL 20 SECOND)
		");	
			
	} else {
		$message = q("
			SELECT * 
			FROM `chat_msg` 
			WHERE `date_message` > NOW() - INTERVAL 10 MINUTE AND `removed` < 1
		");	
	}
	
	while($last_message_chat = $message->fetch_assoc()) {
		$new_message['last_id']=intval($last_message_chat['id']);
		$new_message['user_access'] = intval($_SESSION['user']['access']);
		$new_message[$last_message_chat['id']]=$last_message_chat;
	}	
	
	
	$new_message['status'] = 'ok';	
	
	if(isset($_REQUEST['message'])){
		echo json_encode($new_message);
		exit();
	}
	
	if(isset($_REQUEST['user_online'])){
		while($data_online = $user->fetch_assoc()){
			$reset_online_user[] = $data_online;
		}

		echo json_encode($reset_online_user);
		exit();
	}
	
	if(isset($_REQUEST['remove']) && $_SESSION['user']['access'] == 5){
		q("
			UPDATE `chat_msg` SET 
			`removed` = 1,
			`date_message` = '".mres(date("Y-m-d H:i:s"))."'
			WHERE id = '".intval($_REQUEST['remove'])."'
		");

		echo json_encode('delete:ok');
		exit();
	}
	
} else {
	header("Location: /");
	exit();
}

