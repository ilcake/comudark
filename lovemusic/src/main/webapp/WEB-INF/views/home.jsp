<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CoMu</title>
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
<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_1pa.png" />

<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate.min.js"></script>

<link rel="stylesheet" href="myfiles/css/animate.css" />
<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
</head>

<style>
#menu, h4 {
	/* width: 100px;
    height: 100px; */
	/* position: relative; */
	animation: slideInDown 1s;
}

span {
	animation: zoomIn 1s;
	animation-fill-mode: forwards;
}

@
keyframes slideInDown {from { transform:translate3d(0, -100%, 0);
	visibility: visible;
}

to {
	transform: translate3d(0, 0, 0);
}

}
@
keyframes zoomIn {from { opacity:0;
	transform: scale3d(.3, .3, .3);
}

50%{
opacity
 
1;
}
}
@
keyframes pulse {from { transform:scale3d(1, 1, 1);
	
}

50%
{
transform
 
:scale3d


(1
.05
,
1
.05
,
1
.05


































);
}
to {
	transform: scale3d(1, 1, 1);
}
}
</style>


<body>
	<!-- ====================== HEADER ================================================ -->
	<header id="home" class="qt-header parallax-container scrollspy">
		<div class="parallax"
			data-start="width:100%;height:100%;top: 0%;left: 0%;"
			data-end="width:260%;height:260%;top:-80%;left:-80%;">
			<img src="" alt="" id="theBackg">
		</div>
		<div class="qt-valign-wrapper">
			<div class="qt-valign">
				<div class="container center-align">
					<span class="mymove" style="display: block;"> <!-- myfiles/images/main/logo_1.png -->
						<img src="myfiles/images/main/logo_1.png" class="logo" alt="COMU"
						style="width: 350px;">
					</span>
					<h4>
						<a href='login'>Login</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href='join'>Join</a>
					</h4>
				</div>
			</div>
		</div>
		<div class="qt-particles" id="particlesheader" data-color="#ffffff"
			data-opacity="0.5" data-speed="1"></div>
	</header>
	<!-- ====================== HEADER END ================================================ -->


	<!-- ====================== MENU ================================================ -->
	<div id="menu" class="qt-menu-wrapper">
		<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
			<!-- desktop menu -->
			<ul class="qt-desktopmenu">
				<li><a href="home" class="qwsmoothscroll active">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll">HiCu</a></li>
				<li><a href="mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="shared" class="qwsmoothscroll">Shared</a></li>
				<li><a href="howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<!-- mobile menu -->
			<ul id="slide-out" class="side-nav qt-mobilemenu">
				<li><a href="home" class="qwsmoothscroll active">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll">HiCu</a></li>
				<li><a href="mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="shared" class="qwsmoothscroll">Shared</a></li>
				<li><a href="howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<a href="#" data-activates="slide-out"
				class="button-collapse qt-menu-switch"><span
				class="lnr lnr-menu"></span></a>
		</nav>
	</div>
	<!-- ====================== MENU END ================================================ -->

	<!-- <div id="presskit"
		class="section section-presskit parallax-container scrollspy">
		<div class="parallax">
			<img src="images/galaxy-2.jpg" alt="background">
		</div>
	</div> -->

	<!-- QT FOOTER ================================ -->
	<script src="js/modernizr-custom.js"></script>


	<!--  CUSTOM JS LIBRARIES: =========================================================== -->
	<script src="js/materializecss/bin/materialize.min.js"></script>
	<script src="components/slick/slick.min.js"></script>
	<script src="components/skrollr/skrollr.min.js"></script>
	<script src="components/particles/particles.min.js"></script>

	<script src="components/swipebox/lib/ios-orientationchange-fix.js"></script>
	<script src="components/swipebox/src/js/jquery.swipebox.min.js"></script>

	<!-- MAIN JAVASCRIPT FILE ================================ -->
	<script src="js/qt-main.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#theBackg").attr("style", "");
	
		});
	</script>
</body>
<style>
body {
	background: url("images/bck6.jpeg") no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	overflow: hidden;
}
</style>

</html>
