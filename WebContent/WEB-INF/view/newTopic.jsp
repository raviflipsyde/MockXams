<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>Topics...!!!</h2>

<sf:form method="POST" modelAttribute="newQuestion"	>
	<fieldset>
		<label >Question Topics:</label>
		<sf:select multiple="true" path="topic"  disabled="true">
			<sf:options items="${allTopicList}" />
		</sf:select>
	</fieldset>

</sf:form>
	<sf:form method="POST" modelAttribute="newTopic"
		action="saveNewTopic">
		<fieldset>
			<table>
				<tr>
					<th><label for="topicName">Topic Name:</label></th>
					<td><sf:input path="topicName" size="15" id="topicName" /></td>
				</tr>
				<tr>
					<th><label for="tdescription">Description:</label></th>
					<td><sf:input path="description" size="50" id="tdescription" /></td>
				</tr>
				<tr>
					
					<td><input name="commit" type="submit" value="Add Topic" /></td>
				</tr>
			</table>
		</fieldset>
	</sf:form>
</div>



