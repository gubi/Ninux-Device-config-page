<script type="text/javascript">
<!--
function load_editor(id){
	var title = $("#title_" + id).val();
	var config = $("#config_" + id).val();
	var session_id = $("#session_id_" + id).val();
	$.load_content("editor", function(){
		$("#session_id").val(session_id);
		$("#config_name").val(title);
		$("#script").val(config);
	});
}
$(document).ready(function(){
	if($.cookie("cp_login") != null){
		$.post("common/include/funcs/_ajax/get_personal_scripts.php", {session_id: $("#session_id").val(), user_email: $.cookie("cp_login"), title: $("#config_name").val()}, function(data){
			if(data == "" || data == null){
				$("#personal_div").html('<center><i>Non vi &egrave; ancora nessuna config personale.');
			} else {
				$("#personal_div").append('<input type="hidden" name="user_email" id="user_email" value="' + $.cookie("cp_login") + '" ><ul id="personal_list"></ul>');
				$.each(data, function(index, value){
					for (var k = 0; k < value.length; k++){
						$("#personal_list").append('<li id="personal_' + value[k].id + '"><a href="javascript: void(0);" onclick="load_editor(\'' + value[k].id + '\')">' + value[k].title + '</a><input type="hidden" id="session_id_' + value[k].id + '" value="' + value[k].session_id + '" /><input type="hidden" id="title_' + value[k].id + '" value="' + value[k].title + '" /><input type="hidden" id="config_' + value[k].id + '" value="' + value[k].config + '" /></li>');
					}
				});
			}
		}, "json");
	} else {
		$("#personal_div").html('<center><i>Non sei autorizzato ad accedere in quest\'area.<br />Effettua il <a href="javascript:void(0);" onclick="$.load_content(\'login\');">login</a> prima.');
	}
});
</script>
<div id="personal_div" style="height: 250px; overflow: auto;"></div>