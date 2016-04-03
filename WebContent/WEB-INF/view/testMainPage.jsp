<%@page import="myTest.entities.Question"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myTest.entities.QuestionSet"%>
<%@page import="myTest.entities.Test1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<link rel="stylesheet"
	href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>" />
<link href="<c:url value="/resources/css/mockJee.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/numberStyle.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/jquery-ui/jquery.countdown.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/jquery-ui/jquery.min.js"/> "></script>
<script src="<c:url value="/resources/jquery-ui/jquery.plugin.js"/> "></script>
<script src="<c:url value="/resources/jquery-ui/jquery.countdown.js"/> "></script>
<%-- <script src="<c:url value="/resources/top.js"/> "></script> --%>
<script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/> "></script>

<style type="text/css">
#defaultCountdown {
	width: 100%;
	height: 45px;
}
</style>



<script>

obj = JSON.parse('<%=request.getAttribute("thisTestJSON")%>');

	//initialize the first question to 1
	for(cnt=0; cnt<obj.qSet[0].length; cnt++){
		obj.qSet[cnt].curQuestion = 1;	
	}
	
	
	//map for classes
	map = new Object();
	map['NV'] = 'not_visited';
	map['NA'] = 'not_visited';
	map['NTAN'] = 'not_answered';
	map['AN'] = 'answered';
	map['R'] = 'review';
	map['RA'] = 'review_answered';

	//initialize current section and question
	currentSectionId = 1;
	currentQuestionId = 1;

	$(function() {
		var timerDate = new Date();
		timerDate.setMinutes(timerDate.getMinutes() + obj.testDuration);
		$('#defaultCountdown').countdown({
			until : timerDate,
			format : 'MS',
			onExpiry: submitTest
		});
	});

	$('input[name="answerOpt"]').change(function() {
		//if($(this).val() == 'Yes'){    
		alert("test");
		//}
	});

	
	
	function submitTest() {
		$.post("${pageContext.servletContext.contextPath}/submitTest", {
			timeLeft : '00'
		// returning only minutes
		}, function(data, status) {

		});

	}

	function sendRequest(periods, id) {
		$
				.post(
						"${pageContext.servletContext.contextPath}/postAnswer",
						{
							answerOpt : $('input[name=answerOpt]:checked')
									.val(),
							questionSection : obj.qSet[currentSectionId - 1].questionSetName,
							questionNumber : obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].questionNumber,
							questionId : obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].id,
							requestTypeFlag : id,
							timeLeft : periods[5]
						// returning only minutes
						}, function(data, status) {

						});

	}

	$(document).ready(function() {
		$("#viewSubmitBtn").click(function() {
			submitTest();
		});
	});

	$(document).ready(function() {
		$("#submitBtn").click(function() {
			submitTest();
		});
	});
	
	
	$(document)
	.ready(
			function() {
				$("#prevBtn")
						.click(
								function() {
									var periods = $('#defaultCountdown')
											.countdown('getTimes');
									var answer = $(
											'input[name=answerOpt]:checked')
											.val();

									if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'R') {
										obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'RA';
									} else {
										obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'AN';
									}

									changeClassOfQuestion(
											currentQuestionId, 'answer');
									obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerString = answer;

									if (currentQuestionId == obj.qSet[currentSectionId - 1].questions.length
											&& currentSectionId == obj.qSet.length) {
										
									} else if (currentQuestionId == obj.qSet[currentSectionId - 1].questions.length) {
										loadSection(currentSectionId - 1);
									} else {
										questionClick(currentQuestionId - 1);
									}

								});
			});
	
	$(document)
			.ready(
					function() {
						$("#answerBtn")
								.click(
										function() {
											var periods = $('#defaultCountdown')
													.countdown('getTimes');
											var answer = $(
													'input[name=answerOpt]:checked')
													.val();

											if ((obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'NA')
													|| (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'NTAN')) {

												sendRequest(periods, '1');
											} else {

												sendRequest(periods, '2');
											}

											if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'R') {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'RA';
											} else {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'AN';
											}

											changeClassOfQuestion(
													currentQuestionId, 'answer');
											obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerString = answer;

											if (currentQuestionId == obj.qSet[currentSectionId - 1].questions.length
													&& currentSectionId == obj.qSet.length) {
												loadSection(1);
											} else if (currentQuestionId == obj.qSet[currentSectionId - 1].questions.length) {
												loadSection(currentSectionId + 1);
											} else {
												questionClick(currentQuestionId + 1);
											}

										});
					});

	$(document)
			.ready(
					function() {
						$("#deleteBtn")
								.click(
										function() {
											var periods = $('#defaultCountdown')
													.countdown('getTimes');

											sendRequest(periods, '3');

											if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'RA') {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'R';
											} else {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'NTAN';
											}

											obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerString = ' ';
											changeClassOfQuestion(
													currentQuestionId, 'clear');

											questionClick(currentQuestionId);

										});
					});

	$(document)
			.ready(
					function() {
						$("#reviewBtn")
								.click(
										function() {

											var periods = $('#defaultCountdown')
													.countdown('getTimes');
											sendRequest(periods, '0');

											if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'AN') {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'RA';
											} else if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'RA') {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'AN';
											} else if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'R') {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'NTAN';
											} else if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'NTAN') {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'R';
											}

											changeClassOfQuestion(
													currentQuestionId, 'review');

											if (currentQuestionId == obj.qSet[currentSectionId - 1].questions.length
													&& currentSectionId == obj.qSet.length) {
												loadSection(1);
											} else if (currentQuestionId == obj.qSet[currentSectionId - 1].questions.length) {
												loadSection(currentSectionId + 1);
											} else {
												questionClick(currentQuestionId + 1);
											}

										});
					});

	function loadXMLDoc() {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			//do nothing...
		}
		xmlhttp.open("POST",
				"${pageContext.servletContext.contextPath}/postAnswer", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("name=Henry&city=Ford");
	}
</script>

<!-- 
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
 -->


<div id="container">
	<div id="header">
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tbody>
				<tr>
					<td align="left" id="bannerImage"><img height="45px"
						src="<c:url value="/resources/images/banner.jpg"/>"></td>


				</tr>
			</tbody>
		</table>
	</div>

	<table style="width: 100%; border: 0px; border-color: white;">
		<tr>
			<td id="section" style="width: 75%;">
				<div id="sectionsField">
					<fieldset>
						<legend>
							<span class="sect">Section</span><span
								id="showOptionalSecSummary" style="display: none">[Attempt
								any <span id="maxOptSec"></span>&nbsp;of the <span id="noOptSec"></span>&nbsp;optional
								sections]
							</span>
						</legend>
						<div id="sections">
							
						</div>
					</fieldset>
				</div>
			</td>

			<td id="td_timer" style="width: 25%;">
				<div id="timer" style="height: 90px; vertical-align: inherit;">
					<div id="timerRightSideDiv"
						style="width: 50%; float: left;; padding-top: 7px; padding-bottom: 7px;">
						<div style="height: 50px;">
							<div style="padding-top: 8px; width: 100%;" id="showTime">
								<div id="defaultCountdown"></div>
							</div>
						</div>

						<div id="usefulDataDivRight" style="display: none;">
							<a class="blueBtn"
								href="./Assessment Exam Center4_files/Assessment Exam Center4.html"
								onclick="showHelpContent(event);"><span>Useful Data</span></a>
						</div>
						<div id="showCalc"
							style="display: none; height: 25px; padding-left: 5px; float: left; position: relative;">
							<a class="blueBtn"
								href="./Assessment Exam Center4_files/Assessment Exam Center4.html"
								onclick="loadCalculator()"><span>Calculator</span></a>
						</div>
					</div>
					<!--<div style="width:auto">
					<a id="usefulDataLink" style="display:none;" class="blueBtn" href="#" onclick="showHelpContent(event);"><span>Useful Data</span></a>
					<a id="showCalc" style="display:none;" class="blueBtn" href="#" onclick="loadCalculator()"><span>Calculator</span></a>
					<div class="clear"></div>
				</div>-->
				</div>
			</td>
		</tr>

		<tr>
			<td id="questions" style="width: 75%;">

				<div id="questionCont" style="height: 556px; display: block;">

					<div id="currentQues" style="height: 514px; overflow: auto;">

						<div class="questionTypeCont">
							<span class="content">Question Type :Multiple Choice
								Question</span>
						</div>

						<div style="height: 490px; width: 100%; overflow: auto;"
							id="quesOuterDiv">

							<div id="quesNumberDiv"
								style="height: 6%; border-bottom: 1px solid #000000; margin: 5px;">

								<div id="innerQuesNumberDiv"
									style="float: left; width: 49%; font-size: 1em; font-family: Arial, verdana, helvetica, sans-serif">
									<b>Question No. 1</b>
								</div>

								<div style="width: 49%; float: right;">
									<!-- 							<div style="float: right">
							<b>View in :</b> <select onchange="changeLang(this.value)">
								<option selected="selected" value="1">English</option>
								<option value="2">Hindi</option>
							</select>
						</div>-->
								</div>
							</div>

							<div id="quesAnsContent" style="height: 448px; overflow: auto;">
								<div id="QuestionString"
									style="width: 99%; margin-left: 5px; font-family: Arial, verdana, helvetica, sans-serif; padding-bottom: 10px;">
									Question Goes here!!</div>

								<div id="AnswerOption"
									style="width: 100%; font-family: Arial, verdana, helvetica, sans-serif; margin-top: 5px;">
									Answer Options goes here!!</div>
							</div>


						</div>
					</div>

					<div id="actionButton"
						style="width: 99%; margin-left: 1%; margin: 5px;">
						<div style="float: left">
							<input type="button" onclick="compileCode();" id="compileCodeBtn"
								class="progrmngBtn button actionBn" value="Compile"
								style="display: none">
						</div>
						<div style="float: left">
							<input type="button" onclick="executeCode();" id="submitCodeBtn"
								class="progrmngBtn button btnEnabled" value="Submit Code"
								style="display: none">
						</div>
						<div style="float: right">
							<input type="button" id="saveProgram" onclick="fnSubmit('NEXT')"
								class="progrmngBtn button actionBn" value="Save &amp; Next"
								style="display: none;">
						</div>
						<div style="float: left">
							<input type="button"  id="reviewBtn"
								class="normalBtn button actionBn"
								value="Mark for Review &amp; Next">
						</div>
						<!--<span style="float:left"><input type="button" onclick = "fnSubmit('SKIP')" class="button actionBn" value="Skip"/></span>-->
						<div style="float: left">
							<input type="button" id="deleteBtn" onclick="resetOption()"
								class="normalBtn button actionBn" value="Clear Response">
						</div>
						<div style="float: right">
							<input type="button" id="answerBtn"
								class="normalBtn button btnEnabled" value="Save &amp; Next">
						</div>
						

						<div class="clear"></div>
					</div>
				</div>
			</td>
			<td id="palletes" style="width: 25%;">
				<div id="loadCalc"
					style="display: none; position: fixed; z-index: 999; float: left; padding-top: 1%; right: 20px; top: 120px;"></div>
				<div class="numberpanel" style="height: 529px;">
					<div id="viewSection">
						<span id="viewingSect">You are viewing</span>&nbsp;<b>Physics</b>&nbsp;<span
							class="sect">Section</span>
					</div>
					<div id="quesPallet" style="height: 5%; margin-left: 5px">
						Question Palette
						<script>
							document.write(obj.qSet[0].questions.length);
						</script>
					</div>

					<div id="numberpanelQues"
						style="height: 303px; table-layout: auto;"></div>

					<div id="typingInstDiv"
						style="display: none; padding: 5px; height: 410px;">
						<div id="dataDisplayDiv" style="display: none"></div>
						<div class="question_area1">

							<!--	Correct Word Count : <span id="correctWordCount"></span>
						<br/>
						Wrong Word Count : <span id="wrongWordCount"></span>
						<br/>-->
							<table style="width: 100%">
								<tbody>
									<tr>
										<td id="keyStrokesCountTd">Keystrokes Count</td>
										<td>:</td>
										<td id="totalKeyStrokesCount"></td>
									</tr>
									<tr>
										<td id="backspaceCountTd">Backspace Count</td>
										<td>:</td>
										<td id="backSpaceCount"></td>
									</tr>
									<tr id="errorCount" style="display: none">
										<td id="errorCountTd">Error Count</td>
										<td>:</td>
										<td id="errorCountValue"></td>
									</tr>
									<tr>
										<td id="totalWordCount">Total Word Count</td>
										<td>:</td>
										<td id="totalWordCountVal"></td>
									</tr>
									<tr>
										<td id="typedWordCount">Typed Word Count</td>
										<td>:</td>
										<td id="typedWordCountVal"></td>
									</tr>
									<tr>
										<td id="remainingWordCount">Pending Word Count</td>
										<td>:</td>
										<td id="remainingWordCountVal"></td>
									</tr>
								</tbody>
							</table>
							<br> <span id="typingInstruSpan"><b>Instructions</b></span>
							<table id="restrictedInstr"
								style="display: none; margin-top: 10px">
								<tbody>
									<tr>
										<td><b>1.</b></td>
										<td>&nbsp;</td>
										<td id="resInstru1">Type the highlighted character to
											proceed further.</td>
									</tr>
									<tr>
										<td><b>2.</b></td>
										<td>&nbsp;</td>
										<td id="resInstru2">You cannot edit the typed text.</td>
									</tr>
									<tr>
										<td><b>3.</b></td>
										<td>&nbsp;</td>
										<td id="resInstru3">You are not allowed to submit before
											typing the entire text.</td>
									</tr>
									<tr>
										<td><b>4.</b></td>
										<td>&nbsp;</td>
										<td id="resInstru4">On timeout, your answer will be saved
											automatically.</td>
									</tr>
								</tbody>
							</table>
							<table id="unrestrictedInstr"
								style="display: none; margin-top: 10px">
								<tbody>
									<tr>
										<td><b>1.</b></td>
										<td>&nbsp;</td>
										<td id="unresInstru1">Type the highlighted word.</td>
									</tr>
									<tr>
										<td><b>2.</b></td>
										<td>&nbsp;</td>
										<td id="unresInstru2">You can edit the typed text.</td>
									</tr>
									<tr>
										<td><b>3.</b></td>
										<td>&nbsp;</td>
										<td id="unresInstru3">Correct/Wrong words turn Green/Red
											respectively.</td>
									</tr>
									<tr>
										<td><b>4.</b></td>
										<td>&nbsp;</td>
										<td id="unresInstru4">You are not allowed to submit
											before typing the entire text.</td>
									</tr>
									<tr>
										<td><b>5.</b></td>
										<td>&nbsp;</td>
										<td id="unresInstru5">On timeout, your answer will be
											saved automatically.</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="legend" style="margin-left: 3px; margin: 5px">
						<table width="100%" class="diff_type_notation_area_inner">
							<tbody>
								<tr>
									<td colspan="4"><b><label id="legendLabel">Legend</label></b></td>
								</tr>
								<tr>
									<td><span class="answered">&nbsp;</span></td>
									<td><label id="answeredLabel">Answered</label></td>
									<td><span class="not_answered">&nbsp;</span></td>
									<td><label id="notAnsweredLabel">Not Answered</label></td>
								</tr>
								<tr>
									<td><span class="review">&nbsp;</span></td>
									<td><label id="markedLabel">Marked</label></td>
									<td><span class="not_visited">&nbsp;</span></td>
									<td><label id="notVisitedLabel">Not Visited</label></td>
								</tr>
							</tbody>
						</table>
						<table width="100%">
							<tbody>
								<tr>
									<td width="50%"><center>
											<input type="button" id="viewProButton" class="button1"
												value="Profile" title="View Profile"
												onclick="showModule('profileDiv');activeLink(this.id)">
										</center></td>
									<td width="50%"><center>
											<input type="button" id="viewInstructionsButton"
												class="button1" value="Instructions"
												title="View Instructions"
												onclick="showModule('instructionsDiv');activeLink(this.id)">
										</center></td>
								</tr>
								<tr>
									<td id="viewQPTD"><center>
									
									<div  id="sbmtTestDiv" class="button1">
									<a href="${pageContext.servletContext.contextPath}/submitTest" class="tooltip">
									<b>Submit</b>
									</a>
									 </div>											
										</center></td>
									<!--<td><center> <input type="button" class="button" style="width:110px" id="finalSub" onclick="submitConfirmation('submit')" value="Submit" title="Submit Exam" disabled/></center></td>-->
									<td id="submitTD"><center>
											<input id="viewSubmitBtn" type="button" class="button1"
												value="Submit" title="Submit Test"	>
										</center></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="typingSubmit" style="display: none;">
						<table width="100%">
							<tbody>
								<tr>
									<td id="submitTD" width="50%"><center>
									
									<a class="blueBtn"	href="${pageContext.servletContext.contextPath}/submitTest"	>
									<span>Submit</span>
									</a>
								
								
<!-- 											<input type="button" class="typingTestButtonDisabled" -->
<!-- 												id="finalTypingSub" -->
<!-- 												onclick="fnSubmit('NEXT');calculateEllapsedTime();submitConfirmation('submit');activeLink(this.id);" -->
<!-- 												value="Submit" title="Submit Group" disabled=""> -->
										</center></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>


			</td>
		</tr>

	</table>


	<script>
	
		
		createSections();
		loadSection(currentSectionId);

		function createSections() {
			
			var sectionString = "<table width='100%'><tbody><tr>";

			for (cnt = 0; cnt < obj.qSet.length; cnt++) {
				sectionString = sectionString
						+ '<td><div class="allSections" id="s'+cnt+1+'">';
				sectionString = sectionString + '<a onclick="loadSection('
						+ cnt + 1 + ');" class="tooltip tooltipSelected">';
				sectionString = sectionString + '<b>'
						+ obj.qSet[cnt].questionSetDisplayName + '</b>';
				sectionString = sectionString + '</a> </div>	</td>';
			}

			sectionString = sectionString + "	</tr></tbody> </table>";

			document.getElementById("sections").innerHTML = sectionString;
		}

		function loadQuestionPalletes(sectionId) {
			var i;
			var output = '<table class="question_area"> <tbody> <tr></tr> <tr> ';
			alert(obj.qSet[sectionId].questions.length);
			for (i = 0; i < obj.qSet[sectionId].questions.length; i++) {
				var qno = obj.qSet[sectionId].questions[i].questionNumber;
				output = output
						+ ('<td id="qtd'+qno+'"><span title="Not Answered" class='
								+ map[obj.qSet[sectionId].questions[i].q_status]
								+ ' id="'
								+ qno
								+ '" onclick="javascript:questionClick('
								+ qno
								+ ');"> ' + qno + '</span></td>');
				if (qno % 5 == 0)
					output = output + ('</tr> <tr>');
			}

			output = output + '</tbody> </table>';
			document.getElementById("numberpanelQues").innerHTML = output;
			var output1 = '<span id="viewingSect">You are viewing</span>&nbsp;<b>'
					+ obj.qSet[sectionId].questionSetDisplayName
					+ '</b>&nbsp;<span class="sect">Section</span>';

			document.getElementById("viewSection").innerHTML = output1;
		}

		function setCurrentQuestion(qno) {

			document.getElementById("QuestionString").innerHTML = obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].id
					+ '<br/><br/><p>'
					+ obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].questionString
					+ ' </p>';
			var ansStr = " ";

			if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'NA'
					|| obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status == 'NTAN') {
				obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'NTAN';
				changeClassOfQuestion(qno, 'new');
			}

			for (count = 0; count < obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerOptions.length; count++) {
				if (obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerOptions[count] == obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerString)
					ansStr = ansStr
							+ '<input type="radio" name="answerOpt" value="'+obj.qSet[currentSectionId-1].questions[currentQuestionId-1].answerOptions[count]+'" checked>'
							+ obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerOptions[count]
							+ '<br>';
				else
					ansStr = ansStr
							+ '<input type="radio" name="answerOpt" value="'+obj.qSet[currentSectionId-1].questions[currentQuestionId-1].answerOptions[count]+'">'
							+ obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerOptions[count]
							+ '<br>';
			}

			document.getElementById("AnswerOption").innerHTML = ansStr;

			document.getElementById("innerQuesNumberDiv").innerHTML = '<b>Question No. '
					+ obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].questionNumber
					+ '</b>';

			document.getElementById("questionTypeCont").innerHTML = '<span class="content">Question Type :'
					+ obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].qtype.questionType
					+ '</span>';

		}

		function loadSection(sectionId) {

			//save the current question
			//change the class of the selected section
			obj.qSet[currentSectionId - 1].curQuestion = currentQuestionId;
			currentSectionId = sectionId;
			loadQuestionPalletes(currentSectionId - 1);
			currentQuestionId = obj.qSet[currentSectionId - 1].curQuestion;
			setCurrentQuestion(currentQuestionId);

		}

		function questionClick(questionId) {

			currentQuestionId = questionId;
			setCurrentQuestion(questionId);
		}

		function changeClassOfQuestion(questionId, action) {

			var currClass = $('#qtd' + questionId).find('span').attr('class');
			if (action == 'new') {
				$('#qtd' + questionId).find('span').attr('class',
						'not_answered');
			} else if (action == 'answer') {
				if (currClass == 'review')
					$('#qtd' + questionId).find('span').attr('class',
							'review_answered');
				else
					$('#qtd' + questionId).find('span').attr('class',
							'answered');
			} else if (action == 'review') {
				if (currClass == 'answered') {
					$('#qtd' + questionId).find('span').attr('class',
							'review_answered');
				} else if (currClass == 'review_answered') {
					$('#qtd' + questionId).find('span').attr('class',
							'answered');
				} else if (currClass == 'review') {
					$('#qtd' + questionId).find('span').attr('class',
							'not_answered');
				} else
					$('#qtd' + questionId).find('span').attr('class', 'review');

			} else if (action == 'clear') {
				if (currClass == 'review_answered')
					$('#qtd' + questionId).find('span').attr('class', 'review');
				else
					$('#qtd' + questionId).find('span').attr('class',
							'not_answered');
			}

		}
	</script>






	<div id="footer">
		<div style="width: 100%; padding-top: 15px; text-align: center;">
			<font color="white"> Version : 10.00.02</font>
		</div>
	</div>
</div>