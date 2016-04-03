<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>Homepage...!!!</h2>


	<sf:form method="POST" modelAttribute="newUser" action="addnewuser">
		<fieldset>
			<table>

				<tr>
					<th><label for="user_screen_name">User name:</label></th>
					<td><sf:input path="userName" size="15" maxlength="15"
							id="user_screen_name" /> <small id="username_msg">No
							spaces,please.</small> <sf:errors path="userName" cssClass="error" /></td>
				</tr>
				<tr>
					<th><label for="user_password">Password:</label></th>
					<td><sf:password path="password" size="30" showPassword="true"
							id="user_password" /> <small>6 characters or more(be
							tricky!)</small></td>
					<sf:errors path="password" cssClass="error" />
				</tr>
				<tr>
					<th><label for="user_email"> E-Mail :</label></th>
					<td><sf:input path="emailId" size="30" id="user_email" /> <small>where
							we can contact you..</small></td>
					<sf:errors path="emailId" cssClass="error" />
				</tr>
				<tr>
					<th><label for="user_contact">Contact No:</label></th>
					<td><sf:input path="contactNo" size="15" id="user_contact" />
						<small>your mobile no.</small></td>
					<sf:errors path="contactNo" cssClass="error" />
				</tr>
				<tr>
					<td><sf:button value="Submit" id="submit_button" name="Submit"></sf:button>
					</td>
					<td><input name="commit" type="submit"
						value="Createmyaccount!" /></td>
				</tr>
			</table>
		</fieldset>
	</sf:form>
</div>



