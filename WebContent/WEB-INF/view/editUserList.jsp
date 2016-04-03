<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>

<title>Spring 3 hibernate integration example on
	www.howtodoinjava.com</title>
</head>
<body>
	  
	<h2>Employee Management Screen : Spring 3 hibernate integration
		example on www.howtodoinjava.com</h2>
	  
	<%-- <form:form method="post" action="add" commandName="user">  
    <table>
			<tr>
				<td><form:label path="id">
						<spring:message code="label.firstname" />
					</form:label></td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>

				<td><form:label path="userName">
						<spring:message code="label.lastname" />
					</form:label></td>
				<td><form:input path="userName" /></td>
			</tr>

			<tr>

				<td><form:label path="emailId">
						<spring:message code="label.email" />
					</form:label></td>
				<td><form:input path="emailId" /></td>
			</tr>

			

				<td colspan="2">            <input type="submit"
					value="<spring:message code="label.add"/>" />         
				</td>
			</tr>
		</table>
	</form:form> --%>
	         
	<h3>Employees</h3>
	<c:if test="${!empty userList}">
		<table class="data">
			<tr>

				<th>Name</th>
				<th>Email</th>
				<th>Telephone</th>
				<th></th>
			</tr>
			<c:forEach items="${userList}" var="emp">
    <tr>

					<td>${emp.userName}</td>
					<td>${emp.emailId}</td>					
					<td><a href="delete/${emp.id}">delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	  
</body>
</html>