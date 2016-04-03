<!DOCTYPE html>
<%@page import="myTest.entities.Question"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myTest.entities.QuestionSet"%>
<%@page import="myTest.entities.Test1"%>
<%@page import="myTest.entities.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Dashboard</title>

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


</head>

<body>

	<%
		User user = (User) session.getAttribute("USER");
	%>

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
				<a class="navbar-brand"
					href="http://ironsummitmedia.github.io/startbootstrap-blog-post/#">Daily Test</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="navbar-collapse collapse"
				id="bs-example-navbar-collapse-1" aria-expanded="false"
				style="height: 1px;">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a
						href="${pageContext.servletContext.contextPath}/dashboard">Home</a>
					</li>

					<li><a href="${pageContext.servletContext.contextPath}/logout">Logout</a>
					</li>

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

				<!-- Blog Post -->

				<!-- Title -->
				<h2>
					Hi
					<%=user.getUserName()%></h2>

				<!-- Author -->


				<hr>

				<!-- Date/Time -->
				<p>
					<span class="glyphicon glyphicon-time"></span> <span
						id="dateholder" style="text-align: right;"></span>
				</p>

				<hr>

				
				<!-- Post Content -->
				<p class="lead">
				
				<div class="well">
					<h4>Blog Categories</h4>
					<div class="row">
						<div class="col-lg-6" id="myTestTable">			</div>
						<div class="col-lg-6" id="myResultTable">		</div>
					</div>
					<!-- /.row -->
				</div>
				
				</p>

				<hr>

			

				

				

			</div>

			<!-- Blog Sidebar Widgets Column -->
			<div class="col-md-4">

				
				

				<!-- Side Widget Well -->
				<div class="well">
					<h4>Admin Control Panel</h4>
					<ul class="nav nav-sidebar">
					<li class="active"><a
						href="${pageContext.servletContext.contextPath}/dashboard">Home</a></li>
					
					<li><a
						href="${pageContext.servletContext.contextPath}/userMasters">User Data</a></li>
											
					<li><a
						href="${pageContext.servletContext.contextPath}/uploadPage">Create Tests</a></li>
					<li><a
						href="${pageContext.servletContext.contextPath}/ActivatePage">
						Test	Activate</a>	</li>				
					
					<li>
					<a href="${pageContext.servletContext.contextPath}/testDataDeletePage">New Dashboard</a>
					</li>
					
					<li>
					<a href="${pageContext.servletContext.contextPath}/register">Add Users</a>
					</li>
					
					<li><a href="${pageContext.servletContext.contextPath}/logout">Logout</a></li>				
					

				</ul>
				</div>

			</div>

		</div>
		<!-- /.row -->

		<hr>

		

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="./Exam-template_files/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./Exam-template_files/bootstrap.min.js"></script>

	<script>
		var d = new Date();
		document.getElementById("dateholder").innerHTML = d.toDateString();
	</script>


<script type="text/javascript">
	
	testList = JSON.parse('<%=request.getAttribute("testAvailableJSON")%>');
	resultList = JSON.parse('<%=request.getAttribute("resultAvailableJSON")%>');
	
				
	var prepTestString = "<ul class='list-unstyled'> <li><h2> Test</h2></li>";
	for (count = 0; count < testList.length; count++) {	
						
		prepTestString = prepTestString 
				+" <li> <a href=\'${pageContext.servletContext.contextPath}/showNewTest?testid="+testList[count]+"'>"
				+testList[count] + "</a></li>";				
	}
	
	prepTestString = prepTestString+ "</ul>";
	document.getElementById("myTestTable").innerHTML = prepTestString;
	
	
	var prepResultString = "<ul class='list-unstyled'> <li><h2> Results</h2></li>";
	for (count = 0; count < resultList.length; count++) {	
						
		prepResultString = prepResultString 
				+" <li> <a href=\'${pageContext.servletContext.contextPath}/testSummary?testid="+resultList[count]+"'>"
				+resultList[count] + "</a></li>";
	}
	
	prepResultString = prepResultString+ "</ul>";
	
	document.getElementById("myResultTable").innerHTML = prepResultString;
			
	</script>


</body>
</html>