<?php
function send_mail($to, $subject, $message){
	$headers = "MIME-Version: 1.0\r\nContent-type: text/plain; charset=utf-8\"\r\nContent-Transfer-Encoding: quoted-printable\r\nFrom: Ninux device Config System<config_page@ninux.org>\r\nX-Mailer: PHP/" . phpversion();
	
	if(mail($to, $subject, $message, $headers)){
		return true;
	} else {
		return false;
	}
}
?> 