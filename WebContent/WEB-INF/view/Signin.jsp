<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<!-- saved from url=(0040)http://getbootstrap.com/examples/signin/ -->
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="http://getbootstrap.com/favicon.ico">

<title>aeon Tutorials</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">


<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">


<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="<c:url value="/resources/js/ie-emulation-modes-warning.js"/> "></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->




</head>

<body>

	<div class="container">


	<h2 > <span style="text-align: start;">Daily Test</span> 
	</h2>
		<sf:form method="POST" modelAttribute="newUser" action="login"
			cssClass="form-signin">
			<fieldset>


				
				<h2 class="form-signin-heading">Please Log In </h2>

				<label for="user_screen_name" class="sr-only">Username</label>

				<sf:input path="userName" size="15" maxlength="15"
					id="user_screen_name" cssClass="form-control"
					placeholder='Username' required='' autofocus='' />



				<label for="user_password" class="sr-only">Password</label>
				<sf:password path="password" size="15" maxlength="15"
					showPassword="true" id="user_password" cssClass="form-control"
					placeholder="Password" required="" />



				<button class="btn btn-lg btn-primary btn-block" type="submit">Log
					in</button>




			</fieldset>
		</sf:form>


	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./Signin_files/ie10-viewport-bug-workaround.js"></script>
	

</body>
</html>