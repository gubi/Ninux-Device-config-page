<script type="text/javascript">
<!--
$("#login_frm").submit(function(){
	$.post("common/include/funcs/_ajax/login.php", $(this).serialize(), function(data){
		switch(data){
			case "accepted":
				window.location.href = "";
				break;
			case "rejected":
				apprise("I dati inseriti non sono corretti");
				break;
			default:
				apprise(data);
				break;
		}
	});
	return false;
});
-->
</script>
<fieldset>
	<legend>Modulo di login</legend>
	<table id="login">
		<tr>
			<td>
				<form id="login_frm" action="" method="post" class="frm">
					<table>
						<tr>
							<td valign="bottom">
								<input type="text" name="user" placeholder="Indirizzo e-mail" value="" />
							</td>
						</tr>
						<tr>
							<td valign="top">
								<input type="password" name="pass" placeholder="Password" autocomplete="false" value="" />
							</td>
						</tr>
					</table>
					<button id="login_btn">Accedi</button>
				</form>
			</td>
			<td>
				<ul>
					<li><a href="javascript: void(0);" onclick="$.load_content('reset_password')">Password dimenticata</a></li>
				</ul>
				<ul>
					<li><a href="javascript: void(0);" onclick="$.load_content('register')">Registrati</a></li>
				</ul>
			</td>
		</tr>
	</table>
</fieldset>