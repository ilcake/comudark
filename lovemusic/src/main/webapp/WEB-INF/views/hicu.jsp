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

<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate.min.js"></script>
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
<!-- INCLUDES THE CSS FRAMEWORK VIA #IMPORT AND SASS -->
<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_comu.png" />
<!-- COMU BACKGROUND VIDEO CSS -->
<link rel="stylesheet" type="text/css" href="myfiles/css/hicu.css">
</head>
<body>
	<!-- ====================== MENU ================================================ -->
	<div id="menu" class="qt-menu-wrapper" data-0-top>
		<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
			<!-- desktop menu -->
			<ul class="qt-desktopmenu">
				<li><a href="home" class="qwsmoothscroll">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll active">HiCu</a></li>
				<li><a href="mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="shared" class="qwsmoothscroll">Shared</a></li>
				<li><a href="howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<!-- mobile menu -->
			<ul id="slide-out" class="side-nav qt-mobilemenu">
				<li><a href="home" class="qwsmoothscroll">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll active">HiCu</a></li>
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


	<div id="presskit"
		class="section section-presskit parallax-container scrollspy">
		<div class="parallax">
			<div class="homepage-hero-module">
				<div class="video-container">
					<div class="title-container">

						<!-- ============== HICU CONTENT  ================= -->
						<div class="row">
							<div class="main main-raised">
								<div class="section section-basic">

									<!-- outer container -->
									<div class="containerB">

										<!--  whole pad  -->
										<div class="containerBIN" id="pad">
											<div class="selectLine" id="beatLine">
												<table class="theSelectionTable">

													<th><span class="label">Beats</span><select
														id="beatSelection"><option value="beat">MadeSet</option>
															<option value="acu">Acustic</option>
															<option value="r8">R8</option></select> <img
														src="myfiles/images/hicu/ins_add.png" class="ins_add"
														dt-ins="beats"></th>

													<th><span class="label">Bass</span><img
														src="myfiles/images/hicu/ins_add.png" class="ins_add"
														dt-ins="bass"> &nbsp;&nbsp;&nbsp; <span
														class="label">Melody</span><img
														src="myfiles/images/hicu/ins_add.png" class="ins_add"
														dt-ins="melody"></th>
													</tr>
												</table>
											</div>

											<!-- Buttons Row -->
											<div class="btnsArea" id="btnsBeat"></div>
											<div class="btnsArea" id="btnsBass"></div>
											<div class="btnsArea" id="btnsMelody"></div>

											<!--------   LED Row   --------->
											<div class="buttons_row" id="LED_row">
												<span class="label blank">GO</span>
											</div>
										</div>
										<hr />
										<div class="containerBIN" id="tools">
											<div class="toolBtns" id="toolBtns">
												<span id="playStop"> <img id="play"
													src="myfiles/images/hicu/btn_play.png" width="80"
													height="33"><img id="stop"
													src="myfiles/images/hicu/btn_stop.png" width="80"
													height="33"></span> <span id="toolBlank"></span><span
													id="saveReset"><img id="save"
													src="myfiles/images/hicu/btn_save.png"><img
													id="reset" src="myfiles/images/hicu/btn_reset.png"></span>
											</div>
											<div>
												<textarea id="resultCode"></textarea>
											</div>
										</div>
									</div>
								</div>
								<!-- 
								<footer class="footer">
									<div class="container"></div>
								</footer> -->
							</div>
						</div>

					</div>

					<div class="filter"></div>
					<video autoplay loop class="fillWidth">
						<source src="myfiles/video/For_Wes.mp4" type="video/mp4" />
					</video>


				</div>
			</div>
		</div>
	</div>

	<!-- =======  CUSTOM JS LIBRARIES: ======================== -->
	<script src="js/materializecss/bin/materialize.min.js"></script>
	<script src="components/slick/slick.min.js"></script>
	<script src="components/skrollr/skrollr.min.js"></script>
	<script src="components/particles/particles.min.js"></script>

	<script src="components/swipebox/lib/ios-orientationchange-fix.js"></script>
	<script src="components/swipebox/src/js/jquery.swipebox.min.js"></script>

	<!-- ======= MAIN JAVASCRIPT FILE ======================== -->
	<script src="js/qt-main.js"></script>

	<!-- ======= BACKGRUOUND VIDEO SCRIPT ================ -->
	<script src="myfiles/js/bg-movie.js"></script>
	<!-- ======= HICU BACKGRUOUND VIDEO SCRIPT END =========== -->

	<!--  HICU Action  -->
	<script src="myfiles/js/hicu.js"></script>
	<script src="resources/audiojs/three.min.js"></script>
	<script src="resources/audiojs/comu.js"></script>

</body>

</html>
