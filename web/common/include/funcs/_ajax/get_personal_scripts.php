<?php
header("Content-type: application/json; charset=utf8;");
require_once("../../.mydb.inc.php");
require_once("../error_state.php");

if(isset($_POST)){
	$email = $_POST["user_email"];
	$session_id = $_POST["session_id"];
	
	$check_user_id = $pdo->prepare("select `id` from `ninux_cp_users` where `email` = '" . addslashes($email) . "'");
	if($check_user_id->execute()){
		if($check_user_id->rowCount() > 0){
			while($dato_user = $check_user_id->fetch()){
				$user_id = $dato_user["id"];
				
				// Check existing session
				$check_session = $pdo->prepare("select * from `ninux_cp_personal_configs` where `user_id` = '" . addslashes($user_id) . "' and `session_id` = '" . addslashes($session_id) . "' order by `date` desc");
				if($check_session->execute()){
					if($check_session->rowCount() > 0){
						$id = -1;
						while($dato_session = $check_session->fetch()){
							$id++;
							$config_items["script"][$id]["id"] = $dato_session["id"];
							$config_items["script"][$id]["session_id"] = $dato_session["session_id"];
							$config_items["script"][$id]["title"] = stripslashes($dato_session["title"]);
							$config_items["script"][$id]["config"] = stripslashes($dato_session["config"]);
							$config_items["script"][$id]["is_temp"] = $dato_session["is_temp"];
							$config_items["script"][$id]["date"] = $dato_session["date"];
						}
						print json_encode($config_items);
					} else {
						error("");
					}
				} else {
					error("Non è stato possibile effettuare la query (identificazione utente)");
				}
			}
		}
	} else {
		error("Non è stato possibile effettuare la query");
	}
} else {
	error("null");
}
?>