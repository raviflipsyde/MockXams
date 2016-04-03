<%@page import="myTest.entities.User"%>
<%@page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.util.List"%>




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
List<User> list1 = (List<User>)request.getAttribute("usersList");
		
%>

	<div class="container-fluid">
		<div class="row">
			
			<div class="col-sm-9 col-md-12  main">
				<h1 class="page-header">Test Summary			</h1>

				
				
				<div class="table-responsive" id="myTable">
					

	<table class="table table-striped" >
		<tr>

			
			<th>ID</th>
			<th>Username</th>
			<th>Password</th>
			<th>Email</th>
			<th>Contact#</th>
			
			

		</tr>
		<%
		for (User usr1 : list1) {
			if(usr1.getAccessLevel()!=1){				
			
			out.print("<tr>");
		  out.print("<td>"+ usr1.getId() +"</td>");
		  out.print("<td>"+ usr1.getUserName() + "</td>");
		  out.print("<td>"+ usr1.getPassword()+ "</td>");
		  out.print("<td>"+ usr1.getEmailId()+ "</td>");
		  out.print("<td>"+ usr1.getContactNo()+ "</td>");
		  
		  out.print("</tr>");
			}
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





