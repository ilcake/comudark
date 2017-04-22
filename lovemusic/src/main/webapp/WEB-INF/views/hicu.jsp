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
	position: fixed;
	top: 15%;
	margin-left: 10%;
	width: 80%;
	background-color: rgba(255, 255, 255, 0.8);
	width: 80%;
	width: 80%;
}

.text {
	color: black;
}

.text-thin {
	font-weight: 100
}
</style>
<script type="text/javascript">
	var theMap;
</script>
</head>
<body>
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

									<!-- outer container -->
									<div class="containerB">

										<!--  whole pad  -->
										<div class="containerBIN" id="pad">
											<div class="selectLine" id="beatLine">
												<table class="theSelectionTable">
													<tr>
														<th><span class="label">Beats</span><select
															id="beatSelection"><option value="loops">MadeSet</option>
																<option value="acu">Acustic</option>
																<option value="r8">R8</option></select> <img
															src="myfiles/images/hicu/ins_add.png" class="ins_add"
															dt-ins="beats"></th>
														<th><span class="label">Bass</span> <img
															src="myfiles/images/hicu/ins_add.png" class="ins_add"
															dt-ins="bass"></th>
														<th><span class="label">Melody</span> <img
															src="myfiles/images/hicu/ins_add.png" class="ins_add"
															dt-ins="melody"></th>

													</tr>
												</table>
											</div>

											<!-- Buttons Row -->
											<div class="btnsArea" id="btnsArea"></div>

											<!--------   LED Row   --------->
											<div class="buttons_row" id="LED_row">
												<span class="label blank">GO</span>
											</div>
										</div>
										<hr />
										<div class="containerBIN" id="tools">
											<img id="play" src="myfiles/images/hicu/btn_play.png"
												width="80" height="33"><img id="stop"
												src="myfiles/images/hicu/btn_stop.png" width="80"
												height="33"> <img id="save"
												src="myfiles/images/hicu/btn_save.png"><img id="load"
												src="myfiles/images/hicu/btn_load.png"><img id="reset"
												src="myfiles/images/hicu/btn_reset.png">
											<!-- <div>
												<textarea id="resultCode"></textarea>
											</div> -->
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

	<!-- ======= BACKGRUOUND VIDEO SCRIPT ================ -->
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
			$(element).each(
				function() {
					var videoAspectRatio = $(this).data('height')
	
					$(this).width(windowWidth);
					if (windowWidth < 1000) {
						videoHeight = windowHeight;
						videoWidth = videoHeight / videoAspectRatio;
						$(this).css(
							{
								'margin-top' : 0,
								'margin-left' : -(videoWidth - windowWidth)
									/ 2 + 'px'
							});
						$(this).width(videoWidth).height(videoHeight);
					}
					$('.homepage-hero-module .video-container video').addClass(
						'fadeIn animated');
				});
		}
	</script>
	<!-- ======= HICU BACKGRUOUND VIDEO SCRIPT END =========== -->

	<!--  HICU Action  -->
	<script type="text/javascript">
	
		var drumSet = [ "hihat", "kick", "snare", "tom1", "tom2", "tom3" ];
	
		/*******************************************
		*
		* 		     Initiation Function
		* 
		********************************************/
		function initHiCu() {
			makeLED();
	
			console.log("=============Get Ins List==============");
			/*******************************************
			*
			* 				get Ins List
			* 
			********************************************/
			$.ajax({
				url : "getList",
				type : "POST",
				data : {},
				success : function(resp) {
					theMap = resp;
					$.each(theMap, function(index, item) {
						if (item.length != 0) {
							console.log("index_" + index);
							$.each(item, function(ind, it) {
								console.log(" ㄴ  " + it.filePath);
							});
						}
					});
				},
				error : function(resp) {}
			});
			console.log("==================================");
	
		}
	
	
		/********************************************** 
		*
		*                 on Click Play !
		*
		***********************************************/
		function playEvent() {
			var theSource = $("#resultCode").val();
			console.log("play ==> " + theSource);
			$.ajax({
				type : "POST",
				url : "compile",
				data : {
					"source" : theSource
				},
				success : function(resp) {
					alert(resp);
					$("#play").addClass("playing");
					$("#stop").addClass("playing");
				},
				error : function(resp) {
					alert(resp);
				}
			});
		}
	
		function stopEvent() {
			console.log("STOP!!");
			$("#stop").removeClass("playing");
			$("#play").removeClass("playing");
	
		}
	
	
		/********************************************** 
		*
		*              on click Add Btn
		*
		***********************************************/
		function insAddEvent() {
			var ins = $(this).attr("dt-ins");
			console.log(ins + " is requested");
			var serial = 1 + Math.floor(Math.random() * 50000);
	
			var theContents = "";
			theContents += "<div id='area_" + serial + "' class='addedLines'>";
			switch (ins) {
			case "beats":
				var btSelected = $("#beatSelection").val();
				switch (btSelected) {
				case "loops":
					theContents += "<div class='buttons_row'>";
					theContents += "<span class='label'>" + btSelected + " <img src='myfiles/images/hicu/ins_remove.png' class='ins_remove' dt-line='" + serial + "'></span> ";
					for (var i = 1; i < 17; i++) {
						theContents += "<img dt-ins='beat' dt-loc='1' dt-nt='" + i + "' id='beat_" + i + "' class='hiBtn' src='myfiles/images/hicu/button_off.png'>";
					}
					theContents += "</div>";
					break;
	
				case "acu":
				case "r8":
					theContents += "<div class='selectLine'><table class='theSelectionTable'><tr>";
					theContents += "<th><span class='label'>" + btSelected + "</span> <img src='myfiles/images/hicu/ins_remove.png' class='ins_remove' dt-line='" + serial + "'></th>";
					theContents += "<th><div class='tempodisplay'><span id='tempo'>120</span>&nbsp;<span id='bpm'>bpm</span></div>";
					theContents += "<span class='tempocontrol'><img class='tempC' src='myfiles/images/hicu/tempo_dec.png' id='tempodec'>";
					theContents += "<img class='tempC' src='myfiles/images/hicu/tempo_inc.png' id='tempoinc'></span>";
					theContents += "</th></tr></table></div>";
					$.each(drumSet, function(index, item) {
						theContents += "<div class='buttons_row'>";
						theContents += "<span class='label'>" + item + "</span> ";
						for (var i = 1; i < 17; i++) {
							theContents += "<img dt-ins='" + ins + "' dt-nt='" + item + "' dt-loc='" + i + "' id='" + item + "_" + i + "' class='hiBtn' src='myfiles/images/hicu/button_off.png'>";
						}
						theContents += "</div>";
					//plusSize += 41.33;
					});
					break;
				}
				break;
	
			case "bass":
				break;
	
			case "melody":
				break;
			}
			theContents += "</div>";
			$("#btnsArea").append(theContents);
			$(".ins_remove").on("click", insRemoveEvent);
			console.log("wow!! " + serial + " added");
		}
	
		/********************************************** 
		*
		*               INS Remove Event!
		*
		***********************************************/
		function insRemoveEvent() {
			var thisbtn = "area_" + ($(this).attr("dt-line"));
			$("#" + thisbtn).remove();
			console.log("wow!! " + thisbtn + " removed!");
		}
	
		/********************************************** 
		*
		*                make LED Line!
		*
		***********************************************/
		function makeLED() {
			var theLeds = "";
			for (var i = 1; i < 17; i++) {
				theLeds += "<img class='leds'	id='LED_1' src='myfiles/images/hicu/LED_off.png'>";
			}
			$("#LED_row").append(theLeds);
		}

		/********************************************** 
		*
		*                set Height automatic!
		*
		***********************************************/
		function setMaxHeightRow() {
			var winHeight = $(window).height();
			console.log(winHeight);
			$(".row").css("max-height", (winHeight - 100));
		}
	
		/********************************************** 
		*
		*                 on Ready!
		*
		***********************************************/
		$(function() {
			initHiCu();
			setMaxHeightRow();
			$("#play").on("click", playEvent);
			$("#stop").on("click", stopEvent);
			$(".ins_add").on("click", insAddEvent);
		});
	</script>
</body>

<!-- COMU PAGE MAIN SPACE CSS  -->
<style>
.containerB {
	border-radius: 10px;
	border: 1px solid rgb(230, 230, 230);
	width: 93%;
	background-color: rgb(255, 255, 255);
	margin: 0px auto;
	padding: 20px 20px 15px 20px;
	-webkit-box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.2);
	display: block;
}

.containerBIN {
	width: 95%;
	display: block;
	text-align: center;
	padding: 2px;
	margin: auto;
}

#beatLine {
	margin: 0px auto;
	padding: 1px;
}

.theSelectionTable {
	width: 70%;
	margin: 0px auto;
	padding: 1px;
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
	width: 95%;
	height: 120px;
	border: 3px solid #cccccc;
	padding: 5px;
	font-family: Tahoma, sans-serif;
	background-position: bottom right;
	background-repeat: no-repeat;
	font-size: x-small;
	resize: none;
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
	color: transparent;
	background-color: transparent;
}

#tempo_container {
	height: 40px;
	margin-bottom: 10px;
}

.tempodisplay {
	background-image: url('myfiles/images/hicu/tempo_bg.png');
	width: 97px;
	height: 37px;
	display: inline-block;
	vertical-align: top;
	padding: 10px 20px;
	text-align: right;
	color: rgb(76, 76, 76);
}

.tempC {
	height: 28px;
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

.ins_remove {
	width: 20px;
}

.row {
	max-height: 480px;
	overflow: auto;
}

.addedLines {
	
}

#play, #stop {
	margin-right: 12px;
}

#stop {
	display: none;
}

#play.playing {
	display: none;
}

#stop.playing {
	display: inline;
}
</style>
</html>
