<%@page import="myTest.entities.UserTestData"%>
<%@page import="java.util.HashMap"%>
<%@page import="myTest.entities.Test1"%>
<%@page import="myTest.entities.User"%>




<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="us">
<head>

<meta charset="utf-8">
<title>eXamination</title>

<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<link href="<c:url value="/resources/jquery-ui/jquery.countdown.css" />"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="<c:url value="/resources/jquery-ui/jquery.plugin.js"/> "></script>
<script src="<c:url value="/resources/jquery-ui/jquery.countdown.js"/> "></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>

</head>
<body>
	<%

List<Test1> activeTests =(List<Test1>) request.getAttribute("tests");
List<User> activeUsers = (List<User>)request.getAttribute("users");


%>


	<table class="data" border="1">
		<tr>


			<th>Users</th>
			<th>Tests</th>


		</tr>
		<tr>
			<td><select name="user1" form="userTestform">
					<%
					for (User usr : activeUsers) {
						out.print("<option value='"+usr.getId()+"'>"+ usr.getUserName()+"</option>"); 		  
		
					}
		
				%>
			</select></td>
<td>
			<select name="test1" form="userTestform">
					<%
					for (Test1 tst : activeTests) {
						out.print("<option value='"+tst.getId()+"'>"+ tst.getTestName()+"</option>"); 		  
		
					}
		
				%>
			</select>
			</td>

			</tr>



	</table>

	<form
		action="${pageContext.servletContext.contextPath}/deleteUserTestDataNow"
		id="userTestform" method="post">

		<input type="submit">
	</form>
</body>
</html>
