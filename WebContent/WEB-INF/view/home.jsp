<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="image/favicon.ico">

<title>Carousel Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="js/ie-emulation-modes-warning.js"></script>
<link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Custom styles for this template -->
<link href="css/carousel.css" rel="stylesheet">

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>

</head>
<!-- NAVBAR
================================================== -->
<body>
	<div class="navbar-wrapper">
		<div class="container">

			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a href="home.html"> <img class="navbar-header" src="image/logo_new_dark.png"
							alt="QualyVal" width="62" height="62"></a> <a
							class="navbar-brand" href="home.html"> <span
							style="color: #FE9900; font-family: kaushan script; font-size: 30px;">Qualy</span><span
							style="color: #088EF2; font-family: kaushan script; font-size: 30px;">Val</span>
						</a>
					</div>
					<div id="navbar" class="navbar-collapse collapse"
						style="float: right;">
						<ul class="nav navbar-nav">


							<li class="active"><a href="home.html">Home</a></li>


							<li  class="dropdown"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-expanded="false">Dropdown <span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="features.html">What is CFC?</a></li>
									<li><a href="features.html">What is MIS?</a></li>
									<li><a href="features.html">is MIS Required?</a></li>
									<li><a href="features.html">How Can We Help?</a></li>
									<li class="divider"></li>
									<li class="dropdown-header">Demo</li>
									<li><a href="dashboard1.html">Sample Demo 1</a></li>
									<li><a href="dashboard2.html">Sample Demo 2</a></li>
									<li><a href="dashboard3.html">Sample Demo 3</a></li>
								</ul></li>

							<li><a href="contactus.html">Contact Us</a></li>
							<li><a href="aboutus.html">About Us</a></li>
						</ul>
					</div>
				</div>
			</nav>

		</div>
	</div>

	<br />
	<br />
	<!-- Carousel
    ================================================== -->
	<div class="container">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="image/Banner1.jpg" alt="Pic1" width="460" height="345">
				</div>

				<div class="item">
					<img src="image/Banner2.png" alt="Chania" width="460" height="345">
				</div>

				<div class="item">
					<img src="image/Banner3.png" alt="Flower" width="460" height="345">
				</div>

				<div class="item">
					<img src="image/Banner4.jpg" alt="Flower" width="460" height="345">
				</div>
				
				<div class="item">
					<img src="image/Banner6.jpg" alt="Flower" width="460" height="345">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>


	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->
	<br />
	<div class="container marketing">

		<!-- Three columns of text below the carousel -->
		<div class="row">
			<div class="col-lg-3">
				<img class="img-circle"
					src="image/consulting1.png"
					alt="Consulting"
					style="width: 100px; height: 100px;">
				<h2>Consulting Solutions</h2>
				<p>Do you struggle to make data meaningful? Our Business
					consultants are expert in powerful data, analysis and providing
					opinions relevant to your business</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-3 -->
			<div class="col-lg-3">
				<img class="img-circle"
					src="image/k17264609.jpg"
					alt="Business Intelligence"
					style="width: 100px; height: 100px;">
				<h2>Business Intelligence</h2>
				<p>Our BI solution converts raw data into business insights
					thereby helping organisation to make an informed decision.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-3 -->
			<div class="col-lg-3">
				<img class="img-circle"
					src="image/analysis.jpg"
					alt="Data Visualisation"
					style="width: 100px; height: 100px;">
				<h2>Data Visualisation&nbsp;&nbsp;&nbsp;&nbsp;</h2>
				<p>Data visualisation solution communicate complex information
					in an intuitive, accessible way.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-3">
				<img class="img-circle"
					src="image/see-waste.jpg"
					alt="Advance Analytics"
					style="width: 100px; height: 100px;">
				<h2>Advance Analytics&nbsp;&nbsp;&nbsp;</h2>
				<p>Our Advance analytics solution is based on statistical
					modeling. We have delivered measurable values to numerous business
					using it.</p>
				<p>
					<a class="btn btn-default" href="#" role="button">View details
						&raquo;</a>
				</p>
			</div>
			<!-- /.col-lg-3 -->
		</div>
		<!-- /.row -->


		<!-- START THE FEATURETTES -->

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					First featurette heading. <span class="text-muted">It'll
						blow your mind.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
			<div class="col-md-5">
				<img class="featurette-image img-responsive"
					data-src="holder.js/500x500/auto" alt="Generic placeholder image">
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-5">
				<img class="featurette-image img-responsive"
					data-src="holder.js/500x500/auto" alt="Generic placeholder image">
			</div>
			<div class="col-md-7">
				<h2 class="featurette-heading">
					Oh yeah, it's that good. <span class="text-muted">See for
						yourself.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-7">
				<h2 class="featurette-heading">
					And lastly, this one. <span class="text-muted">Checkmate.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
			<div class="col-md-5">
				<img class="featurette-image img-responsive"
					data-src="holder.js/500x500/auto" alt="Generic placeholder image">
			</div>
		</div>

		<hr class="featurette-divider">

		<div class="row featurette">
			<div class="col-md-5">
				<img class="featurette-image img-responsive"
					data-src="holder.js/500x500/auto" alt="Generic placeholder image">
			</div>
			<div class="col-md-7">
				<h2 class="featurette-heading">
					Oh yeah, it's that good. <span class="text-muted">See for
						yourself.</span>
				</h2>
				<p class="lead">Donec ullamcorper nulla non metus auctor
					fringilla. Vestibulum id ligula porta felis euismod semper.
					Praesent commodo cursus magna, vel scelerisque nisl consectetur.
					Fusce dapibus, tellus ac cursus commodo.</p>
			</div>
		</div>
		<!-- /END THE FEATURETTES -->


		<!-- FOOTER -->
		<footer>
			<p class="pull-right">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot;
				<a href="#">Terms</a>
			</p>
		</footer>

	</div>
	<!-- /.container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
