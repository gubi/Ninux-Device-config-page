<?php
function error($txt){
	header("Content-type: text/plain;");
	print $txt;
}
?>