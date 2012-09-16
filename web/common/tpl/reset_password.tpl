<script type="text/javascript">
<!--
function is_email(email) {
	var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
	return pattern.test(email);
};
$(".frm").submit(function() {
	$("#loader").fadeIn(300, function(){
		var email = $("#email").val();
		var password = $("#pass").val();
		var password2 = $("#pass2").val();
		
		if(!is_email(email)){
			apprise("L'indirizzo e-mail non è valido", {"textOk": "Ok"}, function(r){
				if(r){
					$("#email").focus();
					$("#loader").fadeOut(300);
				}
			});
		} else {
			if(password.length <= 4){
				apprise("La password è troppo corta", {"textOk": "Ok"}, function(r){
					if(r){
						$("#pass").focus();
						$("#loader").fadeOut(300);
					}
				});
			} else {
				if(password != password2){
					apprise("Le password non sono identiche", {"textOk": "Ok"}, function(r){
						if(r){
							if(password2.length == 0){
								var focusubject = "pass2";
							} else {
								var focusubject = "pass";
							}
							$("#" + focusubject).focus();
							$("#loader").fadeOut(300);
						}
					});
				} else {
					$.post("common/include/funcs/_ajax/reset_user_password.php", {email: $("#email").val(), password: $("#pass").val(), url: $("#url").val()}, function(data){
						var response = data.split("::");
						switch(response[response.length-1]){
							case "saved":
								apprise("<b>Reset avvenuto con successo!</b><br /><br />Controlla la posta per riattivare la tua utenza", {"textOk": "Ok"}, function(r){
									if(r){
										$.load_content("login");
										$("#loader").fadeOut(300);
									}
								});
								break;
							case "user unexists":
								apprise("L'utente non esiste");
								break;
							default:
								apprise(data, {"textOk": "Ok"});
								$("#loader").fadeOut(300);
								break;
						}
					});
				}
			}
		}
	});
	return false;
});
-->
</script>
<form id="register_frm" action="" method="post" class="frm">
	<fieldset>
		<legend>Modulo di reset della password personale</legend>
		<table>
			<tr>
				<td>
					<input type="email" name="email" id="email" placeholder="Indirizzo e-mail" value="" />
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>
					<input type="password" name="pass" id="pass" placeholder="Nuova password" autocomplete="false" value="" />
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="pass2" id="pass2" placeholder="Ripeti nuova password" autocomplete="false" value="" />
				</td>
			</tr>
		</table>
	</fieldset>
	<button id="register_user">Prosegui</button>
</form>