<?php
header("Content-type: text/plain; charset=utf8;");
require_once("../../.mydb.inc.php");
require_once("../error_state.php");

if(isset($_GET["id"]) && trim($_GET["id"]) !== ""){
	$content = $pdo->prepare("select * from `ninux_cp_content` where `item_id` = '" . addslashes($_GET["id"]) . "'");
	if($content->execute()){
		if($content->rowCount() > 0){
			while($dato_content = $content->fetch()){
				$content_items["title"] = $dato_content["title"];
				$content_items["file"] = $dato_content["file"];
			}
		}
		print json_encode($content_items);
	} else {
		error("Non è stato possibile effettuare la query");
	}
} else {
	error("null");
}
?>