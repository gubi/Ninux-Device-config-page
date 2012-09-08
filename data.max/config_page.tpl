<html>
<script type="text/javascript">
<!--
function stripsTags(text){ return $.trim($('<div>').html(text).text()); }
$(".frm").submit(function() {
	var sections = [];
	var splitted = [];
	var total_final_counter = -1;
	
	$(".section").each(function(index){
		// general, network, wireless, ...
		var section = $(this).val();
		var section_count = 0;
		var section_type_count = 0;
		
		sections[index] = [section];
		sections[index][section] = [];
		
		$(".section_type").each(function(index_type){
			var items = $(this).val().split(":");
			var section_type = items[0];
			var option_type = items[1];
			var counter = items[2]-1;
			var tot_count = items[3]-1;
			
			
			if(section == section_type){
				for (j = 0; j <= tot_count; j++){
					if(j == counter){
						if(section == section_type){
							total_final_counter++;
							$(".section_param").each(function(index_param){
								splitted = $(this).attr("name").split(":");
								if(splitted[0] == total_final_counter){
									if($(this).attr("type") == "radio"){
										if($(this).attr("checked") != "undefined" && $(this).attr("checked") == "checked"){
											sections[index][section].push([option_type, [splitted[1], $(this).val()]]);
										}
									} else {
										sections[index][section].push([option_type, [splitted[1], $(this).val()]]);
									}
								}
							});
						}
					}
				}
			}
		});
	});
	// Carica l'editor
	$.load_content("editor", function(){
		var sec = "";
		$.each(sections, function(item, data){
			sec += "config section '" + data + "'\n";
			// Converte l'array dei risultati in stringa
			for (h = 0; h < data[data].length; h++){
				$.each(data[data][h], function(item2, data2){
					if(item2 == 0){
						sec += "	" + data[data][h][0] + " " + data[data][h][1][0] + " '" + data[data][h][1][1] + "'\n";
					}
				});
			}
				sec += "\n";
		});
		// Inserisce la stringa nell'editor
		$("#script").val(sec);
	});
	return false;
});
$(document).ready(function() {
	var ii = -1;
	$.each(configs, function(key, value){
		var section_name = key;
		// Contatore
		var u = 0;
		$.each(value, function(k, v){
			var tot = configs[key][k].length + u;
			if(k == "label"){
				$(".frm").append('<fieldset><legend>' + v + '</legend><table id="' + section_name + '"></table></fieldset>');
			} else {
				if(u == 0){
					// Il form per la definizione della section viene creato solo una volta
					$("#" + key).append('<input class="section" type="hidden" name="section[]" value="' + key + '" />');
				}
				if(k == "list"){
					$("#" + key).append('<tr style="padding-top: 10px;"><td colspan="3">&nbsp;</td></tr>');
				}
				//console.log("Configs: ", configs[key][k].length);
				for(var i = 0; i < configs[key][k].length; i++){
					ii++;
					u++;
					switch (configs[key][k][i]["type"]){
						case "select":
							var input = '<select class="section_param" name="' + ii + ':' + configs[key][k][i]["name"] + '">';
							var help = '';
							if(configs[key][k][i]["title"] != undefined){
								var title = 'title="' + stripsTags(configs[key][k][i]["title"]) + '"';
								var help = '</td><td><i>' + configs[key][k][i]["title"] + '</i>';
							} else {
								var title = "";
								var help = '</td><td>';
							}
							$.each(configs[key][k][i]["options"], function(ckey, cvalue){
								var vals = cvalue.split("::");
								if(vals[1] != undefined && vals[1].length != 0){
									var title = 'title="' + stripsTags(vals[1]) + '"';
									vals[0] += 'ˀ';
								} else {
									var title = "";
								}
								if(vals[2] != undefined && vals[2].length != 0){
									var selected = 'selected="' + vals[2] + '"';
								} else {
									var selected = "";
								}
								input += '<option value="' + ckey + '" ' + title + selected + '>' + vals[0] + '</option>';
							});
							input += '</select>' + help;
							break;
						case "radio":
							var input = '';
							var label = '';
							var help = '';
							if(configs[key][k][i]["title"] != undefined){
								var title = 'title="' + stripsTags(configs[key][k][i]["title"]) + '"';
								var help = '</td><td><i>' + configs[key][k][i]["title"] + '</i>';
							} else {
								var title = "";
								var help = '</td><td>';
							}
							$.each(configs[key][k][i]["options"], function(rkey, rvalue){
								var vals = rvalue.split("::");
								if(vals[1] != undefined && vals[1].length != 0){
									var title = 'title="' + stripsTags(vals[1]) + '"';
								} else {
									var title = "";
								}
								if(vals[2] != undefined && vals[2].length != 0){
									var checked = ' checked="' + vals[2] + '"';
									var css_class = ' selected';
								} else {
									var checked = "";
									var css_class = "";
								}
								if(rkey == "true"){
									label += '<label class="cb-enable' + css_class + '" for="' + key + '_' + configs[key][k][i]["name"] + '_' + rkey + '"><span>' + vals[0] + '</span></label>';
								} else {
									label += '<label class="cb-disable' + css_class + '" for="' + key + '_' + configs[key][k][i]["name"] + '_' + rkey + '"><span>' + vals[0] + '</span></label>';
								}
								input += '<input type="radio" class="section_param" id="' + key + '_' + configs[key][k][i]["name"] + '_' + rkey + '" name="' + ii + ':' + configs[key][k][i]["name"] + '" value="' + rkey + '" ' + title + checked + ' />';
							});
							input = '<p class="field switch">' + label + input + '</p>' + help;
							break;
						case "textarea":
							input = '<textarea class="section_param" name="' + ii + ':' + configs[key][k][i]["name"] + '">' + configs[key][k][i]["value"] + '</textarea>';
							break;
						default:
							var help = '';
							if(configs[key][k][i]["title"] != undefined){
								var title = 'title="' + stripsTags(configs[key][k][i]["title"]) + '"';
								var help = '</td><td><i>' + configs[key][k][i]["title"] + '</i>';
							} else {
								var title = "";
								var help = '</td><td>';
							}
							if(configs[key][k][i]["placeholder"] != undefined){
								var placeholder = 'placeholder="' + configs[key][k][i]["placeholder"] + '"';
							} else {
								var placeholder = "";
							}
							if(configs[key][k][i]["maxlength"] != undefined){
								var size = parseInt(configs[key][k][i]["maxlength"])-1;
								var maxlength = 'maxlength="' + configs[key][k][i]["maxlength"] + '" size="' + size + '"';
							} else {
								var maxlength = "";
							}
							if (configs[key][k][i]["min"] != undefined && configs[key][k][i]["min"] != ""){
								var min = ' min="' + configs[key][k][i]["min"] + '"';
							} else {
								var min = "";
							}
							if (configs[key][k][i]["max"] != undefined && configs[key][k][i]["max"] != ""){
								var max = ' max="' + configs[key][k][i]["max"] + '"';
							} else {
								var max = "";
							}
							var input = '<input class="section_param" name="' + ii + ':' + configs[key][k][i]["name"] + '" ' + placeholder + ' ' + maxlength + ' ' + title + min + max + ' type="' + configs[key][k][i]["type"] + '" value="' + configs[key][k][i]["value"] + '" />' + help;
							break;
					}
					if(configs[key][k][i]["text"] != ""){
						$("#" + key).append('<tr><td><input class="section_type" type="hidden" name="section_type[]" value="' + section_name + ':' + k + ':' + u + ':' + tot + '" />' + configs[key][k][i]["text"] + '</td><td>' + input + '</td></tr>');
					} else {
						$("#" + key).append('<tr><td class="act_to_all"><input class="section_type" type="hidden" name="section_type[]" value="' + section_name + ':' + k + ':' + u + ':' + tot + '" />' + input + '</td><td></td></tr>');
					}
				}
			}
		});
	});
	$(".frm").append('<hr /><table><tr><td colspan="3"><button id="save_btn">Applica</button></td></tr></table>');
	
	// Forza l'input entro i range stabiliti
	$("input").each(function(){
		$(this).keyup(function(){
			var min = parseInt($(this).attr("min"));
			var max = parseInt($(this).attr("max"));
			if(min != undefined && min != "" || max != undefined && max != ""){
				if($(this).val() < min){
					$(this).val(min);
				}
				if($(this).val() > max){
					$(this).val(max);
				}
			}
		});
	});
	// Disabilita i campi all'avvio
	$(".act_to_all > p.field label").each(function(){
		if($(this).attr("class") == "cb-disable selected"){
			$(this).parents("fieldset").find("td:not(.act_to_all)").css({"color": "#ccc"}).find("label, input, textarea, select").attr("disabled", "disabled");
		}
	});
	$(".cb-enable").click(function(){
		if($(this).attr("disabled") != "disabled"){
			var parent = $(this).parents('.switch');
			$('.cb-disable',parent).removeClass('selected');
			$(this).addClass('selected');
			$('.checkbox', parent).attr('checked', true);
			if($(this).parents("td").hasClass("act_to_all")){
				$(this).parents("fieldset").find("td:not(.act_to_all)").css({"color": "#333"}).find("label, input, textarea, select").attr("disabled", false);
			}
		}
	});
	$(".cb-disable").click(function(){
		if($(this).attr("disabled") != "disabled"){
			var parent = $(this).parents('.switch');
			$('.cb-enable',parent).removeClass('selected');
			$(this).addClass('selected');
			$('.checkbox', parent).attr('checked', false);
			if($(this).parents("td").hasClass("act_to_all")){
				$(this).parents("fieldset").find("td:not(.act_to_all)").css({"color": "#ccc"}).find("label, input, textarea, select").attr("disabled", "disabled");
			}
		}
	});
});
window.onbeforeunload = function(){ return 'onbeforeunload' };
-->
</script>
<p>
	Benvenut* nella pagina di configurazione del device.
</p>
<br />
<form method="post" action="" class="frm"></form>
</html>