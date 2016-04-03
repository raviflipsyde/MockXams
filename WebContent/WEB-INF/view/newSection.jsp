<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>Sections...!!!</h2>

	<sf:form method="POST" modelAttribute="newQuestion"	>
	<fieldset>
		<label >Question Topics:</label>
		<sf:select multiple="true" path="section"  disabled="true">
			<sf:options items="${allSectionList}" />
		</sf:select>
	</fieldset>

</sf:form>

	<sf:form method="POST" modelAttribute="newSection"
		action="addnewSection">
		<fieldset>
			<table>
				<tr>
					<th><label for="sectionName">Section Name:</label></th>
					<td><sf:input path="sectionName" size="15" id="sectionName" /></td>
				</tr>
				<tr>
					<th><label for="sdescription">Description:</label></th>
					<td><sf:input path="description" size="50" id="sdescription" /></td>
				</tr>
				<tr>
					
					<td><input name="commit" type="submit" value="Add Section" /></td>
				</tr>
			</table>
		</fieldset>
	</sf:form>
</div>



