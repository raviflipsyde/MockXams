<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>Questions...!!!</h2>


				
	<sf:form method="POST" modelAttribute="newQuestionset"	action="saveNewQuestionSet" >
		<fieldset>
			<table>


				<tr>
					<th><label for="qSetName">Question Set Name:</label></th>
					<td><sf:input path="questionSetName" size="4" id="qSetName" /></td>
				</tr>
				
				
				
				
				<tr>
					<th><label for="qQuestions">Question :</label></th>
					<td><sf:select multiple="true" path="questions">
							<sf:options items="${questionList1}"  />
						</sf:select></td>
				</tr>
<%-- 				<tr>
					<th><label for="qstring">Question:</label></th>
					<td><sf:input path="questionString" size="50" id="qstring" /></td>
				</tr>
				<tr>
					<th><label for="qanswer">Answer with options :</label></th>
					<td><sf:input path="correctAnswer" size="50" id="qanswer" />
					<small>Correct answer must be the first, separated by comma</small></td>
				</tr>
				
				<tr>
					<th><label for="corMarks">Correct Score:</label></th>
					<td><sf:input path="correctMarks" size="4" id="corMarks" /></td>
				</tr>
				<tr>
					<th><label for="incorMarks">Answer:</label></th>
					<td><sf:input path="incorrectMarks" size="4" id="incorMarks" /></td>
				</tr> --%>
				<tr>
					
					<td><input name="commit" type="submit"
						value="Add Question" /></td>
				</tr>
			</table>
		</fieldset>
	</sf:form>
</div>



