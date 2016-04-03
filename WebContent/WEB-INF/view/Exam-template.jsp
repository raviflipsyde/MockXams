<!DOCTYPE html>

<%@page import="myTest.entities.Question"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myTest.entities.QuestionSet"%>
<%@page import="myTest.entities.Test1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<!-- saved from url=(0058)http://ironsummitmedia.github.io/startbootstrap-blog-post/ -->
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>TEST</title>

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value="/resources/css/blog-post.css" />"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<script src="<c:url value="/resources/jquery-ui/jquery.min.js"/> "></script>

<script src="<c:url value="/resources/jquery-ui/jquery.plugin.js"/> "></script>
<script src="<c:url value="/resources/jquery-ui/jquery.countdown.js"/> "></script>
<%-- <script src="<c:url value="/resources/top.js"/> "></script> --%>
<script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/> "></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/> "></script>



<script src="<c:url value="/resources/MathJax/MathJax.js?config=TeX-MML-AM_HTMLorMML-full"/> "></script>

<style type="text/css">
#defaultCountdown {
	height: 45px;
}
</style>


<script>

obj = JSON.parse('<%=request.getAttribute("thisTestJSON")%>');


	//initialize the first question to 1
	for(cnt=0; cnt<obj.qSet.length; cnt++){
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
			compact: true,
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

											if (answer === undefined) {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'NTAN';
												changeClassOfQuestion(
														currentQuestionId, 'clear');
											} else {
												
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
											}
											if (currentQuestionId == '1'
													&& currentSectionId == '1') {

											} else if (currentQuestionId == '1') {
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

											if (answer === undefined) {
												obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].q_status = 'NTAN';
												changeClassOfQuestion(
														currentQuestionId, 'clear');
											} else {

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
											}
											

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




</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<p>
					<span id="defaultCountdown" class="navbar-brand"></span>

				</p>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="navbar-collapse collapse"
				id="bs-example-navbar-collapse-1" aria-expanded="false"
				style="height: 1px;">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.servletContext.contextPath}/submitTest">Submit
							Test</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Post Content Column -->
			<div class="col-lg-8">


				<p>
							<span id="questionSection"> Dummy</span> /  
				<span id="innerQuesNumberDiv" >
					<b>Dummy</b>
				</span>
				
				
				</p>

				<hr>
				<!-- Preview Image -->
				
				<div class="lead" id="QuestionString"> Question Goes here!!	</div>

				
				<hr>

				<!-- Post Content -->

				
				<div id="AnswerOption">
									Answer Options goes here!!</div>				
				
				
				<hr>

				<!-- Blog Comments -->

				<!-- Comments Form -->
				<div class="well">
					&nbsp;
					<button type="submit" id="prevBtn" class="btn btn-primary" style="width: 40%;" >Previous</button>
					&nbsp;
					<button type="submit" id="answerBtn" class="btn btn-primary" style="width: 40%;">Next</button>
					&nbsp;
					<br/> 
					<br/>
					&nbsp;
					<button type="submit" class="btn btn-primary" id="deleteBtn" style="width: 40%;">Clear</button>
					&nbsp;
					<button type="submit" id="answerBtn" class="btn btn-primary" style="width: 40%;">Save</button>
					&nbsp;
				</div>

				<hr>

				<!-- Posted Comments -->




			</div>

			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4">

				<!-- Blog Search Well -->
				<div class="well">
				
				<div id="sections">						
												</div>
						
					
					
					<!-- /.input-group -->
				</div>

				<!-- Blog Categories Well -->
				<div class="well">
					<div id="quesPallet" style="height: 5%; margin-left: 5px">
						<br>
					</div>
					
					<div id="numberpanelQues"
						style="height: 303px; table-layout: auto;"></div>
						
					<!-- /.row -->
				</div>

				
			</div>

		</div>
		<!-- /.row -->

		<hr>

	</div>
	<!-- /.container -->



<script>

createSections();
loadSection(currentSectionId);

function createSections() {
	
	var sectionString = "<table width='100%'><tbody><tr>";

	for (cnt = 0; cnt < obj.qSet.length; cnt++) {
		sectionString = sectionString
				+ '<td><div  id="s'+ eval(1+cnt) +'">';
		sectionString = sectionString + '<a onclick="loadSection('
				+ eval(1+cnt)  + ');" >';
		sectionString = sectionString + '<b>'
				+ obj.qSet[cnt].questionSetDisplayName + '</b>';
		sectionString = sectionString + '</a> </div>	</td>';
	}

	sectionString = sectionString + "	</tr></tbody> </table>";

	document.getElementById("sections").innerHTML = sectionString;
}

function loadQuestionPalletes(sectionId) {
	var i;
	var output = '<table style="width: 100%;"> <tbody> <tr></tr> <tr> ';
	
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

	//document.getElementById("viewSection").innerHTML = output1;
}

function setCurrentQuestion(qno) {

	document.getElementById("QuestionString").innerHTML =  '<br/><p>'
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
					+ '<input type="radio" name="answerOpt" value="'+obj.qSet[currentSectionId-1].questions[currentQuestionId-1].answerOptions[count]+'" checked> &nbsp;'
					+ obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerOptions[count]
					+ '<br>';
		else
			ansStr = ansStr
					+ '<input type="radio" name="answerOpt" value="'+obj.qSet[currentSectionId-1].questions[currentQuestionId-1].answerOptions[count]+'">  &nbsp;'
					+ obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].answerOptions[count]
					+ '<br>';
	}

	document.getElementById("AnswerOption").innerHTML = ansStr;

	document.getElementById("innerQuesNumberDiv").innerHTML = '<b>Question No. '
			+ obj.qSet[currentSectionId - 1].questions[currentQuestionId - 1].questionNumber
			+ '</b>';
	
	document.getElementById("questionSection").innerHTML = '<b>'
				+ obj.qSet[currentSectionId - 1].questionSetDisplayName
				+ '</b>';

	MathJax.Hub.Queue(["Typeset",MathJax.Hub,"AnswerOption"]);
	MathJax.Hub.Queue(["Typeset",MathJax.Hub,"questionSection"]);
	window.scrollTo(0, 0);		

 	
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


$(window).blur(function(){
	submitTest();
	});

</script>




</body>
</html>