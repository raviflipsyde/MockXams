<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>Admin Page</h2>


	
	<fieldset>
		<form action="addNewQuestion">
			<input type="submit" value="Add Questions To Database" />
		</form>
			
		<form action="addNewTopic">
			<input type="submit" value="Add Topics" />
		</form>
		
		<form action="addNewQuestionSet">
			<input type="submit" value="Create Questions Sets" />
		</form>
		
		<form action="uploadPage">
			<input type="submit" value="Create Tests" />
		</form>

		<form action="USerData">
			<input type="submit" value="User Data" />
		</form>
		
		<form action="showTest">
			<input type="submit" value="Show my Test" />
		</form>
		
		<form action="testScore">
			<input type="submit" value="Show my Test Score" />
		</form>
		
	</fieldset>
</div>



