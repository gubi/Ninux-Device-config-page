<html>
	<script type="text/javascript">
	<!--
		var pointingPainterCicle;
		var btwPainterCicle;
		
		function clearWorking() {
			clearInterval(btwPainterCicle);
			clearInterval(pointingPainterCicle);
			document.getElementById('worker').innerHTML = "";
		}

		function loadHome() {
			clearWorking();
			document.getElementById('worker').innerHTML = "";
		}

		function loadPointing() {
			clearWorking();
			document.getElementById('worker').innerHTML = '<table id="pointingTable" cellspacing="5" cellpadding="5"></table>';
			refreshPointing();
			pointingPainterCicle = setInterval("refreshPointing();",800);
		}
		function pointingPaint(){}
		function refreshPointing() {
			pointingCGI = document.createElement('script');
			pointingCGI.setAttribute("type","text/javascript");
			pointingCGI.setAttribute("src", "cgi-bin/pointing.cgi");
			document.getElementsByTagName("head")[0].appendChild(pointingCGI);
			pointingPaint();
		}

		function loadBWT() {
			clearWorking();
			document.getElementById('worker').innerHTML = '<table cellspacing="5" cellpadding="5"><tr><td>Server:</td><td><input id="serverinput" type="text" name="server"></input></td><td><a id="bwtStartA" href="JavaScript:bwtStart()">Start</a></td></tr></table><hr /><table id="bwtTable" cellspacing="5" cellpadding="5"></table>';
			
		}
		function bwtStart() {
			var startbwturl = "cgi-bin/startbwt.cgi?server="
			startbwturl += document.getElementById('serverinput').value
			startbwtCGI = document.createElement('script');
			startbwtCGI.setAttribute("type","text/javascript");
			startbwtCGI.setAttribute("src", startbwturl);
			document.getElementsByTagName("head")[0].appendChild(startbwtCGI);
			document.getElementById('bwtTable').innerHTML = '<tr><td>Simmetric:</td><td>Server &#8596; Client</td><td id="BWTsimmetric">...</td></tr><tr><td>Asimmetric:</td><td>Server &#8594; Client</td><td id="BWTasimSC">...</td></tr><tr><td>Asimmetric:</td><td>Server &#8592; Client</td><td id="BWTasimCS">...</td></tr>'
			btwPainterCicle = setInterval("refreshBWT();",1000);
		}
		function bwtPaint(){}
		function refreshBWT() {
			bwtCGI = document.createElement('script');
			bwtCGI.setAttribute("type","text/javascript");
			bwtCGI.setAttribute("src", "cgi-bin/bwtclient.cgi");
			document.getElementsByTagName("head")[0].appendChild(bwtCGI);
			bwtPaint();
		}
	//-->
	</script>
	<div id="worker_menu">
		<table cellspacing="5" cellpadding="5" style="text-align: center;">
			<tr>
				<td><a href="JavaScript:loadHome()">Home</a></td>
				<td><a href="JavaScript:loadPointing()">Pointing</a></td>
				<td><a href="JavaScript:loadBWT()">Bandwidth Test</a></td>
			</tr>
		</table>
	</div>
	<hr />
	<div id="worker"></div>
</html>
