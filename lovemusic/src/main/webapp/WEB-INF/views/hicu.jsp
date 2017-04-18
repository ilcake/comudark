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
<style type="text/css">
/* .qt-particles {
	background-image: url("images/galaxy-2.jpg");
} */
.homepage-hero-module {
	border-right: none;
	border-left: none;
	position: relative;
}

.no-video .video-container video, .touch .video-container video {
	display: none;
}

.no-video .video-container .poster, .touch .video-container .poster {
	display: block !important;
}

.video-container {
	position: relative;
	bottom: 0%;
	left: 0%;
	height: 100%;
	width: 100%;
	overflow: hidden;
	background: #000;
}

.video-container .poster img {
	width: 100%;
	bottom: 0;
	position: absolute;
}

.video-container .filter {
	z-index: 100;
	position: absolute;
	background: rgba(0, 0, 0, 0.4);
	width: 100%;
}

.video-container video {
	position: absolute;
	z-index: 0;
	bottom: 0;
}

.video-container video.fillWidth {
	width: 100%;
}

.video-container .title-container {
	z-index: 1000;
	position: absolute;
	top: 9%;
	margin-left: 10%;
	width: 80%;
	background-color: rgba(255, 255, 255, 0.8);
	width: 80%;
}

.text {
	color: black;
}

.text-thin {
	font-weight: 100
}
</style>
</head>
<body>
	<!-- ====================== HEADER ================================================ -->
	<!-- <header id="home" class="qt-header parallax-container scrollspy">
		<div class="parallax"
			data-start="width:100%;height:100%;top: 0%;left: 0%;"
			data-end="width:260%;height:260%;top:-80%;left:-80%;">
			<img src="images/galaxy-1.jpg" alt="background">
		</div>
		<div class="qt-valign-wrapper">
			<div class="qt-valign">
				<div class="container center-align">
					<img src="myfiles/images/logo_1.png" class="logo"
						alt="Sonik template" style="width: 300px;">
					<h4>
						<a href='#login'>Login</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href='#join'>Join</a>
					</h4>
				</div>
			</div>
		</div>
		<div class="qt-particles" id="particlesheader" data-color="#ffffff"
			data-opacity="0.5" data-speed="1"></div>
	</header> -->
	<!-- ====================== HEADER END ================================================ -->


	<!-- ====================== MENU ================================================ -->
	<div id="menu" class="qt-menu-wrapper" data-0-top>
		<!-- <div class="qt-particles" id="particlesheader" data-color="#ffffff"
			data-opacity="0.5" data-speed="1"></div> -->
		<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
			<!-- desktop menu -->
			<ul class="qt-desktopmenu">
				<li><a href="home" class="qwsmoothscroll">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll active">HiCu</a></li>
				<li><a href="#mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="#shared" class="qwsmoothscroll">Shared</a></li>
				<li><a href="#howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="#aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<!-- mobile menu -->
			<ul id="slide-out" class="side-nav qt-mobilemenu">
				<li><a href="home" class="qwsmoothscroll">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll active">HiCu</a></li>
				<li><a href="#mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="#shared" class="qwsmoothscroll">Shared</a></li>
				<li><a href="#howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="#aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<a href="#" data-activates="slide-out"
				class="button-collapse qt-menu-switch"><span
				class="lnr lnr-menu"></span></a>
		</nav>
	</div>
	<!-- ====================== MENU END ================================================ -->

	<!-- <img src="images/galaxy-2.jpg" alt="background"> -->

	<div id="presskit"
		class="section section-presskit parallax-container scrollspy">
		<div class="parallax">
			<div class="homepage-hero-module">
				<div class="video-container">
					<div class="title-container">

						<!--Original logo height 80px-->
						<!-- 로고 위치 
               			<img src="/assets/Coverr-40bfea29db9c1dff5dbea5f6238cc98a.svg"
                  		height="80" alt=""> -->

						<!-- ============== HICU CONTENT  ================= -->
						<div class="row">
							<div class="main main-raised">
								<div class="section section-basic">
									<div class="containerB">

										<div class="containerBIN" id="pad">
											<div class="selectLine">
												<span class="label">Beats</span><select id="beatSelection"><option
														value="Loops">MadeSet</option>
													<option value="ACU">Acustic</option>
													<option value="R8">R8</option></select> <img
													src="myfiles/images/hicu/ins_add.png" class="ins_add">
											</div>

											<div class="buttons_row" id="beatSection">
												<span class="label">Loops</span> <img id="beat1"
													class="hiBtn" src="myfiles/images/hicu/button_off.png"><img
													id="beat2" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat3" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat4" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat5" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat6" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat7" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat8" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat9" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat10" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat11" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat12" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat13" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat14" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat15" class="hiBtn"
													src="myfiles/images/hicu/button_off.png"><img
													id="beat16" class="hiBtn"
													src="myfiles/images/hicu/button_off.png">
											</div>
											<div></div>
											<div class="selectLine">
												<span class="label">Ins</span><select id="InsSelection"><option
														value="guitarCode">GuitarC</option>
													<option value="guitarNote">GuitarN</option>
													<option value="piano">Piano</option></select> <img
													src="myfiles/images/hicu/ins_add.png" class="ins_add">
											</div>

											<div class="buttons_row" id="LED_row">
												<span class="label blank">GO</span> <img class="leds"
													id="LED_1" src="myfiles/images/hicu/LED_off.png"><img
													class="leds" id="LED_2"
													src="myfiles/images/hicu/LED_off.png"><img id="LED_3"
													class="leds" src="myfiles/images/hicu/LED_off.png"><img
													id="LED_4" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img id="LED_5"
													class="leds" src="myfiles/images/hicu/LED_off.png"><img
													id="LED_6" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img id="LED_7"
													class="leds" src="myfiles/images/hicu/LED_off.png"><img
													id="LED_8" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img id="LED_9"
													class="leds" src="myfiles/images/hicu/LED_off.png"><img
													id="LED_10" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img
													id="LED_11" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img
													id="LED_12" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img
													id="LED_13" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img
													id="LED_14" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img
													id="LED_15" class="leds"
													src="myfiles/images/hicu/LED_off.png"><img
													id="LED_16" class="leds"
													src="myfiles/images/hicu/LED_off.png">
											</div>
											<div>
												<br />
											</div>
										</div>
										<div class="containerBIN" id="tools">
											<img id="play" src="myfiles/images/hicu/btn_play.png"
												width="80" height="33"> <img id="stop"
												src="myfiles/images/hicu/btn_stop.png" width="80"
												height="33"> <img id="save"
												src="myfiles/images/hicu/btn_save.png"> <img id="load"
												src="myfiles/images/hicu/btn_load.png"> <img
												id="reset" src="myfiles/images/hicu/btn_reset.png">
											<div>
												<textarea id="resultCode"></textarea>
											</div>
										</div>
									</div>
								</div>

								<footer class="footer">
									<div class="container"></div>
								</footer>
							</div>
						</div>

					</div>

					<div class="filter"></div>
					<video autoplay loop class="fillWidth">
						<source src="myfiles/video/For_Wes.mp4" type="video/mp4" />
					</video>

					<!--    영상 로딩 전 보여줄 화면
         <div class="poster hidden">
            <img src="PATH_TO_JPEG" alt="">
         </div> -->

				</div>
			</div>
		</div>
	</div>


	<!-- ======= QT FOOTER ================================ -->
	<script src="js/modernizr-custom.js"></script>


	<!-- =======  CUSTOM JS LIBRARIES: ======================== -->
	<script src="js/materializecss/bin/materialize.min.js"></script>
	<script src="components/slick/slick.min.js"></script>
	<script src="components/skrollr/skrollr.min.js"></script>
	<script src="components/particles/particles.min.js"></script>

	<script src="components/swipebox/lib/ios-orientationchange-fix.js"></script>
	<script src="components/swipebox/src/js/jquery.swipebox.min.js"></script>

	<!-- ======= MAIN JAVASCRIPT FILE ======================== -->
	<script src="js/qt-main.js"></script>

	<!-- ======= COMU BACKGRUOUND VIDEO SCRIPT ================ -->
	<script type="text/javascript">
		$(document).ready(function() {
			//setBackGroundMusic();
	
			scaleVideoContainer();
			initBannerVideoSize('.video-container .poster img');
			initBannerVideoSize('.video-container .filter');
			initBannerVideoSize('.video-container video');
	
			$(window).on('resize', function() {
				scaleVideoContainer();
				scaleBannerVideoSize('.video-container .poster img');
				scaleBannerVideoSize('.video-container .filter');
				scaleBannerVideoSize('.video-container video');
			});
	
		});
	
		/* function setBackGroundMusic() {
			var bgm = new Audio('');
			if (!bgm.canPlayType('audio/ogg'))
				alert('브라우저가 ogg 재생을 지원하지 않습니다.');else {
				var bgm_url = 'http://upload.wikimedia.org/wikipedia/commons/d/d7/Wikinews_Remix_Jingle.ogg';
				bgm = new Audio(bgm_url);
				bgm.addEventListener('ended', function() {
					this.currentTime = 0;
					this.play();
				}, false);
				bgm.play();
			} */
	
		/* var myCirclePlayer = new CirclePlayer("#jquery_jplayer_1", {
		   m4a : "http://www.jplayer.org/audio/m4a/Miaow-07-Bubble.m4a",
		   oga : "http://www.jplayer.org/audio/ogg/Miaow-07-Bubble.ogg"
		}, {
		   cssSelectorAncestor : "#cp_container_1",
		   swfPath : "../dist/jplayer",
		   wmode : "window",
		   keyEnabled : true
		});
		 */
	
		//}
		function scaleVideoContainer() {
			var height = $(window).height() + 5;
			var unitHeight = parseInt(height) + 'px';
			$('.homepage-hero-module').css('height', unitHeight);
	
		}
	
		function initBannerVideoSize(element) {
			$(element).each(function() {
				$(this).data('height', $(this).height());
				$(this).data('width', $(this).width());
			});
			scaleBannerVideoSize(element);
		}
	
		function scaleBannerVideoSize(element) {
			var windowWidth = $(window).width();
			var windowHeight = $(window).height() + 5;
			var videoWidth,
				videoHeight;
			// console.log(windowHeight);
			$(element).each(
				function() {
					var videoAspectRatio = $(this).data('height')
					//$(this).data('width');
	
					$(this).width(windowWidth);
					/* if (windowWidth < 1000) {
					   videoHeight = windowHeight;
					   videoWidth = videoHeight / videoAspectRatio;
					   $(this).css(
					         {
					            'margin-top' : 0,
					            'margin-left' : -(videoWidth - windowWidth)
					                  / 2 + 'px'
					         });
					   $(this).width(videoWidth).height(videoHeight);
					} */
					$('.homepage-hero-module .video-container video').addClass(
						'fadeIn animated');
				});
		}
	</script>
	<!-- ======= COMU BACKGRUOUND VIDEO SCRIPT END =========== -->

	<!--  HICU Action  -->
	<script type="text/javascript">
		$(function() {
	
			$("#play").on("click", function() {
				$.ajax({
					url : "compile",
					data : {
						"source" : "beat 1{do 3; location 1;}"
					},
					success : function(resp) {
						alert(resp);
					},
					error : function(resp) {
						alert(resp);
					}
				});
			});
	
	
			$.ajax({
				url : "getList",
				type : "POST",
				data : {},
				success : function(resp) {
					console.log(JSON.stringify(resp));
				},
				error : function(resp) {
					console.log(JSON.stringify(resp));
				}
			});
		});
	</script>

</body>

<!-- COMU PAGE MAIN SPACE CSS  -->
<style>
.containerB {
	border-radius: 10px;
	border: 1px solid rgb(230, 230, 230);
	width: 730px;
	background-color: rgb(255, 255, 255);
	margin: 0px auto;
	padding: 20px 20px 15px 20px;
	-webkit-box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.2);
	display: block;
}

.containerBIN {
	width: 750px;
	display: block;
}

.main-raised {
	margin: 30px 30px 30px;
}

.hiBtn {
	/* 	padding: 0;
	margin: 0;
	border: 0; */
	width: 38px;
	height: 38px;
}

.hiBtn:hover {
	background-color: threedlightshadow;
}

#resultCode {
	width: 685px;
	height: 120px;
	border: 3px solid #cccccc;
	padding: 5px;
	font-family: Tahoma, sans-serif;
	background-position: bottom right;
	background-repeat: no-repeat;
}

.label {
	color: black;
	display: inline-block;
	width: 60px;
	/* vertical-align: top;
	position: relative; */
	top: 12px;
	text-align: left;
	margin-right: 15px;
	display: inline-block;
	background-color: gray;
}

.label.blank {
	color: white;
	background-color: white;
}

#tempo_container {
	height: 40px;
	margin-bottom: 10px;
}

#tempodisplay {
	background-image: url('myfiles/images/hicu/tempo_bg.png');
	width: 97px;
	height: 37px;
	display: inline-block;
	vertical-align: top;
	padding: 10px 20px;
	text-align: right;
	color: rgb(76, 76, 76);
}

#tempo {
	font-weight: bold;
	font-size: 18px;
}

#bpm {
	font-size: 14px;
}

#tempoinc, #tempodec {
	position: relative;
	top: 3px;
	left: 1px;
}

.wrapper {
	background-color: black;
}

select {
	/* vertical-align: top;
	position: relative;
	top: 12px; */
	font-size: x-small;
}

.selectLine {
	margin: auto;
	padding: 5px;
}

.buttons_row {
	margin: auto;
	padding: 5px;
}

.ins_add {
	width: 20px;
}
</style>
</html>
