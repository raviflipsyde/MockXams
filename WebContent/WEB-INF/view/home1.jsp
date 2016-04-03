<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div>
	<h2>Homepage...!!!</h2>


	<sf:form method="POST" modelAttribute="newUser" action="login">
		<fieldset>
			<table style="width: 50%;">
				<tr><td colspan="2">Existing Users </td>
				</tr>
				<tr>
					<th><label for="user_screen_name">User name:</label></th>
					<td><sf:input path="userName" size="15" maxlength="15"
							id="user_screen_name" /> <small id="username_msg">No
							spaces,please.</small></td>
				</tr>
				<tr>
					<th><label for="user_password">Password:</label></th>
					<td><sf:password path="password" size="15" showPassword="true"
							id="user_password" /> <small>6 characters or more(be
							tricky!)</small></td>
				</tr>
				<tr>
					<td><input name="commit" type="submit" value="Login" /></td>
					<td><input name="newUser" type="reset" value="Reset" /></td>
				</tr>

			</table>
		</fieldset>
	</sf:form>
	<fieldset>
		<form action="newuser">
			<table>
				<tr>
					<td>New Users</td>
				</tr>
				<tr>
					<td><input type="submit" value="New User!!!" /></td>
				</tr>
			</table>
		</form>
	</fieldset>
</div>



