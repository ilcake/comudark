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

<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate.min.js"></script>
<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
.qt-particles {
	background-image: url("images/galaxy-2.jpg");
}

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

/*                          GET STARTED BUTTON                             */
.get-started {
	position: absolute;
	z-index: 3;
	top: 45%;
	left: 45%;
}

/*                 COMU PAGE AFTER 'GET STARTED'                   */
.video-container .title-container {
	z-index: 2;
	position: absolute;
	top: 9%;
	width: 100%;
	background-color: rgb(255, 255, 255);
	height: 100%;
	overflow: scroll;
}

.text {
	color: black;
}

.text-thin {
	font-weight: 100
}

.carousel-control {
	width: 5%;
}

h4 {
	display: inline;
}

#addBtn {
	position: relative;
	left: 60%;
	top: 0%;
}

#sampleRun {
	position: relative;
	left: 180%;
	top: 0%;
}

#mainRun {
	position: relative;
	left: 130%;
	top: 0%;
}

textarea {
	resize: none;
}
</style>

<!-- ================   COMU MAIN SCRIPT   ==================== -->
<script>
	// 시작 버튼이 눌러졌을 때 혹은 MY MUSIC에서 로드 될 때
	function getStarted() {
		$(".title-container").show("slow");
		$(this).attr("hidden", "");
		$(".btn-default").css("background-color", "rgb(39,169,157)");
		$("#addBtn").css("background-color", "#f0ad4e");
	}

	function addBtn() {
		var sample = $('#sample').val();
		var position = $("#main").getCursorPosition();
		$("#main").setCursorPosition(position);
		$("#main").insertAtCursor(sample);
		$('#sample').val('');
	}

	function setJqueryFn() {
		$.fn.setCursorPosition = function(position) {
			if (this.length == 0)
				return this;
			return $(this).setSelection(position, position);
		}
		$.fn.setSelection = function(selectionStart, selectionEnd) {
			if (this.length == 0)
				return this;
			input = this[0];
			if (input.createTextRange) {
				var range = input.createTextRange();
				range.collapse(true);
				range.moveEnd('character', selectionEnd);
				range.moveStart('character', selectionStart);
				range.select();
			} else if (input.setSelectionRange) {
				input.focus();
				input.setSelectionRange(selectionStart, selectionEnd);
			}
			return this;
		}
		$.fn.focusEnd = function() {
			this.setCursorPosition(this.val().length);
			return this;
		}
		$.fn.getCursorPosition = function() {
			var el = $(this).get(0);
			var pos = 0;
			if ('selectionStart' in el) {
				pos = el.selectionStart;
			} else if ('selection' in document) {
				el.focus();
				var Sel = document.selection.createRange();
				var SelLength = document.selection.createRange().text.length;
				Sel.moveStart('character', -el.value.length);
				pos = Sel.text.length - SelLength;
			}
			return pos;
		}
		$.fn.insertAtCursor = function(myValue) {
			return this.each(function(i) {
				if (document.selection) {
					//For browsers like Internet Explorer
					this.focus();
					sel = document.selection.createRange();
					sel.text = myValue;
					this.focus();
				} else if (this.selectionStart || this.selectionStart == '0') {
					//For browsers like Firefox and Webkit based
					var startPos = this.selectionStart;
					var endPos = this.selectionEnd;
					var scrollTop = this.scrollTop;
					this.value = this.value.substring(0, startPos) + myValue
							+ this.value.substring(endPos, this.value.length);
					this.focus();
					this.selectionStart = startPos + myValue.length;
					this.selectionEnd = startPos + myValue.length;
					this.scrollTop = scrollTop;
				} else {
					this.value += myValue;
					this.focus();
				}
			})
		}
	}

	$(function() {
		setJqueryFn();
		$("#myCarousel").css("height", "100%").css("padding-top", "2%");
		$(".get-started").click(getStarted);
		$("#addBtn").click(addBtn);
	})
</script>
</head>
<body>
	<!-- ====================== HEADER ============================== -->
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
	<!-- ====================== HEADER END ========================== -->


	<!-- ====================== MENU ============================== -->
	<div id="menu" class="qt-menu-wrapper" data-0-top>
		<!-- <div class="qt-particles" id="particlesheader" data-color="#ffffff"
			data-opacity="0.5" data-speed="1"></div> -->
		<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
			<!-- desktop menu -->
			<ul class="qt-desktopmenu">
				<li><a href="home" class="qwsmoothscroll">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll active">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll">HiCu</a></li>
				<li><a href="#mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="#shared" class="qwsmoothscroll">Shared</a></li>
				<li><a href="#howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="#aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<!-- mobile menu -->
			<ul id="slide-out" class="side-nav qt-mobilemenu">
				<li><a href="home" class="qwsmoothscroll">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll active">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll">HiCu</a></li>
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
	<!-- ====================== MENU END ====================== -->
	<div class="homepage-hero-module">
		<div class="video-container">
			<div class="get-started">
				<button type="button" class="btn btn-success btn-lg">GET
					STARTED</button>
			</div>
			<div class="title-container" hidden="">
				<!--Original logo height 80px-->
				<!-- 로고 위치 
               			<img src="/assets/Coverr-40bfea29db9c1dff5dbea5f6238cc98a.svg"
                  		height="80" alt=""> -->

				<!-- ============== COMU CONTENT  ================= -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel"
					data-interval="0" data-wrap="false">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div id="carousel-inner" class="carousel-inner" role="listbox">

						<!--   CODING PLACE START  -->
						<div class="item active">
							<div>
								<div class="row">

									<!--   12칸의 세로 영역을 분할하기 위해 col-md-x를 작성   -->
									<div class="col-md-3 leftplace"></div>
									<div class="col-md-6 centerPlace">
										<div class="form-group label-floating">
											<label for="comment"><h4>SAMPLE:</h4>
												<button type="button" class="btn btn-default btn-md"
													id="sampleRun">
													RUN <span class="glyphicon glyphicon-play"></span>
												</button> </label>
											<textarea class="form-control" rows="5" name="sample"
												id="sample"></textarea>
										</div>
										<div class="form-group label-floating">
											<label class="control-label"><h4>MAIN:</h4>
												<button type="button" class="btn btn-default btn-md"
													id="addBtn">
													ADD <span class="glyphicon glyphicon-arrow-down"></span>
												</button>
												<button type="button" class="btn btn-default btn-md"
													id="mainRun">
													RUN <span class="glyphicon glyphicon-play"></span>
												</button> </label>
											<textarea class="form-control" rows="15" name="file_ori"
												id="main">${file.file_ori}</textarea>
										</div>
									</div>
									<div class="col-md-3 leftplace"></div>
								</div>
							</div>
						</div>
						<!--   CODING PLACE END   -->

						<!--   ddd   -->
						<div class="item">
							<div>asd</div>
						</div>

						<!--   ddd   -->
						<div class="item">
							<div>asd</div>
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
						$('.homepage-hero-module .video-container video')
								.addClass('fadeIn animated');
					});
		}
	</script>
	<!-- ======= COMU BACKGRUOUND VIDEO SCRIPT END =========== -->
</body>
<!-- COMU PAGE MAIN SPACE CSS  -->
</html>
