<html>
<script type="text/javascript">
<!--
$(document).ready(function(){
	$(".left").click(function() {
		window.onbeforeunload = null;
		$.load_content("home");
	});
	$("#save_editor_btn").click(function() {
		$.post("data/save_config.php", $("#script").serialize(), function(data){
			alert(data);
		});
		return false;
	});
});
window.onbeforeunload = function(){ return 'onbeforeunload' };
-->
</script>
<p>
	A seguire le configurazioni generate per il device.<br />
	&Egrave; possibile modificare queste configurazioni, che una volta salvate si troveranno nella directory di config (<tt>/etc/config/eigennet</tt>).<br />
</p>
<form class="editor_frm" action="" method="post">
	<table cellspacing="10" cellpadding="10">
		<tr>
			<td colspan="2">
				<textarea name="script" id="script" style="width: 100%; height: 450px;"></textarea>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td>
				<button class="left">Torna indietro</button>
			</td>
			<td>
				<button id="save_editor_btn" class="save">Salva</button>
			</td>
		</tr>
	</table>
</form>