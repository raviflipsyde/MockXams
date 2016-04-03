<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>User Profile</h2>


	<sf:form method="POST" modelAttribute="profileUser" action="updateUserInfo">
		<fieldset>
			<table style="width: 50%;">
				<tr><td colspan="2">User Profile </td>
				</tr>
				<tr>
					<th><label for="user_screen_name">User name:</label></th>
					<td><sf:input path="userName" size="15" maxlength="15"
							id="user_screen_name" /> </td>
				</tr>
				
				<tr>
					<th><label for="user_password">Password:</label></th>
					<td><sf:input path="password" size="15" showPassword="true"
							id="user_password" disabled="true"/> </td> 
				</tr>
				
				<tr>
					<th><label for="user_contact_no">Contact No:</label></th>
					<td><sf:input path="contactNo" size="13" maxlength="13"
							id="user_contact_no" /> +91</td>
				</tr>
				
				<tr>
					<th><label for="user_mail_address">Email Id:</label></th>
					<td><sf:input path="emailId" size="100" maxlength="100"
							id="user_mail_address" /> </td>
				</tr>
				
				
				
				<tr>
					<td><input name="actions1" type="submit" value="Update" /></td>
					<td><input name="actions1" type="submit" value="Back" /></td>
				</tr>

			</table>
		</fieldset>
	</sf:form>
	
</div>



