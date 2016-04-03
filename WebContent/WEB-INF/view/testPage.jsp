<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<script language="JavaScript">
	//////////F12 disable code////////////////////////
	document.onkeypress = function(event) {
		event = (event || window.event);
		if (event.keyCode == 123) {
			//alert('No F-12');
			return false;
		}
	}
	document.onmousedown = function(event) {
		event = (event || window.event);
		if (event.keyCode == 123) {
			//alert('No F-keys');
			return false;
		}
	}
	document.onkeydown = function(event) {
		event = (event || window.event);
		if (event.keyCode == 123) {
			//alert('No F-keys');
			return false;
		}
	}
	/////////////////////end///////////////////////

	//Disable right click script 
	//visit http://www.rainbow.arch.scriptmania.com/scripts/ 
	var message = "Sorry, right-click has been disabled";
	/////////////////////////////////// 
	function clickIE() {
		if (document.all) {
			(message);
			return false;
		}
	}
	function clickNS(e) {
		if (document.layers || (document.getElementById && !document.all)) {
			if (e.which == 2 || e.which == 3) {
				(message);
				return false;
			}
		}
	}
	if (document.layers) {
		document.captureEvents(Event.MOUSEDOWN);
		document.onmousedown = clickNS;
	} else {
		document.onmouseup = clickNS;
		document.oncontextmenu = clickIE;
	}
	document.oncontextmenu = new Function("return false")
	// 
	function disableCtrlKeyCombination(e) {
		//list all CTRL + key combinations you want to disable
		var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j', 'w');
		var key;
		var isCtrl;
		if (window.event) {
			key = window.event.keyCode; //IE
			if (window.event.ctrlKey)
				isCtrl = true;
			else
				isCtrl = false;
		} else {
			key = e.which; //firefox
			if (e.ctrlKey)
				isCtrl = true;
			else
				isCtrl = false;
		}
		//if ctrl is pressed check if other key is in forbidenKeys array
		if (isCtrl) {
			for (i = 0; i < forbiddenKeys.length; i++) {
				//case-insensitive comparation
				if (forbiddenKeys[i].toLowerCase() == String.fromCharCode(key)
						.toLowerCase()) {
					alert('Key combination CTRL + ' + String.fromCharCode(key)
							+ ' has been disabled.');
					return false;
				}
			}
		}
		return true;
	}
</script>

<div>
	<h2>Test Page</h2>

	<fieldset>
		<body onselectstart="return false;" ondragstart="return false;">
			<div id="container">
				<div id="pWait"
					style="height: 100%; width: 100%; z-index: 1999; position: absolute; opacity: 0.4; display: none; background: grey;">
					<div style="top: 45%; position: relative; color: white">
						<center>
							<img
								src="./Instructions - Assessment Examination Center3_files/loading.gif"
								style="height: 50px; width: 50px; display: block;"><br>
							<h2>Please wait</h2>
						</center>
					</div>
				</div>

				<div id="secondPagep2" style="">

					<center>
						<span> <a
							href="${pageContext.servletContext.contextPath}/testmainpage"
							id="readylink" alt="" disabled="disabled"><font size="5">Start Test</font></a></span>
					</center>
				</div>

			</div>
</div>

<div id="footer">
	<div style="width: 100%; padding-top: 15px;">
		<center>
			<font color="white"> Version : 10.00.02</font>
		</center>
	</div>
</div>
<input type="hidden" id="defaultLang" value="12">

</body>
</fieldset>
</div>



