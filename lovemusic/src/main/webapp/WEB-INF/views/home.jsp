<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link href='components/slick/slick.css' rel='stylesheet' type='text/css'>
<link href='components/swipebox/src/css/swipebox.min.css'
	rel='stylesheet' type='text/css'>
<link href='fonts/iconfont/style.css' rel='stylesheet' type='text/css'>
<link href='fonts/qticons/qticons.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/qt-main.css">
<!-- INCLUDES THE CSS FRAMEWORK VIA #IMPORT AND SASS -->
<link rel="shortcut icon" type="image/png" href="images/favicon.png" />
</head>
<body>


	<!-- ====================== HEADER ================================================ -->
	<header id="home" class="qt-header parallax-container scrollspy">
		<div class="parallax"
			data-start="width:100%;height:100%;top: 0%;left: 0%;"
			data-end="width:260%;height:260%;top:-80%;left:-80%;">
			<img src="images/galaxy-1.jpg" alt="background">
		</div>
		<div class="qt-valign-wrapper">
			<div class="qt-valign">
				<div class="container center-align">
					<img src="images/logo.png" class="logo" alt="Sonik template">
					<h4>DJ PRODUCER HTML TEMPLATE</h4>
				</div>
			</div>
		</div>
		<div class="qt-particles" id="particlesheader" data-color="#ffffff"
			data-opacity="0.5" data-speed="1"></div>
	</header>
	<!-- ====================== HEADER END ================================================ -->


	<!-- ====================== MENU ================================================ -->
	<div id="menu" class="qt-menu-wrapper" data-0-top>
		<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
			<!-- desktop menu -->
			<ul class="qt-desktopmenu">
				<li><a href="#home" class="qwsmoothscroll">Home</a></li>
				<li><a href="#music" class="qwsmoothscroll">CoMu</a></li>
				<li><a href="#photos" class="qwsmoothscroll">HiCu</a></li>
				<li><a href="#bio" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="#booking" class="qwsmoothscroll">Shared</a></li>
				<li><a href="#presskit" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="#video" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<!-- mobile menu -->
			<ul id="slide-out" class="side-nav qt-mobilemenu">
				<li><a href="#home" class="qwsmoothscroll">Home</a></li>
				<li><a href="#music" class="qwsmoothscroll">CoMu</a></li>
				<li><a href="#photos" class="qwsmoothscroll">HiCu</a></li>
				<li><a href="#bio" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="#booking" class="qwsmoothscroll">Shared</a></li>
				<li><a href="#presskit" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="#video" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<a href="#" data-activates="slide-out"
				class="button-collapse qt-menu-switch"><span
				class="lnr lnr-menu"></span></a>
		</nav>
	</div>
	<!-- ====================== MENU END ================================================ -->

</body>
</html>
