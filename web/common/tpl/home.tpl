<script type="text/javascript">
<!--
$(document).ready(function(){
	if($.cookie("cp_login") == null){
		$("#personal_td a").attr("onclick", "$.load_content('login')").append("ACCEDI");
	} else {
		$("#personal_td a").attr("onclick", "$.load_content('personal')").append("AREA PERSONALE");
	}
});
</script>
<table cellpadding="0" cellspacing="0" style="text-align: center;">
	<tr>
		<td style="width: 33%;">
			<a href="javascript:void(0);" onclick="$.load_content('config_page')">
				<img src="common/media/img/application_128_333.png" /><br />
				<br />
				CONFIGURAZIONE DEL DEVICE
			</a>
		</td>
		<td style="width: 33%;">
			<a href="javascript:void(0);" onclick="$.load_content('editor')">
				<img src="common/media/img/upload_128_333.png" /><br />
				<br />
				EDITOR
			</a>
		</td>
		<td style="width: 33%;" id="personal_td">
			<a href="javascript:void(0);" onclick="">
				<img src="common/media/img/user_profile_run_128_333.png" /><br />
				<br />
			</a>
		</td>
	</tr>
</table>