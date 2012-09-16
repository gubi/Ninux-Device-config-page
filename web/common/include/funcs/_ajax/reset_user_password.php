<?php
header("Content-type: text/plain; charset=utf8;");
require_once("../../.mydb.inc.php");
require_once("../error_state.php");

if(isset($_POST)){
	$email = addslashes($_POST["email"]);
	$password = sha1(addslashes($_POST["password"]));
	
	$check_user = $pdo->prepare("select `email` from `ninux_cp_users` where `email`= '" . $email . "'");
	if($check_user->execute()){
		if($check_user->rowCount() == 1){
			$token = uniqid(mt_rand(), true);
			$new_user = $pdo->prepare("update `ninux_cp_users` set `password` = '" . $password . "', `token` = '" . $token . "', `is_active` = '0' where `email` = '" . $email . "'");
			if($new_user->execute()){
				require_once("../mail.send.php");
				
				$messaggio = "Ciao,\r\nhai richiesto il reset della password per accedere al sistema di configurazione dei device e questa è una mail di conferma.\r\nPer riattivare il tuo account fai click sul link a seguire, oppure copialo e incollalo nella barra degli indirizzi del tuo browser.\r\n\r\n" . $_POST["url"] . "?token=" . quoted_printable_encode("=___" . $token) . "\r\n\r\nA presto!\r\n\r\n--=20\r\nNinux Community Network\r\nhttp://www.ninux.org";
				if(send_mail($email, "Reset di accesso al sistema automatico di configurazione dei device", $messaggio)){
					print "::saved";
				}
			} else {
				error("::Non è stato possibile salvare la nuova utenza");
			}
		} else {
			error("::user unexists");
		}
	} else {
		error("::Non è stato possibile confrontare le utenze");
	}
} else {
	error("::null");
}
?>