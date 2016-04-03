<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>Questions...!!!</h2>


				
	<sf:form method="POST" modelAttribute="newTest"	action="saveNewTest" >
		<fieldset>
			<table>


				<tr>
					<th><label for="testName">Test Name:</label></th>
					<td><sf:input path="TestName" size="10" id="testName" /></td>
				</tr>
				<tr>
					<th><label for="testDuration">Test Duration:</label></th>
					<td><sf:input path="testDuration" size="4" id="testDuration" /></td>
				</tr>
				
				
				
			<tr>
					<th><label >Question Sets:</label></th>
					<td><sf:select multiple="true" path="qSet">
							<sf:options items="${qSetList1}"  />
						</sf:select></td>
				</tr>

				<tr>
					
					<td><input name="commit" type="submit"
						value="Add QuestionSets to Test" /></td>
				</tr>
			</table>
		</fieldset>
	</sf:form>
</div>



