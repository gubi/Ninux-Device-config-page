<?php
session_start();
require_once("common/include/.mydb.inc.php");
require_once("common/include/funcs/error_state.php");

$absolute_path = (__FILE__);
$url = "http://" . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"];

if(isset($_GET["token"]) && trim($_GET["token"]) !== ""){
	$token_ = explode("___", addslashes($_GET["token"]));
	$token = $token_[1];
	$check = $pdo->query("select `is_active` from `ninux_cp_users` where `token` = '" . $token . "'");
	if($check->rowCount() > 0){
		while($dato_check = $check->fetch()){
			if($dato_check["is_active"] == "0"){
				$new_user = $pdo->prepare("update `ninux_cp_users` set `is_active` = '1' where `token` = '" . $token . "'");
				$new_user->execute();
			}
		}
	}
	header("Location: " . str_replace("?" . $_SERVER["QUERY_STRING"], "", $url));
}
if(isset($_GET["logout"]) && trim($_GET["logout"]) !== ""){
	setcookie("cp_login", "", time()-3600, "/");
	header("Location: " . str_replace("?" . $_SERVER["QUERY_STRING"], "", $url));
}
?>
<html>
<head>
	<title>Ninux.org - Config page</title>
	
	<base href="./" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="Ninux.org Community - the Ninux Software Team" />
	<meta name="description" content="Ninux.org device config page" />
	
	<link rel="shortcut icon" href="common/media/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="common/css/main.css" type="text/css" media="screen" />
	<script type="text/javascript" src="common/js/jquery-1.8.1.min.js"></script>
		<script src="common/js/jquery.cookie.js"></script>
		<!-- Apprise plugin -->
		<link rel="stylesheet" href="common/js/apprise/apprise.min.css" type="text/css" media="screen" />
		<script type="text/javascript" src="common/js/apprise/apprise-1.5.min.js"></script>
		<!-- jquery-notify plugin -->
		<link rel="stylesheet" href="common/js/jquery-notify/ui.notify.css" type="text/css" media="screen" />
		<script type="text/javascript" src="common/js/jquery-ui-1.8.23.custom.min.js"></script>
		<script type="text/javascript" src="common/js/jquery-notify/src/jquery.notify.min.js"></script>
	
	<script type="text/javascript" src="common/js/configs.js"></script>
	<script type="text/javascript">
	var menu;
	var history = new Array();
	function stripslashes(str) { str = str.replace(/\\'/g,'\''); str = str.replace(/\\"/g,'"'); str = str.replace(/\\0/g,'\0'); str = str.replace(/\\\\/g,'\\'); return str; }
	$.extend({
		load_content: function(content, callback){
			history.push(content);
			if (history[history.length-2] != content){
				$.get("common/include/funcs/_ajax/get_content.php", {id: content}, function(content_data){
					$("#loader").fadeIn(300, function(){
						$("#page").val(content);
						$("#content").animate({opacity: 0}, function() {
							$("#content > h1").text(content_data.title);
							$.get("common/tpl/" + content_data.file, function(content){
								$("#page_content").html(content);
								
								$("#content").animate({opacity: 1}, function(){
									$("#loader").fadeOut(300);
								});
								if(typeof callback == "function"){
									callback.call(this, content);
								}
							});
						});
					});
				}, "json");
			}
		}
	})
	$(document).ready(function() {
		$("#loader").fadeIn(300, function(){
			var search_bar = $("#top_menu > table tr:first-child").html();
			$.get("common/include/funcs/_ajax/get_menu.php", function(menu){
				$("#top_menu > table tr:first-child").html("");
				$.each(menu, function(position, items){
					$("#top_menu > table tr:first-child").append('<td id="' + position + '"><ul></ul></td>');
					$.each(items, function(item_count, item){
						if(item.link.length == 0){
							var item_link = "javascript: void(0);";
						} else {
							var item_link = item.link;
						}
						$("#" + position + ' ul').append('<li><a href="' + item_link + '" id="' + item.id + '" title="' + item.title + '">' + item.name + '</a>');
					});
				});
				$("#top_menu > table tr:first-child").append(search_bar);
				$("#top_menu").animate({top: "0px"}, 600);
				
				$("#top_menu a").click(function(arg){
					$.load_content($(this).attr("id"));
				});
			}, "json");
		});
		$.load_content($("#page").val());
		$container = $("#notify").notify();
	});
	</script>
</head>
<body>
	<div id="notify" style="display: none">
		<div id="basic-template">
			<h1>#{title}</h1>
			<p>#{text}</p>
		</div>
		<div id="advanced-template"></div>
	</div>
	<input type="hidden" name="session_id" id="session_id" value="<?php print session_id(); ?>" />
	<input type="hidden" name="url" id="url" value="<?php print $url; ?>" />
	<input type="hidden" id="device" value="$device" />
	<input type="hidden" id="page" value="home" />
	<div id="loader"></div>
	<div id="top_menu">
		<table>
			<tr>
				<td rowspan="2">
					<div id="search">
						<form action="http://ninuxoo.ninux.org/cgi-bin/ninuxoo.cgi" method="get">
							<input type="search" value="" placeholder="Cerca in Ninuxoo" name="q">
							<input type="submit" value="" style="display: none;">
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="main_container">
		<div id="header">
			<a href="javascript:void(0);" onclick="$.load_content('home');">
				<img src="common/media/img/logo.png" alt="Logo NINUX" />
			</a>
		</div>
		<div id="container">
			<div id="content">
				<h1></h1>
				<h2 id="title"></h2>
				<div id="page_content"></div>
			</div>
			<div id="footer">
				Config page powered by Ninux.org ~ the Ninux Software Team :: used icons made by <a href="http://www.picol.org/" target="_blank" title="PIctorial COmmunication Language - Richiede inoltro a Internet">Picol project</a>
			</div>
		</div>
	</div>
</body>
</html>
