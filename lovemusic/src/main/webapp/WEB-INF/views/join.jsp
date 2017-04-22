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
<link rel="shortcut icon" type="image/png"
	href="myfiles/images/logo_comu.png" />

<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate.min.js"></script>
<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->

<!-- comu Vidio back css -->
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
	overflow: scroll;
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
	top: 10%;
	width: 100%;
	text-align: center;
	color: #fff
}

.text-white {
	color: #fff !important
}

.text-thin {
	font-weight: 100
}

/*로그인 페이지 css*/
#loginBox{
	width:600px; 
	margin: auto; 
	border: 3px solid white; 
	border-radius: 0px; 
	padding: 70px;
	padding-top: 30px;
}

#menu{
	background: none;
	text-aline: right;
	font-size: large;
	color:white; 
}

#find{
	font-size: small;
	text-align: right;
}

#x{
	right:0px; 
	position: absolute; 
	padding-top: 10px;
	padding-right: 40px; 
	font-size: xx-large;
}

img{	
	width: 30px;
	height: 30px;
}

input, input:hover{
	background: none;
	border: none;
	border-bottom: white 1px solid;
}
	
}
</style>

<script>
$(function(){
	
	//중복체크 기능 미구현
	$("중복체크").on('click', function(){
		$.ajax({
			url : "check"
			, type : "post"
			, data : {"userid" : $('#userid').val()}
			, success : function(resp) {
				if(resp == "errorMsg") {
					alert("이미 있는 ID입니다");
				} else {
					alert("ID 사용 가능");
				}
			}
		});		
	});
	
	//미완료
	$("#joinbutton").on('click', function(){
		$.ajax({
			url : "join"
			, type : "post"
			, data : {"userid" : $('#userid').val(), "password" : $('#password').val()}
			, success : function(resp) {
				if(resp == "error") {
					alert("가입 실패");
					$("input").val("");	//전체 초기화
					
				} else {
					alert("가입 완료");
					location.href=".";
				}
			}
		});
	});
});
</script>

</head>

<body>

	<!-- ====================== MENU ================================================ -->
	<div id="menu" class="qt-menu-wrapper" data-0-top>
		<!-- <div class="qt-particles" id="particlesheader" data-color="#ffffff"
			data-opacity="0.5" data-speed="1"></div> -->
		<nav id="stickymenu" class="qt-menu white-text">
			<a href="."><span id="x"><img src="myfiles/images/cross-out.png"></span></a>
		</nav>
	</div>
	<!-- ====================== MENU END ================================================ -->

	<div id="presskit"
		class="section section-presskit parallax-container scrollspy">
		<div class="parallax">
			<!-- <img src="images/galaxy-2.jpg" alt="background"> -->

			<div class="homepage-hero-module">
				<div class="video-container">
					<div class="title-container">
						<div class="headline">
							<!-- 회원가입 -->
							<div id="loginBox">
								<h3>JOIN</h3>
								<form class="form" method="post" action="join">
									<div class="content">
										<div class="input-group">
											<input type="text" class="form-control" placeholder="ID"
												name="userid" id="userid">
										</div>

										<div class="input-group">
											<input type="text" class="form-control" placeholder="E-MAIL"
												name="email" id="email">
										</div>

										<div class="input-group">
											<input type="password" placeholder="Password.."
												class="form-control" name="password" id="password"/>
										</div>
										<div class="input-group">
											<input type="password" placeholder="Password...."
												class="form-control" />
										</div>
<!-- 										<div class="input-group">
											<input type="text" placeholder="Question"
												class="form-control" name="question" />
										</div>
										<div class="input-group">
											<input type="text" placeholder="Answer" class="form-control"
												name="answer" />
										</div> -->
									</div>
								</form>
								<br>
								<div class="footer text-center">
									<button class="btn btn-primary" id="joinbutton">JOIN</button>
								</div>
							</div>
							<br><br><br>

							<!--Original logo height 80px-->
							<!-- 로고 위치 
               <img src="/assets/Coverr-40bfea29db9c1dff5dbea5f6238cc98a.svg"
                  height="80" alt=""> -->

							<!-- 
					<h3 class="text-white text-thin">beautiful, free videos for
						your homepage</h3>
					<h4 class="text-white text-thin">7 new videos every monday</h4> -->


						</div>
					</div>

					<div class="filter"></div>
					<video autoplay loop class="fillWidth">
						<source src="myfiles/video/Blurry-Lights.mp4" type="video/mp4" />
					</video>


					<!--    영상 로딩 전 보여줄 화면
         <div class="poster hidden">
            <img src="PATH_TO_JPEG" alt="">
         </div> -->



				</div>
			</div>
		</div>
	</div>

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

	<!-- comu Video back Script -->
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
			var windowWidth = $(window).width(),
				windowHeight = $(window).height() + 5,
				videoWidth,
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
</body>

</html>
