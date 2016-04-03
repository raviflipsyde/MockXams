<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>Sections...!!!</h2>

<sf:form method="POST" modelAttribute="newQuestion"	>
	<fieldset>
		<label >Question Tags:</label>
		<sf:select multiple="true" path="tags"  disabled="true">
			<sf:options items="${allTagsList}" />
		</sf:select>
	</fieldset>

</sf:form>

	<sf:form method="POST" modelAttribute="newTags"
		action="addnewTags">
		<fieldset>
			<table>
				<tr>
					<th><label for="tagName">Tag Name:</label></th>
					<td><sf:input path="tagName" size="15" id="tagName" /></td>
				</tr>
				<tr>
					<th><label for="tdescription">Description:</label></th>
					<td><sf:input path="description" size="50" id="tdescription" /></td>
				</tr>
				<tr>
					
					<td><input name="commit" type="submit" value="Add Tags" /></td>
				</tr>
			</table>
		</fieldset>
	</sf:form>
</div>



