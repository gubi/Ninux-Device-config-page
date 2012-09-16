<?php
header("Content-type: text/plain; charset=utf8;");
require_once("../../.mydb.inc.php");
require_once("../error_state.php");

if(isset($_POST)){
	$user = $pdo->prepare("select * from `ninux_cp_users` where `email` = '" . addslashes($_POST["user"]) . "' and `is_active` = '1'");
	if($user->execute()){
		if($user->rowCount() > 0){
			while($dato_user = $user->fetch()){
				if(sha1($_POST["pass"]) == $dato_user["password"]) {
					setcookie("cp_login", $_POST["user"], time()+3600, "/");
					print "accepted";
				} else {
					print "rejected2";
				}
			}
		} else {
			print "rejected";
		}
	} else {
		error("Non è stato possibile effettuare la query");
	}
} else {
	error("null");
}
?>