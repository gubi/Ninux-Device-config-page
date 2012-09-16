<?php
header("Content-type: text/plain; charset=utf8;");
require_once("../../.mydb.inc.php");
require_once("../error_state.php");

if(isset($_COOKIE["cp_login"])) {
	$menu = $pdo->prepare("select * from `ninux_cp_menu` where `is_login_btn` = '0' order by `position` asc, `order` asc");
} else {
	$menu = $pdo->prepare("select * from `ninux_cp_menu` where `need_login` = '0' order by `position` asc, `order` asc");
}
if($menu->execute()){
	if($menu->rowCount() > 0){
		while($dato_menu = $menu->fetch()){
			$id = $dato_menu["order"] - 1;
			$menu_items[$dato_menu["position"]][$id]["id"] = $dato_menu["item_id"];
			$menu_items[$dato_menu["position"]][$id]["name"] = $dato_menu["name"];
			$menu_items[$dato_menu["position"]][$id]["title"] = $dato_menu["title"];
			$menu_items[$dato_menu["position"]][$id]["link"] = $dato_menu["link"];
		}
	}
	print json_encode($menu_items);
} else {
	error("Non è stato possibile effettuare la query");
}
?>