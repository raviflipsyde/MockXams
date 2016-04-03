<%@page import="myTest.entities.UserTestData"%>
<%@page import="myTest.entities.UserTestDataAnswers"%>
<%@page import="myTest.entities.Answer"%>
<%@page import="myTest.entities.Question"%>
<%@page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<!-- saved from url=(0043)http://getbootstrap.com/examples/dashboard/ -->
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="http://getbootstrap.com/favicon.ico">

<title>Dashboard</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/dashboard.css" />" rel="stylesheet">

<script src="<c:url value="/resources/jquery-ui/jquery.min.js"/> "></script>



<script src="<c:url value="/resources/js/ie-emulation-modes-warning.js"/> "></script>



</head>

<body>

<%
HashMap<Long, Question> qsMap = (HashMap)request.getAttribute("QSMAP");
HashMap<Long, Answer> ansMap = (HashMap)request.getAttribute("ANSMAP");
HashMap<Long, UserTestDataAnswers> usrMap = (HashMap)request.getAttribute("USERMAP");
UserTestData userTestData =(UserTestData)request.getAttribute("USRTSTDATA");
		
%>

	<div class="container-fluid">
		<div class="row">
			
			<div class="col-sm-9 col-md-12  main">
				<h1 class="page-header">				</h1>

				<div class="row placeholders">
					<div class="col-xs-6 col-sm-3 placeholder">
						
						<h4>Test</h4>
						<span class="text-muted"><%=userTestData.getTest().getTestName() %> </span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						
						<h4>Score</h4>
						<span class="text-muted"><%=userTestData.getScore()%></span>
					</div>
					<!--             <div class="col-xs-6 col-sm-3 placeholder"> -->
					<!--               <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Todays Test" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiNGRkZGRkY7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4yMDB4MjAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true"> -->
					<!--               <h4>Label</h4> -->
					<%--               <span class="text-muted">Something else</span> --%>
					<!--             </div> -->
					<!--             <div class="col-xs-6 col-sm-3 placeholder"> -->
					<!--               <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Todays Result" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzM5REJBQyIvPjxnPjx0ZXh0IHg9Ijc1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiMxRTI5MkM7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4yMDB4MjAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true"> -->
					<!--               <h4>Label</h4> -->
					<%--               <span class="text-muted">Something else</span> --%>
					<!--             </div> -->
				</div>

				<h2 class="sub-header">	Report	</h2>
				<div class="table-responsive" id="myTable">
					

	<table class="table table-striped" >
		<tr>

			
			<th>Question#</th>
			<th>Question</th>
			<th>Your Answer</th>
			<th>Correct Answer</th>
			<th>Explanation</th>
			

		</tr>
		<%
		for (Long key : qsMap.keySet()) {
			out.print("<tr>");
		  out.print("<td>"+ qsMap.get(key).getQuestionNumber() +"</td>");
		  out.print("<td>"+ qsMap.get(key).getQuestionString()+ "</td>");
		  if(null != usrMap.get(key))
			  	out.print("<td>"+ usrMap.get(key).getSubmittedAnswer()+ "</td>");
			  else
				out.print("<td></td>");
		  out.print("<td>"+ ansMap.get(key).getCorrectAnswer()+ "</td>");
		  out.print("<td>"+ ansMap.get(key).getDescription()+ "</td>");
		  
		  out.print("</tr>");
		}
		
		%>
			

	</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./Dashboard_files/jquery.min.js"></script>
	<script src="./Dashboard_files/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="./Dashboard_files/holder.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./Dashboard_files/ie10-viewport-bug-workaround.js"></script>


	
	
</body>
</html>

