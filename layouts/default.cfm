<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Central Toronto Volleyball League</title>
	<link href="/assets/css/ctvbGlobal.css" rel="stylesheet" type="text/css" />
	<!-- Open:  Bootstrap 3.3.5 -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<!-- Optional theme -->
	<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" />-->
	<link rel="stylesheet" href="/assets/css/bootstrap.cerulean.min.css" />
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
	<!-- Close: Bootstrap 3.3.5 -->
</head>

<body>
	<div class="col-lg-12">
		<div class="page-header" style="margin: 0px;"><img src="/assets/images/header.jpg" /></div>
		<div class="bs-component">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="/?action=main">Home <span class="sr-only">(current)</span></a></li>
							<li><a href="/?action=about">About</a></li>
							<li><a href="/?action=register">Register</a></li>
							<li><a href="/?action=currentSeason">2015/16 Season</a></li>
							<li><a href="/?action=schedule">Schedule</a></li>
							<li><a href="/?action=teams">Teams</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Forms <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/?action=registrationTeam">Team Registration</a></li>
									<li><a href="/?action=registrationIndividual">Individual Registration</a></li>
									<li><a href="/?action=waiver">Waiver</a></li>
									<li class="divider"></li>
									<li><a href="/?action=scoresheet">Scoresheet</a></li>
								</ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">Contact</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<cfoutput>#body#</cfoutput>
	</div>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>
