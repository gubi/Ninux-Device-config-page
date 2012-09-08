<?php
header("Content-type: text/plain");

if(isset($_POST["script"]) && trim($_POST["script"]) !== ""){
	$save_dir = "../../etc/config/eigennet";
	$fh = fopen($save_dir, "w");
	if(fwrite($fh, stripslashes($_POST["script"]))){
		print "saved";
	} else {
		print "error";
	}
} else {
	print "none";
}
?>