<html>
<script type="text/javascript">
<!--
jQuery.download = function(url, data, method){ if( url && data ){ data = typeof data == 'string' ? data : jQuery.param(data); var inputs = ''; jQuery.each(data.split('&'), function(){ var pair = this.split('='); inputs+='<input type="hidden" name="'+ pair[0] +'" value="'+ pair[1] +'" />'; }); jQuery('<form action="'+ url +'" method="'+ (method||'post') +'">'+inputs+'</form>').appendTo('body').submit().remove(); }; };
function add_zero(item){ if(item <= 9){ item = "0" + item; } return item; }
$(document).ready(function(){
	if($.cookie("cp_login") != null){
		$("#save_editor_btn").after('<button id="export_btn" class="save" style="margin-right: 10px;">Esporta</button>');
		$(".editor_frm table tbody").prepend('<tr><td>Nome della configurazione:</td><td id="config_name_td"><input type="text" name="config_name" id="config_name" style="width: 100%;" value="" ><input type="hidden" name="user_email" id="user_email" value="' + $.cookie("cp_login") + '" ></td></tr>');
		
		var saved = "";
		setInterval(function() {
			if($.trim($("#config_name").val()) == ""){
				var title = $("#config_name").attr("placeholder");
				title.replace(" (salvato)");
			} else {
				var title = $("#config_name").val();
			}
			if($.trim($("#script").val()) != ""){
				$.post("common/include/funcs/_ajax/save_temp_config.php", {session_id: $("#session_id").val(), user_email: $("#user_email").val(), title: $("#config_name").val(), script: $("#script").val()}, function(data){
					switch(data){
						case "ok":
							saved = "  (salvato)";
							$("#notify").notify("create", {
								title: "Salvato!",
								text: 'Lo script "' + title + '" è stato salvato nei temporanei'
							});
							break;
						case "Nessun utente identificato":
							apprise("<b>Oooops...</b><br /><br />La tua sessione &egrave; scaduta!<br />Il file &egrave; stato salvato nei temporanei ma rischi problemi di sessione...<br />Rieffettua il login al pi&ugrave; presto");
						default:
							if(data != ""){
								alert(data);
							}
							break;
					}
				});
			} else {
				saved = "";
			}
		}, 600000);
		setInterval(function() {
			if($.trim($("#config_name").val()) == ""){
				var data = new Date();
				$("#config_name").attr("placeholder", "Config del " + add_zero(data.getDate()) + "/" + add_zero(data.getMonth() + 1) + "/" + data.getFullYear() + " " + add_zero(data.getHours()) + ":" + add_zero(data.getMinutes()) + ":" + add_zero(data.getSeconds()) + saved);
			}
		}, 1000);
	}
	$(".left").click(function() {
		window.onbeforeunload = null;
		$.load_content(history[history.length-2]);
		return false;
	});
	$("#save_editor_btn, #export_btn").click(function() {
		if($.cookie("cp_login") != null && $(this).attr("id") != "export_btn"){
			if($.trim($("#config_name").val()) == ""){
				var title = $("#config_name").attr("placeholder");
				title.replace(" (salvato)");
			} else {
				var title = $("#config_name").val();
			}
			$.post("common/include/funcs/_ajax/save_config.php", {session_id: $("#session_id").val(), user_email: $("#user_email").val(), title: $("#config_name").val(), script: $("#script").val(), export: "false"}, function(data){
				switch(data){
					case "ok":
						saved = "  (salvato)";
						$("#notify").notify("create", {
							title: "Salvato!",
							text: 'Lo script "' + title + '" è stato salvato'
						});
						break;
					case "Nessun utente identificato":
						apprise("<b>Oooops...</b><br /><br />La tua sessione &egrave; scaduta!<br />Il file &egrave; stato salvato nei temporanei ma rischi problemi di sessione...<br />Rieffettua il login al pi&ugrave; presto");
					default:
						if(data != ""){
							alert(data);
						}
						break;
				}
			});
		} else {
			window.onbeforeunload = function(){ return null };
			$.download("common/include/funcs/_ajax/save_config.php", "export=true&script=" + $("#script").val());
		}
		return false;
	});
});
if($("#page").val() == "editor"){
	window.onbeforeunload = function(){ return 'onbeforeunload' };
} else {
	window.onbeforeunload = function(){ return null };
}
//-->
</script>
<p>
	A seguire le configurazioni generate per il device.<br />
	&Egrave; possibile modificare queste configurazioni, che una volta salvate si troveranno nella directory di config (<tt>/etc/config/eigennet</tt>).<br />
</p>
<hr />
<br />
<form class="editor_frm" action="" method="post">
	<table cellspacing="10" cellpadding="10">
		<tr>
			<td colspan="2" style="padding-top: 10px;">
				<textarea name="script" id="script" style="width: 100%; height: 450px;"></textarea>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td style="width: 20%;">
				<button class="left">Torna indietro</button>
			</td>
			<td>
				<button id="save_editor_btn" class="save">Salva</button>
			</td>
		</tr>
	</table>
</form>