
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="us">
<head>
<meta charset="utf-8">
<title>eXamination</title>


<link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.min.css"/>" />
<link href="<c:url value="/resources/jquery-ui/jquery.countdown.css" />" rel="stylesheet">
<script src="<c:url value="/resources/jquery-ui/jquery.min.js"/> "></script>
<script src="<c:url value="/resources/jquery-ui/jquery.plugin.js"/> "></script>
<script src="<c:url value="/resources/jquery-ui/jquery.countdown.js"/> "></script>
<script src="<c:url value="/resources/jquery-ui/jquery-ui.min.js"/> "></script>




<script >
	
	$(function() {

		$("#accordion").accordion();

		var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC",
				"C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang",
				"Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp",
				"Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" ];
		$("#autocomplete").autocomplete({
			source : availableTags
		});

		$("#button").button();
		$("#radioset").buttonset();

		$("#tabs").tabs();

		$("#dialog").dialog({
			autoOpen : false,
			width : 400,
			buttons : [ {
				text : "Close",
				click : function() {
					$(this).dialog("close");
				}
			} ]
		});
		// Link to open the dialog
		$("#dialog-link").click(function(event) {
			$("#dialog").dialog("open");
			event.preventDefault();
		});

		$("#datepicker").datepicker({
			inline : true
		});

		$("#slider").slider({
			range : true,
			values : [ 17, 67 ]
		});

		$("#progressbar").progressbar({
			value : 20
		});

		// Hover states on the static widgets
		$("#dialog-link, #icons li").hover(function() {
			$(this).addClass("ui-state-hover");
		}, function() {
			$(this).removeClass("ui-state-hover");
		});
	});

	function popupTest() {
		window.open("${pageContext.servletContext.contextPath}/testpage1",
				'window',
				'width='+screen.width+',height='+screen.height+',location=no,scrollbars=yes,resizable=no');
	}
</script>
<style>
body {
	font: 62.5% "Trebuchet MS", sans-serif;
	margin: 50px;
}

.demoHeaders {
	margin-top: 2em;
}

#dialog-link {
	padding: .4em 1em .4em 20px;
	text-decoration: none;
	position: relative;
}

#dialog-link span.ui-icon {
	margin: 0 5px 0 0;
	position: absolute;
	left: .2em;
	top: 50%;
	margin-top: -8px;
}

#icons {
	margin: 0;
	padding: 0;
}

#icons li {
	margin: 2px;
	position: relative;
	padding: 4px 0;
	cursor: pointer;
	float: left;
	list-style: none;
}

#icons span.ui-icon {
	float: left;
	margin: 0 4px;
}

.fakewindowcontain .ui-widget-overlay {
	position: absolute;
}
</style>
</head>
<body>
	<div class="sticky_header_login">
		<div id="utility-nav">
			<table style="width: 100%;">
				<tr>
					<td><ul id="user-nav">

							<li id="trigger-login"><a href="#"
								onClick="window.open('LoginPopup', 'window', 'width=400,height=300')">Login</a>
							</li>
						</ul>
						<p>
							<a href="#" id="dialog-link"
								class="ui-state-default ui-corner-all"><span
								class="ui-icon ui-icon-newwin"></span>Open Dialog</a>
						</p>
						<div id="login-dropdown" style="display: block;">
							<span class="login-arrow"></span>
							<%-- <form
					action="/articles/flesh-weak_794942.html?destination=node%2F794942%3Fnopager%3D1"
					accept-charset="UTF-8" method="post" id="user-login-form">
					<div>
						<div class="login-form-row clearfix">
							<div class="form-item" id="edit-name-1-wrapper">
								<label for="edit-name-1">Log-In Email: <span
									class="form-required" title="This field is required.">*</span></label>
								<input type="text" maxlength="60" name="name" id="edit-name-1"
									size="15" value="" tabindex="1" class="form-text required">
							</div>
						</div>
						<input type="hidden" name="form_build_id"
							id="form-602007baf523cdd64840731c72cc5645"
							value="form-602007baf523cdd64840731c72cc5645"> <input
							type="hidden" name="form_id" id="edit-user-login-block-1"
							value="user_login_block">
						<div class="login-form-row clearfix">
							<div class="form-item" id="edit-pass-1-wrapper">
								<label for="edit-pass-1">Password: <span
									class="form-required" title="This field is required.">*</span></label>
								<input type="password" name="pass" id="edit-pass-1"
									maxlength="60" size="15" tabindex="1"
									class="form-text required">
							</div>
						</div>
						<div class="clearfix">
							<label></label>
							<div class="form-item" id="edit-remember-me-1-wrapper">
								<input type="checkbox" name="remember_me"
									id="edit-remember-me-1" value="1" checked="checked"
									class="form-checkbox check">
							</div>
							<div class="check-label">Remember me</div>
						</div>
						<label></label><input type="image" name="submit"
							id="edit-submit-1" class="form-submit locked-login"
							data-role="none"
							src="/sites/all/themes/ws/images/login-button.gif">

					</div>
				</form> --%>
						</div></td>
					<td>
						<ul id="user-nav">

							<li class="seperate"><a href="${pageContext.servletContext.contextPath}/register">Register</a></li>
												</ul>
					</td>
					<td>
						<!-- User Specific --> <!-- Todays Date -->
						<div id="Datediv">
							<h3>
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now}" dateStyle="long" />
								<%-- <fmt:formatDate value="${now}" pattern="dd-MM-yyyy HH:mm:ss a z" /> --%>
							</h3>
						</div>
					</td>
					<td>
						<!-- About Us -->
						<div id="utility-about">
							<ul>
								<li><a id="about-us-btn">About Us</a></li>
								<li><a href="${pageContext.servletContext.contextPath}/home1">home1</a></li>
							</ul>
							<div id="utility-about-urls" style="display: none;">
								<span class="login-arrow"></span>
								<ul>
									
									<li><a href="/tws/aboutus/default.asp">About</a></li>
									<li><a href="/misc/faq.asp">FAQs</a></li>
									<li><a href="/SubscribersOnly.asp">Subscribers Only</a></li>
									<li><a href="/contact">Contact Us</a></li>
									<li><a href="/feeds" class="rss">RSS</a></li>
									<li><a href="http://www.facebook.com/weeklystandard"
										class="img"><img
											src="/sites/all/themes/ws/images/facebook-icon.gif"
											alt="Follow us on Facebook" width="16" height="16">Facebook</a></li>
									<li class="last"><a
										href="http://twitter.com/weeklystandard" class="img"><img
											src="/sites/all/themes/ws/images/twitter-icon.gif"
											alt="Follow us on Twitter" width="16" height="16">Twitter</a></li>
								</ul>
							</div>
						</div>
					</td>
					<td>
						<!-- Search Box -->
						<div id="navbar-google-search">
							<div id="cse-search-form" style="width: 100%;">
								<div
									class="gsc-control-searchbox-only gsc-control-searchbox-only-en"
									dir="ltr">
									<form class="gsc-search-box" accept-charset="utf-8">
										<table class="gsc-search-box">
											<tbody>
												<tr>
													<td class="gsc-input"><input autocomplete="off"
														type="text" size="10" class=" gsc-input " name="search"
														title="Search..." id="gsc-i-id1" dir="ltr"
														spellcheck="false"
														style="outline: none; color: black; background: rgb(255, 255, 255);"><input
														type="hidden" name="bgresponse" id="bgresponse"></td>
													<td class="gsc-search-button"><input type="button"
														value="Search" class="gsc-search-button" title="search"></td>
													<td class="gsc-clear-button"><div
															class="gsc-clear-button" title="clear results">&nbsp;</div></td>
												</tr>
											</tbody>
										</table>
										<table class="gsc-branding">
											<tbody>
												<tr>
													<td class="gsc-branding-user-defined"></td>
													<td class="gsc-branding-text"><div
															class="gsc-branding-text">powered by</div></td>
													<td class="gsc-branding-img"><img
														src="http://www.google.com/uds/css/small-logo.png"
														class="gsc-branding-img"></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
							</div>
						</div>

					</td>
					<td>
						<div id="advanced-search-box">
							<a href="/find">Advanced Search</a>
						</div>
					</td>

					<td>
						<ul id="test-nav">

							<li class="seperate"><a  href="javascript:"
								onclick="popupTest()">Test Page</a></li>

						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="header">
		<h1>The eXamination!</h1>
		<h3>This is the header block a the top of the page with the
			banner/mostly a gif/png</h3>
	</div>
	<h1>Welcome to jQuery UI!</h1>

<div class="ui-widget">
	<p>This page demonstrates the widgets and theme you selected in Download Builder. Please make sure you are using them with a compatible jQuery version.</p>
</div>

<h1>YOUR COMPONENTS:</h1>


<!-- Accordion -->
<h2 class="demoHeaders">Accordion</h2>
<div id="accordion">
	<h3>First</h3>
	<div>Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.</div>
	<h3>Second</h3>
	<div>Phasellus mattis tincidunt nibh.</div>
	<h3>Third</h3>
	<div>Nam dui erat, auctor a, dignissim quis.</div>
</div>



<!-- Autocomplete -->
<h2 class="demoHeaders">Autocomplete</h2>
<div>
	<input id="autocomplete" title="type &quot;a&quot;">
</div>



<!-- Button -->
<h2 class="demoHeaders">Button</h2>
<button id="button">A button element</button>
<form style="margin-top: 1em;">
	<div id="radioset">
		<input type="radio" id="radio1" name="radio"><label for="radio1">Choice 1</label>
		<input type="radio" id="radio2" name="radio" checked="checked"><label for="radio2">Choice 2</label>
		<input type="radio" id="radio3" name="radio"><label for="radio3">Choice 3</label>
	</div>
</form>



<!-- Tabs -->
<h2 class="demoHeaders">Tabs</h2>
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">First</a></li>
		<li><a href="#tabs-2">Second</a></li>
		<li><a href="#tabs-3">Third</a></li>
	</ul>
	<div id="tabs-1">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
	<div id="tabs-2">Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
	<div id="tabs-3">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
</div>



<!-- Dialog NOTE: Dialog is not generated by UI in this demo so it can be visually styled in themeroller-->
<h2 class="demoHeaders">Dialog</h2>
<p><a href="#" id="dialog-link" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-newwin"></span>Open Dialog</a></p>

<h2 class="demoHeaders">Overlay and Shadow Classes <em>(not currently used in UI widgets)</em></h2>
<div style="position: relative; width: 96%; height: 200px; padding:1% 2%; overflow:hidden;" class="fakewindowcontain">
	<p>Lorem ipsum dolor sit amet,  Nulla nec tortor. Donec id elit quis purus consectetur consequat. </p><p>Nam congue semper tellus. Sed erat dolor, dapibus sit amet, venenatis ornare, ultrices ut, nisi. Aliquam ante. Suspendisse scelerisque dui nec velit. Duis augue augue, gravida euismod, vulputate ac, facilisis id, sem. Morbi in orci. </p><p>Nulla purus lacus, pulvinar vel, malesuada ac, mattis nec, quam. Nam molestie scelerisque quam. Nullam feugiat cursus lacus.orem ipsum dolor sit amet, consectetur adipiscing elit. Donec libero risus, commodo vitae, pharetra mollis, posuere eu, pede. Nulla nec tortor. Donec id elit quis purus consectetur consequat. </p><p>Nam congue semper tellus. Sed erat dolor, dapibus sit amet, venenatis ornare, ultrices ut, nisi. Aliquam ante. Suspendisse scelerisque dui nec velit. Duis augue augue, gravida euismod, vulputate ac, facilisis id, sem. Morbi in orci. Nulla purus lacus, pulvinar vel, malesuada ac, mattis nec, quam. Nam molestie scelerisque quam. </p><p>Nullam feugiat cursus lacus.orem ipsum dolor sit amet, consectetur adipiscing elit. Donec libero risus, commodo vitae, pharetra mollis, posuere eu, pede. Nulla nec tortor. Donec id elit quis purus consectetur consequat. Nam congue semper tellus. Sed erat dolor, dapibus sit amet, venenatis ornare, ultrices ut, nisi. Aliquam ante. </p><p>Suspendisse scelerisque dui nec velit. Duis augue augue, gravida euismod, vulputate ac, facilisis id, sem. Morbi in orci. Nulla purus lacus, pulvinar vel, malesuada ac, mattis nec, quam. Nam molestie scelerisque quam. Nullam feugiat cursus lacus.orem ipsum dolor sit amet, consectetur adipiscing elit. Donec libero risus, commodo vitae, pharetra mollis, posuere eu, pede. Nulla nec tortor. Donec id elit quis purus consectetur consequat. Nam congue semper tellus. Sed erat dolor, dapibus sit amet, venenatis ornare, ultrices ut, nisi. </p>

	<!-- ui-dialog -->
	<div class="ui-overlay"><div class="ui-widget-overlay"></div><div class="ui-widget-shadow ui-corner-all" style="width: 302px; height: 152px; position: absolute; left: 50px; top: 30px;"></div></div>
	<div style="position: absolute; width: 280px; height: 130px;left: 50px; top: 30px; padding: 10px;" class="ui-widget ui-widget-content ui-corner-all">
		<div class="ui-dialog-content ui-widget-content" style="background: none; border: 0;">
			<p>
			2384u02934-3243294-23954320-328532-945-349-34-9534-89539485709345-34950834-534950934-5345083942-532048532-45038245-3245
			34u5034i5-34
			5345934593
			345-3945-3
			</p>
		</div>
	</div>

</div>

<!-- ui-dialog -->
<div id="dialog" title="Dialog Title">
	<p>
	<sf:form method="POST" modelAttribute="newUser" action="login">
			<fieldset>
				<table style="width: 50%;">
					<tr>
						<td colspan="2">Existing Users</td>
					</tr>
					<tr>
						<th><label for="user_screen_name">User name:</label></th>
						<td><sf:input path="userName" size="15" maxlength="15"
								id="user_screen_name" /> <small id="username_msg">No
								spaces,please.</small></td>
					</tr>
					<tr>
						<th><label for="user_password">Password:</label></th>
						<td><sf:password path="password" size="15"
								showPassword="true" id="user_password" /> <small>6
								characters or more(be tricky!)</small></td>
					</tr>
					<tr>
						<td><input name="commit" type="submit" value="Login" /></td>
						<td><input name="newUser" type="reset" value="Reset" /></td>
					</tr>

				</table>
			</fieldset>
		</sf:form>
</p>
</div>



<h2 class="demoHeaders">Framework Icons (content color preview)</h2>
<ul id="icons" class="ui-widget ui-helper-clearfix">
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-1-n"><span class="ui-icon ui-icon-carat-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-1-ne"><span class="ui-icon ui-icon-carat-1-ne"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-1-e"><span class="ui-icon ui-icon-carat-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-1-se"><span class="ui-icon ui-icon-carat-1-se"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-1-s"><span class="ui-icon ui-icon-carat-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-1-sw"><span class="ui-icon ui-icon-carat-1-sw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-1-w"><span class="ui-icon ui-icon-carat-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-1-nw"><span class="ui-icon ui-icon-carat-1-nw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-2-n-s"><span class="ui-icon ui-icon-carat-2-n-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-carat-2-e-w"><span class="ui-icon ui-icon-carat-2-e-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-1-n"><span class="ui-icon ui-icon-triangle-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-1-ne"><span class="ui-icon ui-icon-triangle-1-ne"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-1-e"><span class="ui-icon ui-icon-triangle-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-1-se"><span class="ui-icon ui-icon-triangle-1-se"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-1-s"><span class="ui-icon ui-icon-triangle-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-1-sw"><span class="ui-icon ui-icon-triangle-1-sw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-1-w"><span class="ui-icon ui-icon-triangle-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-1-nw"><span class="ui-icon ui-icon-triangle-1-nw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-2-n-s"><span class="ui-icon ui-icon-triangle-2-n-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-triangle-2-e-w"><span class="ui-icon ui-icon-triangle-2-e-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-1-n"><span class="ui-icon ui-icon-arrow-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-1-ne"><span class="ui-icon ui-icon-arrow-1-ne"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-1-e"><span class="ui-icon ui-icon-arrow-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-1-se"><span class="ui-icon ui-icon-arrow-1-se"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-1-s"><span class="ui-icon ui-icon-arrow-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-1-sw"><span class="ui-icon ui-icon-arrow-1-sw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-1-w"><span class="ui-icon ui-icon-arrow-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-1-nw"><span class="ui-icon ui-icon-arrow-1-nw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-2-n-s"><span class="ui-icon ui-icon-arrow-2-n-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-2-ne-sw"><span class="ui-icon ui-icon-arrow-2-ne-sw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-2-e-w"><span class="ui-icon ui-icon-arrow-2-e-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-2-se-nw"><span class="ui-icon ui-icon-arrow-2-se-nw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowstop-1-n"><span class="ui-icon ui-icon-arrowstop-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowstop-1-e"><span class="ui-icon ui-icon-arrowstop-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowstop-1-s"><span class="ui-icon ui-icon-arrowstop-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowstop-1-w"><span class="ui-icon ui-icon-arrowstop-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-1-n"><span class="ui-icon ui-icon-arrowthick-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-1-ne"><span class="ui-icon ui-icon-arrowthick-1-ne"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-1-e"><span class="ui-icon ui-icon-arrowthick-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-1-se"><span class="ui-icon ui-icon-arrowthick-1-se"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-1-s"><span class="ui-icon ui-icon-arrowthick-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-1-sw"><span class="ui-icon ui-icon-arrowthick-1-sw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-1-w"><span class="ui-icon ui-icon-arrowthick-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-1-nw"><span class="ui-icon ui-icon-arrowthick-1-nw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-2-n-s"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-2-ne-sw"><span class="ui-icon ui-icon-arrowthick-2-ne-sw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-2-e-w"><span class="ui-icon ui-icon-arrowthick-2-e-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthick-2-se-nw"><span class="ui-icon ui-icon-arrowthick-2-se-nw"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthickstop-1-n"><span class="ui-icon ui-icon-arrowthickstop-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthickstop-1-e"><span class="ui-icon ui-icon-arrowthickstop-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthickstop-1-s"><span class="ui-icon ui-icon-arrowthickstop-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowthickstop-1-w"><span class="ui-icon ui-icon-arrowthickstop-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturnthick-1-w"><span class="ui-icon ui-icon-arrowreturnthick-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturnthick-1-n"><span class="ui-icon ui-icon-arrowreturnthick-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturnthick-1-e"><span class="ui-icon ui-icon-arrowreturnthick-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturnthick-1-s"><span class="ui-icon ui-icon-arrowreturnthick-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturn-1-w"><span class="ui-icon ui-icon-arrowreturn-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturn-1-n"><span class="ui-icon ui-icon-arrowreturn-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturn-1-e"><span class="ui-icon ui-icon-arrowreturn-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowreturn-1-s"><span class="ui-icon ui-icon-arrowreturn-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowrefresh-1-w"><span class="ui-icon ui-icon-arrowrefresh-1-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowrefresh-1-n"><span class="ui-icon ui-icon-arrowrefresh-1-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowrefresh-1-e"><span class="ui-icon ui-icon-arrowrefresh-1-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrowrefresh-1-s"><span class="ui-icon ui-icon-arrowrefresh-1-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-4"><span class="ui-icon ui-icon-arrow-4"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-arrow-4-diag"><span class="ui-icon ui-icon-arrow-4-diag"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-extlink"><span class="ui-icon ui-icon-extlink"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-newwin"><span class="ui-icon ui-icon-newwin"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-refresh"><span class="ui-icon ui-icon-refresh"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-shuffle"><span class="ui-icon ui-icon-shuffle"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-transfer-e-w"><span class="ui-icon ui-icon-transfer-e-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-transferthick-e-w"><span class="ui-icon ui-icon-transferthick-e-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-folder-collapsed"><span class="ui-icon ui-icon-folder-collapsed"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-folder-open"><span class="ui-icon ui-icon-folder-open"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-document"><span class="ui-icon ui-icon-document"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-document-b"><span class="ui-icon ui-icon-document-b"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-note"><span class="ui-icon ui-icon-note"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-mail-closed"><span class="ui-icon ui-icon-mail-closed"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-mail-open"><span class="ui-icon ui-icon-mail-open"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-suitcase"><span class="ui-icon ui-icon-suitcase"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-comment"><span class="ui-icon ui-icon-comment"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-person"><span class="ui-icon ui-icon-person"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-print"><span class="ui-icon ui-icon-print"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-trash"><span class="ui-icon ui-icon-trash"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-locked"><span class="ui-icon ui-icon-locked"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-unlocked"><span class="ui-icon ui-icon-unlocked"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-bookmark"><span class="ui-icon ui-icon-bookmark"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-tag"><span class="ui-icon ui-icon-tag"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-home"><span class="ui-icon ui-icon-home"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-flag"><span class="ui-icon ui-icon-flag"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-calculator"><span class="ui-icon ui-icon-calculator"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-cart"><span class="ui-icon ui-icon-cart"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-pencil"><span class="ui-icon ui-icon-pencil"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-clock"><span class="ui-icon ui-icon-clock"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-disk"><span class="ui-icon ui-icon-disk"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-calendar"><span class="ui-icon ui-icon-calendar"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-zoomin"><span class="ui-icon ui-icon-zoomin"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-zoomout"><span class="ui-icon ui-icon-zoomout"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-search"><span class="ui-icon ui-icon-search"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-wrench"><span class="ui-icon ui-icon-wrench"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-gear"><span class="ui-icon ui-icon-gear"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-heart"><span class="ui-icon ui-icon-heart"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-star"><span class="ui-icon ui-icon-star"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-link"><span class="ui-icon ui-icon-link"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-cancel"><span class="ui-icon ui-icon-cancel"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-plus"><span class="ui-icon ui-icon-plus"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-plusthick"><span class="ui-icon ui-icon-plusthick"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-minus"><span class="ui-icon ui-icon-minus"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-minusthick"><span class="ui-icon ui-icon-minusthick"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-close"><span class="ui-icon ui-icon-close"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-closethick"><span class="ui-icon ui-icon-closethick"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-key"><span class="ui-icon ui-icon-key"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-lightbulb"><span class="ui-icon ui-icon-lightbulb"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-scissors"><span class="ui-icon ui-icon-scissors"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-clipboard"><span class="ui-icon ui-icon-clipboard"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-copy"><span class="ui-icon ui-icon-copy"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-contact"><span class="ui-icon ui-icon-contact"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-image"><span class="ui-icon ui-icon-image"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-video"><span class="ui-icon ui-icon-video"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-script"><span class="ui-icon ui-icon-script"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-alert"><span class="ui-icon ui-icon-alert"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-info"><span class="ui-icon ui-icon-info"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-notice"><span class="ui-icon ui-icon-notice"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-help"><span class="ui-icon ui-icon-help"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-check"><span class="ui-icon ui-icon-check"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-bullet"><span class="ui-icon ui-icon-bullet"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-radio-off"><span class="ui-icon ui-icon-radio-off"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-radio-on"><span class="ui-icon ui-icon-radio-on"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-pin-w"><span class="ui-icon ui-icon-pin-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-pin-s"><span class="ui-icon ui-icon-pin-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-play"><span class="ui-icon ui-icon-play"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-pause"><span class="ui-icon ui-icon-pause"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-seek-next"><span class="ui-icon ui-icon-seek-next"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-seek-prev"><span class="ui-icon ui-icon-seek-prev"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-seek-end"><span class="ui-icon ui-icon-seek-end"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-seek-first"><span class="ui-icon ui-icon-seek-first"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-stop"><span class="ui-icon ui-icon-stop"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-eject"><span class="ui-icon ui-icon-eject"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-volume-off"><span class="ui-icon ui-icon-volume-off"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-volume-on"><span class="ui-icon ui-icon-volume-on"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-power"><span class="ui-icon ui-icon-power"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-signal-diag"><span class="ui-icon ui-icon-signal-diag"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-signal"><span class="ui-icon ui-icon-signal"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-battery-0"><span class="ui-icon ui-icon-battery-0"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-battery-1"><span class="ui-icon ui-icon-battery-1"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-battery-2"><span class="ui-icon ui-icon-battery-2"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-battery-3"><span class="ui-icon ui-icon-battery-3"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-plus"><span class="ui-icon ui-icon-circle-plus"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-minus"><span class="ui-icon ui-icon-circle-minus"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-close"><span class="ui-icon ui-icon-circle-close"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-triangle-e"><span class="ui-icon ui-icon-circle-triangle-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-triangle-s"><span class="ui-icon ui-icon-circle-triangle-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-triangle-w"><span class="ui-icon ui-icon-circle-triangle-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-triangle-n"><span class="ui-icon ui-icon-circle-triangle-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-arrow-e"><span class="ui-icon ui-icon-circle-arrow-e"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-arrow-s"><span class="ui-icon ui-icon-circle-arrow-s"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-arrow-w"><span class="ui-icon ui-icon-circle-arrow-w"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-arrow-n"><span class="ui-icon ui-icon-circle-arrow-n"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-zoomin"><span class="ui-icon ui-icon-circle-zoomin"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-zoomout"><span class="ui-icon ui-icon-circle-zoomout"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circle-check"><span class="ui-icon ui-icon-circle-check"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circlesmall-plus"><span class="ui-icon ui-icon-circlesmall-plus"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circlesmall-minus"><span class="ui-icon ui-icon-circlesmall-minus"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-circlesmall-close"><span class="ui-icon ui-icon-circlesmall-close"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-squaresmall-plus"><span class="ui-icon ui-icon-squaresmall-plus"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-squaresmall-minus"><span class="ui-icon ui-icon-squaresmall-minus"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-squaresmall-close"><span class="ui-icon ui-icon-squaresmall-close"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-grip-dotted-vertical"><span class="ui-icon ui-icon-grip-dotted-vertical"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-grip-dotted-horizontal"><span class="ui-icon ui-icon-grip-dotted-horizontal"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-grip-solid-vertical"><span class="ui-icon ui-icon-grip-solid-vertical"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-grip-solid-horizontal"><span class="ui-icon ui-icon-grip-solid-horizontal"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-gripsmall-diagonal-se"><span class="ui-icon ui-icon-gripsmall-diagonal-se"></span></li>
	<li class="ui-state-default ui-corner-all" title=".ui-icon-grip-diagonal-se"><span class="ui-icon ui-icon-grip-diagonal-se"></span></li>
</ul>


<!-- Slider -->
<h2 class="demoHeaders">Slider</h2>
<div id="slider"></div>



<!-- Datepicker -->
<h2 class="demoHeaders">Datepicker</h2>
<div id="datepicker"></div>



<!-- Progressbar -->
<h2 class="demoHeaders">Progressbar</h2>
<div id="progressbar"></div>



<!-- Progressbar -->
<h2 class="demoHeaders">Selectmenu</h2>
<select id="selectmenu">
	<option>Slower</option>
	<option>Slow</option>
	<option selected="selected">Medium</option>
	<option>Fast</option>
	<option>Faster</option>
</select>



<!-- Spinner -->
<h2 class="demoHeaders">Spinner</h2>
<input id="spinner">



<!-- Menu -->
<h2 class="demoHeaders">Menu</h2>
<ul style="width:100px;" id="menu">
	<li>Item 1</li>
	<li>Item 2</li>
	<li>Item 3
		<ul>
			<li>Item 3-1</li>
			<li>Item 3-2</li>
			<li>Item 3-3</li>
			<li>Item 3-4</li>
			<li>Item 3-5</li>
		</ul>
	</li>
	<li>Item 4</li>
	<li>Item 5</li>
</ul>



<!-- Tooltip -->
<h2 class="demoHeaders">Tooltip</h2>
<p id="tooltip">
	<a href="#" title="That&apos;s what this widget is">Tooltips</a> can be attached to any element. When you hover
the element with your mouse, the title attribute is displayed in a little box next to the element, just like a native tooltip.
</p>


<!-- Highlight / Error -->
<h2 class="demoHeaders">Highlight / Error</h2>
<div class="ui-widget">
	<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">
		<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
		<strong>Hey!</strong> Sample ui-state-highlight style.</p>
	</div>
</div>
<br>
<div class="ui-widget">
	<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
		<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
		<strong>Alert:</strong> Sample ui-state-error style.</p>
	</div>
</div>

<script>

$( "#accordion" ).accordion();



var availableTags = [
	"ActionScript",
	"AppleScript",
	"Asp",
	"BASIC",
	"C",
	"C++",
	"Clojure",
	"COBOL",
	"ColdFusion",
	"Erlang",
	"Fortran",
	"Groovy",
	"Haskell",
	"Java",
	"JavaScript",
	"Lisp",
	"Perl",
	"PHP",
	"Python",
	"Ruby",
	"Scala",
	"Scheme"
];
$( "#autocomplete" ).autocomplete({
	source: availableTags
});



$( "#button" ).button();
$( "#radioset" ).buttonset();



$( "#tabs" ).tabs();



$( "#dialog" ).dialog({
	autoOpen: false,
	width: 400,
	buttons: [
		{
			text: "Ok",
			click: function() {
				$( this ).dialog( "close" );
			}
		},
		{
			text: "Cancel",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
	]
});

// Link to open the dialog
$( "#dialog-link" ).click(function( event ) {
	$( "#dialog" ).dialog( "open" );
	event.preventDefault();
});



$( "#datepicker" ).datepicker({
	inline: true
});



$( "#slider" ).slider({
	range: true,
	values: [ 17, 67 ]
});



$( "#progressbar" ).progressbar({
	value: 20
});



$( "#spinner" ).spinner();



$( "#menu" ).menu();



$( "#tooltip" ).tooltip();



$( "#selectmenu" ).selectmenu();


// Hover states on the static widgets
$( "#dialog-link, #icons li" ).hover(
	function() {
		$( this ).addClass( "ui-state-hover" );
	},
	function() {
		$( this ).removeClass( "ui-state-hover" );
	}
);
</script>

	

</body>
</html>
