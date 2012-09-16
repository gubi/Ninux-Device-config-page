<?php
header("Content-type: text/plain; charset=utf8;");
require_once("../../.mydb.inc.php");
require_once("../error_state.php");

if(isset($_POST["script"]) && trim($_POST["script"]) !== ""){
	if(isset($_COOKIE["cp_login"]) && $_POST["export"] == "false"){
		$email = $_POST["user_email"];
		if(trim($_POST["title"]) == ""){
			$title = "Config del " . date("d/m/Y H:m:s");
		} else {
			$title = trim($_POST["title"]);
		}
		$session_id = $_POST["session_id"];
		
		// Get the user id
		$check_user_id = $pdo->prepare("select `id` from `ninux_cp_users` where `email` = '" . addslashes($email) . "'");
		if($check_user_id->execute()){
			if($check_user_id->rowCount() > 0){
				while($dato_user = $check_user_id->fetch()){
					$user_id = $dato_user["id"];
					// Check existing session
					$check_session = $pdo->prepare("select * from `ninux_cp_personal_configs` where `user_id` = '" . addslashes($user_id) . "' and `session_id` = '" . addslashes($session_id) . "'");
					if($check_session->execute()){
						if($check_session->rowCount() > 0){
							$check_changes = $pdo->prepare("select `title`, `config` from `ninux_cp_personal_configs` where `user_id` = '" . addslashes($user_id) . "' and `session_id` = '" . addslashes($session_id) . "'");
							if($check_changes->execute()){
								if($check_changes->rowCount() > 0){
									while($dato_changes = $check_changes->fetch()){
										if(trim($_POST["script"]) !== $dato_changes["config"] || trim($_POST["title"]) !== $dato_changes["title"]){
											$update = $pdo->prepare("update `ninux_cp_personal_configs` set `title` = '" . addslashes($title) . "', `config` = '" . addslashes(trim($_POST["script"])) . "', `is_temp` = '0' where `user_id` = '" . addslashes($user_id) . "' and `session_id` = '" . $session_id . "'");
											if($update->execute()){
												print "ok";
											} else {
												error("Non è stato possibile effettuare la query (update config)");
											}
										}
									}
								} else {
									print "none";
								}
							} else {
								error("Non è stato possibile effettuare la query (confronto cambiamenti)");
							}
						} else {
							$save = $pdo->prepare("insert into `ninux_cp_personal_configs` (`user_id`, `session_id`, `title`, `config`, `is_temp`) values(:user_id, :session_id, :title, :config, :is_temp)");
							if($save->execute(array(":user_id" => addslashes($user_id), ":session_id" => addslashes($_POST["session_id"]), ":title" => addslashes($title), ":config" => addslashes(trim($_POST["script"])), ":is_temp" => "0"))){
								print "ok";
							} else {
								error("Non è stato possibile effettuare la query (save config)");
							}
						}
					} else {
						error("Non è stato possibile effettuare la query (identificazione utente)");
					}
				}
			} else {
				error("Nessun utente identificato");
			}
		} else {
			error("Non è stato possibile effettuare la query (identificazione utente)");
		}
	} else {
		header("Pragma: public");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Cache-Control: private", false);
		header("Content-Disposition: attachment; filename=\"eigennet\"");
		header("Content-Type: text/plain");
		header("Content-Transfer-Encoding: binary");
		header("Connection: close");
		print stripslashes($_POST["script"]);
	}
} else {
	error("none");
}
?>