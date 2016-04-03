<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>User Page</h2>


	
	<fieldset>
		<form action="AddQuestionsPage">
			<input type="submit" value="See Available Tests" />
		</form>
		<form action="UpdateQuestion">
			<input type="submit" value="See Your Results" />
		</form>
		<form action="addnewSectionPage">
			<input type="submit" value="Review Tests" />
		</form>
		<form action="addnewTopicPage">
			<input type="submit" value="Pay for Premium account" />
		</form>
		
		<form action="UserData">
			<input type="submit" value="User Profile" />
		</form>
		
		<form action="showTest">
			<input type="submit" value="Show my Test" />
		</form>
	</fieldset>
</div>



