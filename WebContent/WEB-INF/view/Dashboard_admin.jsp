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


<script >
    
	

	function sendRequest() {
		
		alert('hiiii.....');
		$.post("${pageContext.servletContext.contextPath}/showTest", {
			testName : "JEE 102",
			questionSection : "sect1",
		}, function(data, status) {

		});

	}
	
	
	
	
	
</script>


</head>

<body>

	<!--     <nav class="navbar navbar-inverse navbar-fixed-top"> -->
	<!--       <div class="container-fluid"> -->
	<!--         <div class="navbar-header"> -->
	<!--           <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> -->
	<%--             <span class="sr-only">Toggle navigation</span> --%>
	<%--             <span class="icon-bar"></span> --%>
	<%--             <span class="icon-bar"></span> --%>
	<%--             <span class="icon-bar"></span> --%>
	<!--           </button> -->
	<!--           <a class="navbar-brand" href="http://getbootstrap.com/examples/dashboard/#">Project name</a> -->
	<!--         </div> -->
	<!--         <div id="navbar" class="navbar-collapse collapse"> -->
	<!--           <ul class="nav navbar-nav navbar-right"> -->
	<!--             <li><a href="http://getbootstrap.com/examples/dashboard/#">Dashboard</a></li> -->
	<!--             <li><a href="http://getbootstrap.com/examples/dashboard/#">Settings</a></li> -->
	<!--             <li><a href="http://getbootstrap.com/examples/dashboard/#">Profile</a></li> -->
	<!--             <li><a href="http://getbootstrap.com/examples/dashboard/#">Help</a></li> -->
	<!--           </ul> -->
	<!--           <form class="navbar-form navbar-right"> -->
	<!--             <input type="text" class="form-control" placeholder="Search..."> -->
	<!--           </form> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--     </nav> -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a
						href="${pageContext.servletContext.contextPath}/">Home</a></li>
					<li><a
						href="${pageContext.servletContext.contextPath}/showTest">Tests</a></li>
					<li><a
						href="${pageContext.servletContext.contextPath}/testScore">Test	Reports</a></li>
					<li><a
						href="${pageContext.servletContext.contextPath}/uploadPage">Create
							Tests</a></li>
					<li><a
						href="${pageContext.servletContext.contextPath}/ActivatePage">
						Test	Activate</a>	</li>		
					<li><a href="${pageContext.servletContext.contextPath}/logout">Logout</a></li>
					
					<li>
					<a href="${pageContext.servletContext.contextPath}/showNewTest?testid=101">New Test</a>
					</li>
					
					<li>
					<a href="${pageContext.servletContext.contextPath}/dashboard">New Dashboard</a>
					</li>
					

					<!--             <li><a href="http://getbootstrap.com/examples/dashboard/#">Analytics</a></li> -->

				</ul>

			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Dashboard</h1>

				<div class="row placeholders">
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
							alt="Yesterdays Test"
							src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzBEOEZEQiIvPjxnPjx0ZXh0IHg9Ijc1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiNGRkZGRkY7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4yMDB4MjAwPC90ZXh0PjwvZz48L3N2Zz4="
							data-holder-rendered="true">
						<h4>Test</h4>
						<span class="text-muted">Todays Test</span>
					</div>
					<div class="col-xs-6 col-sm-3 placeholder">
						<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
							alt="Yesterdays Result"
							src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDIwMCAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iIzM5REJBQyIvPjxnPjx0ZXh0IHg9Ijc1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiMxRTI5MkM7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4yMDB4MjAwPC90ZXh0PjwvZz48L3N2Zz4="
							data-holder-rendered="true">
						<h4>Result</h4>
						<span class="text-muted">Yesterdays Result</span>
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

				<h2 class="sub-header">Details</h2>
				<div class="table-responsive" id="myTable">
					<!-- Content goes here -->
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


	<script type="text/javascript">
	
	testList = JSON.parse('<%=request.getAttribute("testAvailableJSON")%>');
	var prepString = "";
	for (count = 0; count < testList.length; count++) {		
						
		prepString = prepString 
				+"<a href=\'${pageContext.servletContext.contextPath}/showTest?testid="+testList[count]+"'>"
				+testList[count]
				+"</a><br/>"
				+"<a href=\'${pageContext.servletContext.contextPath}/testSummary?testid="+testList[count]+"'>Result of "
				+testList[count]
				+"</a><br/>"
	}
	
	document.getElementById("myTable").innerHTML = prepString;	
			
	</script>
	
</body>
</html>