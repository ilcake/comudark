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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>


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
	position: fixed;
	z-index: 0;
	bottom: 0;
}

.video-container video.fillWidth {
	width: 100%;
}

.video-container .title-container {
	z-index: 2;
	position: absolute;
	top: 20%;
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

a, a:link, a:hover, a:visited, a:active {
	text-decoration: none;
	color: black;
}

.tr_header {
	margin-top: -5%;
	margin-bottom: -5%;
}

.td_img {
	width: 20%;
}

.td_center {
	width: 60%;
}

img {
	border-radius: 100px;
	width: 65px;
	height: 65px;
}

.td_button {
	width: 20%;
	text-align: right;
}

.glyphicon {
	font-size: 20px;
}

.panel-group, .panel panel-default {
	margin: auto;
	background: rgba(0, 0, 0, 0.4);
	color: black;
	text-align: left;
}

.panel-heading {
	background-color: blue;
}

/*게시판 블록*/
.box {
	width: 30%;
	margin: 20px;
	padding: 10px;
	border-radius: 20px;
	float: left;
	display: inline;
	color: black;
	background-color: white;
}

table {
	font-size: medium;
}

.reply>td {
	/*border: solid white 2px;*/
	background-color: #f0f5f5;
	font-size: small;
	padding: 5px;
}

.writerButton {
	position: relative;
	float: left;
	font-size: small;
	margin-bottom: -20%;
}

.replybutton {
	position: relative;
	float: right;
	font-size: small;
	margin-bottom: -20%;
}
</style>


<script>
	$(function() {

		$('#inline').wallyti(function() {
			console.info("FATTO!");
		});

		//좋아요, 구독 버튼 클릭 시 색 변환
		$(".glyphicon").on("click", function() {
			if ($(this).css("color") == "rgb(255, 0, 0)") {
				$(this).css("color", "black");
			} else {
				$(this).css("color", "red");
			}
		});

		$(".glyphicon-heart-empty").on(
				"click",
				function() {
					$(this).removeClass("glyphicon-heart-empty").addClass(
							"glyphicon-thumbs-up");
				});

		$(".glyphicon-heart-empty").hover(
				function() {
					$(this).removeClass("glyphicon-heart-empty").addClass(
							"glyphicon-heart");
				},
				function() {
					$(this).removeClass("glyphicon-heart").addClass(
							"glyphicon-heart-empty");
				});

		/*
		$(".glyphicon").hover(
				function(){
					$(this).animate({ scale: "+=0.2%" }, 300 );
				},
				function(){
					$(this).removeClass("glyphicon-star").addClass("glyphicon-star-empty");
				}
			);
		 */

		$(".cover").hover(function() {
			$(this).css("opacity", "0.5");
		}, function() {
			$(this).css("opacity", "1");
		});

		jQuery.fn.center = function() {
			this.css("position", "absolute");
			this.css("top", Math.max(0, (($(window).height() - $(this)
					.outerHeight()) / 2)
					+ $(window).scrollTop())
					+ "px");
			this.css("left", Math.max(0, (($(window).width() - $(this)
					.outerWidth()) / 2)
					+ $(window).scrollLeft())
					+ "px");
			return this;
		}

		$(".cover")
				.on(
						"click",
						function() {
							window
									.open("player", "player",
											"height=200, width=400, resizable=no, top=200, left=400");
						});

	});
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
				<li><a href="#hicu" class="qwsmoothscroll">HiCu</a></li>
				<li><a href="#mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="#shared" class="qwsmoothscroll active">Shared</a></li>
				<li><a href="#howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="#aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<!-- mobile menu -->
			<ul id="slide-out" class="side-nav qt-mobilemenu">
				<li><a href="home" class="qwsmoothscroll">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll active">CoMu</a></li>
				<li><a href="#hicu" class="qwsmoothscroll">HiCu</a></li>
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

	<div class="homepage-hero-module">
		<div class="video-container">
			<div class="title-container">

				<!--Original logo height 80px-->
				<!-- 로고 위치 
               <img src="/assets/Coverr-40bfea29db9c1dff5dbea5f6238cc98a.svg"
                  height="80" alt=""> -->

				<!-- 
					<h3 class="text-white text-thin">beautiful, free videos for
						your homepage</h3>
					<h4 class="text-white text-thin">7 new videos every monday</h4> -->

				<div class="wrapper">
					<div id="container">
						<!-- 게시물 시작 (Collapse) -->
						<c:forEach var="board" items="${boardList}">
							<div class="box">
								<table class='board'>
									<tr>
										<td class="td_img"><img src="images/galaxy-1.jpg"
											alt="image" class="cover"></td>
										<td class="td_center" style="line-height: 1.3em;"><span>${board.userid}</span>
											&nbsp;l&nbsp;<span style="font-weight: bold; color: red;">${board.title}</span>
											<br> <span
											style="font-size: small; text-align: right; margin-top: -20px; margin-bottom: -20px;">${board.inputdate}</span>
										</td>
										<!-- 좋아요/구독 버튼 -->
										<td class="td_button">${board.like_userid}<a href="#"
											data-toggle="tooltip" title="좋아요"><span
												class="glyphicon glyphicon-thumbs-up" aria-hidden="true"
												style="color: black;"></span></a> <a href="#"
											data-toggle="tooltip" title="구독하기"><span
												class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span></a>
										</td>
									</tr>
									<tr>
										<td colspan='3'><hr class="tr_header"></td>
									</tr>
									<tr>
										<td colspan="3">${board.content}<br> <!-- 자기가 올린 글 수정, 삭제 버튼 활성화-->
											<c:if test="${board.userid == loginId}">
												<span class="writerButton"> <span
													class="glyphicon glyphicon-pencil" aria-hidden="true"
													style="font-size: small;"></span> <!-- 글 수정 버튼 --> <a
													href="${board.boardnum}">X</a> <!-- 글 삭제 버튼 -->
												</span>
											</c:if> <span class="replybutton"> <a role="button"
												data-toggle="collapse" href="#col${board.boardnum}"
												aria-expanded="false" aria-controls="col${board.boardnum}">
													reply ▼ </a>
										</span>
										</td>
									</tr>
									<tr>
										<td colspan="3"><hr></td>
									</tr>
								</table>
								<table class="collapse" id="col${board.boardnum}">
									<!-- 댓글 -->
									<c:forEach var="reply" items="${replyAll}">
										<c:if test="${reply.boardnum == board.boardnum}">
											<tr class="reply">
												<td class="td_img">${reply.userid}</td>
												<td>${reply.replytext}<span style="color: gray;">${reply.inputdate}</span></td>
												<td><a href="updatereply?replynum=${reply.replynum}"><span
														class="glyphicon glyphicon-pencil" aria-hidden="true"
														style="font-size: small;"></span></a> <a
													href="deletereply?replynum=${reply.replynum}">X</a></td>
											</tr>
										</c:if>
									</c:forEach>
									<tr>
										<form action="replyWrite" method="get">
											<input type="hidden" name="boardnum"
												value="${board.boardnum}" />
											<td class="td_img">댓글</td>
											<td class="td_center" style="width: 70%;"><input
												type="text" name="replytext" id="replytext"></td>
											<td><button style="border: none; background: none;">
													<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
												</button></td>
										</form>
									</tr>
								</table>
							</div>
						</c:forEach>
						<!-- 게시물 END -->
					</div>
				</div>

			</div>
			<!-- title-container 끝 -->

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

	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
		rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-3.2.0.slim.min.js"></script>
	<script src="js/jquery.wallyti.js"></script>


	<!-- comu Video back Script -->
	<script type="text/javascript">
		$(document).ready(function() {
			$(".panel-heading").css('background-color', 'white');
			$(".panel-heading").css('color', 'blue');

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
			var windowWidth = $(window).width(), windowHeight = $(window)
					.height() + 5, videoWidth, videoHeight;
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

</body>

</html>
