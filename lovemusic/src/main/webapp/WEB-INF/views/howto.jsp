<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/qt-main.css">
<!-- INCLUDES THE CSS FRAMEWORK VIA #IMPORT AND SASS -->
<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_1pa.png" />

<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
<script src="resources/jquery-3.1.1.min.js"></script>
<!-- <script src="js/jquery.js"></script>
<script src="js/jquery-migrate.min.js"></script> -->
<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link href='components/slick/slick.css' rel='stylesheet' type='text/css'>
<link href='components/swipebox/src/css/swipebox.min.css'
	rel='stylesheet' type='text/css'>
<link href='fonts/iconfont/style.css' rel='stylesheet' type='text/css'>
<link href='fonts/qticons/qticons.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/qt-main.css">

<style type="text/css">
body {
	text-align: center;
}

textarea {
	min-height: 200px;
}
</style>

</head>
<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<script type="text/javascript">
		$(".qwsmoothscroll").eq(5).addClass("active");
	</script>

	<!-- HowTo content START -->
	<div id="totalWrapper" style="background-color: white;">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					CoMu 사용법
					<p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Morbi enim quam, cursus ut metus non, posuere pulvinar purus.
						Vestibulum et lorem vel neque consectetur finibus vitae id tortor.
						Donec leo felis, rutrum at porta nec, pulvinar faucibus sapien.
						Integer sollicitudin neque eget facilisis iaculis. Phasellus
						ultrices rutrum orci, in imperdiet urna vestibulum a. Phasellus ut
						odio nec augue ullamcorper sodales. In consectetur et arcu a
						dignissim."</p>
				</div>
				<div class="col-md-6">
					<h5>Sample Code</h5>
					<textarea style="resize: none; wrap: hard;" rows="50" cols="50"
						readonly="readonly">"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Morbi enim quam, cursus ut metus non, posuere pulvinar purus.
						Vestibulum et lorem vel neque consectetur finibus vitae id tortor.
						Donec leo felis, rutrum at porta nec, pulvinar faucibus sapien.
						Integer sollicitudin neque eget facilisis iaculis. Phasellus
						ultrices rutrum orci, in imperdiet urna vestibulum a. Phasellus ut
						odio nec augue ullamcorper sodales. In consectetur et arcu a
						dignissim."</textarea>
					<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">1.사용법</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</div>
				<div class="col-md-3">1. 사용법을 알려준다</div>
				<div class="col-md-6">
					<audio controls="controls">
						<!-- <source src="C:\Users\Public\Music\Sample Music\Kalimba.mp3"> -->
					</audio>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">2.사용법</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</div>
				<div class="col-md-3">2. 사용법을 알려준다</div>
				<div class="col-md-6">
					<audio controls="controls">
						<!-- <source src="C:\Users\Public\Music\Sample Music\Kalimba.mp3"> -->
					</audio>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">3.사용법</div>
				<div class="col-md-1">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</div>
				<div class="col-md-3">3. 사용법을 알려준다</div>
				<div class="col-md-6">
					<audio controls="controls">
						<!-- <source src="C:\Users\Public\Music\Sample Music\Kalimba.mp3"> -->
					</audio>
				</div>
			</div>
		</div>
	</div>

	<!-- HowTo content END -->
</body>
</html>