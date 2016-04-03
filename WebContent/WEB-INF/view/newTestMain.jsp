<%@page import="myTest.entities.Question"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div>
	<table style="width: 80%; height: 80%;" border="1">
		<tr style="height: 25%;">
			<td colspan="2">
				<div id="Frame1"></div>
			</td>
		</tr>
		<tr style="height: 75%;">
			<td style="width: 25%;">
				<div>
					<sf:form method="POST" modelAttribute="nextQuestion"
						action="getNextQuestion">
						<fieldset >
							<input type="hidden" name="input" id="input" value="0" />
							<input type="hidden" name="currentQuestionNo" id="currentQuestionNo" value="${currentQuestionNo}" />
							currentQuestionNo
							<h3>Questions</h3>
							<table border="1" style="height: 200px;">

								<%
								
									for (int i = 1; i <= 60; i++) {
								%>
								<tr>
									<td><input name="commit" type="submit" value="<%=i++%>"
										onclick="document.getElementById('input').value ='<%="Section1"%>,<%=i - 1%>';document.getElementById('currentQuestionNo').value ='<%=i - 1%>'"
										style="width: 50px; " /></td>
									<td><input name="commit" type="submit" value="<%=i++%>"
										onclick="document.getElementById('input').value ='<%=i - 1%>'"
										style="width: 50px;" /></td>
									<td><input name="commit" type="submit" value="<%=i++%>"
										onclick="document.getElementById('input').value ='<%=i - 1%>'"
										style="width: 50px;" /></td>

								</tr>
								<%
									}
								%>
							</table>
						</fieldset>
					</sf:form>
				</div>
			</td>
			<td style="width: 75%;">
				<div id="question">

					<sf:form method="POST" modelAttribute="currentQuestion"	action="saveCurrentAnswer">
						
						<input type="hidden" name="currentQuestionNo" id="currentQuestionNo" value="${currentQuestionNo}" />
						
							<table border="1" style="width: 99%; height: 220px;">

								<tr style="height: 50%;">
									<td colspan="4"><sf:textarea path="questionString"
											id="q_questionString" cssStyle="width:95% "/></td>
								</tr>
								<tr style="height: 50%;">

									<td colspan="4">
									<sf:radiobuttons path="submittedAnswer" id="q_myanswer" 
											items="${currentQuestion.answerOptions}"/>
											</td>
								</tr>
								</table>
								<table>
								<tr>
									<td><input name="reset" type="reset" value="Previous" /></td>
									<td><input name="commit" type="submit" value="Submit"/></td>
									<td><input name="reset" type="reset" value="Reset" /></td>
									<td><input name="reset" type="reset" value="Next" /></td>
								</tr>

							</table>
						
					</sf:form>

				</div>
			</td>
		</tr>
	</table>

	<!-- <frameset rows="25%,75%">
  <frame src="frame_1">
  <frameset cols="25%,75%">
    <frame src="frame_2">
    <frame src="frame_3">
  </frameset>
</frameset> -->


</div>



