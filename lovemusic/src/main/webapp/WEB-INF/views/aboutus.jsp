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
	href="myfiles/images/main/logo_comu.png" />

<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
<script src="resources/jquery-3.1.1.min.js"></script>
<!-- <script src="js/jquery.js"></script>
<script src="js/jquery-migrate.min.js"></script> -->
<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->

<!-- 기존 적용 기능 끝 -->

<!-- About Us START -->
<meta name="keywords"
	content="video production san diego,san diego video production,video production in san diego,san diego video productions,san diego production companies">
<meta name="description"
	content="We have combined all of our creative backgrounds to produce an experience tailored to your specific needs.">
<link href="https://plus.google.com/101694146701986480596/about"
	rel="publisher">

<link rel="stylesheet" href="resources/forest/css/aboutus.css"
	type="text/css" media="screen" />
<link rel="alternate" type="application/rss+xml"
	title="FortyOneTwenty Inc. RSS Feed"
	href="http://www.fortyonetwenty.com/feed/" />
<link rel="alternate" type="application/atom+xml"
	title="FortyOneTwenty Inc. Atom Feed"
	href="http://www.fortyonetwenty.com/feed/atom/" />
<link rel="pingback" href="http://www.fortyonetwenty.com/xmlrpc.php" />

<script type="text/javascript"
	src="http://www.fortyonetwenty.com/wp-content/themes/4120/4120.js"></script>

<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-1729453-1' ]);
	_gaq.push([ '_trackPageview' ]);
	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>

<link rel="alternate" type="application/rss+xml"
	title="FortyOneTwenty Inc. &raquo; About Us Comments Feed"
	href="http://www.fortyonetwenty.com/about-us/feed/" />

<link rel='stylesheet' id='dot-irecommendthis-css'
	href='http://www.fortyonetwenty.com/wp-content/plugins/i-recommend-this/css/dot-irecommendthis-heart.css?ver=3.5'
	type='text/css' media='all' />

<script type='text/javascript'
	src='http://www.fortyonetwenty.com/wp-includes/js/jquery/jquery.js?ver=1.8.3'></script>

<script type='text/javascript'>
	var dot = {
		"ajaxurl" : "http:\/\/www.fortyonetwenty.com\/wp-admin\/admin-ajax.php"
	};
	var dot_irecommendthis = {
		"ajaxurl" : "http:\/\/www.fortyonetwenty.com\/wp-admin\/admin-ajax.php"
	};
</script>

<script type='text/javascript'
	src='http://www.fortyonetwenty.com/wp-content/plugins/i-recommend-this/js/dot_irecommendthis.js?ver=3.5'></script>

<!-- Start Fluid Video Embeds Style Tag -->
<style type="text/css">
.fve-video-wrapper {
	position: relative;
	overflow: hidden;
	height: 0;
	padding-bottom: 56.25%;
	margin: 0.5em 0;
}

.fve-video-wrapper iframe, .fve-video-wrapper object, .fve-video-wrapper embed
	{
	position: absolute;
	display: block;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
<!-- End Fluid Video Embeds Style Tag -->

<script charset="utf-8" type="text/javascript">
	var switchTo5x = true;
</script>
<script charset="utf-8" type="text/javascript"
	src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">
	stLight.options({
		publisher : 'wp.631a12d8-6bb4-4eff-a368-18fc70a9eb8d'
	});
	var st_type = 'wordpress3.4.2';
</script>

<style type="text/css">
.recentcomments a {
	display: inline !important;
	padding: 0 !important;
	margin: 0 !important;
}
</style>

<style>
#logo h1 a {
	background: transparent
		url(http://www.fortyonetwenty.com/wp-content/uploads/2012/10/4120_logo.png)
		no-repeat center center;
	width: 112px;
	height: 112px;
}
/* Retina ----------- */
@media only screen and (-webkit-min-device-pixel-ratio: 1.5) , only screen and
		( min--moz-device-pixel-ratio: 1.5) , only screen and (
		-o-min-device-pixel-ratio: 1.5/1) , only screen and (
		min-device-pixel-ratio: 1.5) , only screen and ( min-resolution:
		192dpi) , only screen and ( min-resolution: 2dppx) {
	/* Retina-specific stuff here */
	#logo h1 a {
		background: transparent
			url(http://www.fortyonetwenty.com/wp-content/uploads/2012/10/4120_logo@2x.png)
			no-repeat center center;
		background-size: 112px 112px;
	}
}

#mainNav ul a {
	line-height: 112px;
}

#mainNav li.nav-logo a {
	width: 112px;
	height: 112px;
}
</style>

<!-- About Us END -->

</head>

<body class="page page-id-7 page-template page-template-page-about-php">
	<!-- 기존 적용 기능 시작 -->
	<!-- ====================== MENU ================================================ -->
	<jsp:include page="navibar.jsp" flush="false" />
	<script type="text/javascript">
		$(".qwsmoothscroll").eq(6).addClass("active");
	</script>
	<!-- ====================== MENU END ================================================ -->

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

			scaleVideocontainers();
			initBannerVideoSize('.video-containers .poster img');
			initBannerVideoSize('.video-containers .filter');
			initBannerVideoSize('.video-containers video');

			$(window).on('resize', function() {
				scaleVideocontainers();
				scaleBannerVideoSize('.video-containers .poster img');
				scaleBannerVideoSize('.video-containers .filter');
				scaleBannerVideoSize('.video-containers video');
			});

		});

		function scaleVideocontainers() {
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
			var videoWidth, videoHeight;
			$(element).each(
					function() {
						var videoAspectRatio = $(this).data('height')

						$(this).width(windowWidth);
						$('.homepage-hero-module .video-containers video')
								.addClass('fadeIn animated');
					});
		}
	</script>
	<!-- 기존 적용 기능 끝 -->

	<!-- ============== AboutUs CONTENT START ================= -->
	<div class="full-width flush-top quotes"
		style="background-image: url('resources/forest/images/galaxy-3.jpg');">
		<div class="containers">
			<div class="swipers">
				<ul>
					<li>
						<blockquote>
							<br />
							<p class="fittext" data-max-font-size="60px">CoMu Project</p>
							<cite class="fittext" data-max-font-size="24px"
								data-min-font-size="12px"> - 2조 </cite>
						</blockquote>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- <div class="filter"></div> -->

	<div class="full-width flush-top">
		<div class="containers">
			<div class="emblem-row">
				<div class="emblem-col">
					<div class="icon">
						<img
							src="http://www.fortyonetwenty.com/wp-content/uploads/2012/10/video-camera.png"
							alt="Craft">
					</div>
					<h2>최유철</h2>
					<p>조장</p>
				</div>
				<div class="emblem-col">
					<div class="icon">
						<img
							src="http://www.fortyonetwenty.com/wp-content/uploads/2012/10/video-camera.png"
							alt="Craft">
					</div>
					<h2>김태현</h2>
					<p>조원</p>
				</div>
				<div class="emblem-col">
					<div class="icon">
						<img
							src="http://www.fortyonetwenty.com/wp-content/uploads/2012/10/paint-brush.png"
							alt="Creativity">
					</div>
					<h2>김고운</h2>
					<p>조원</p>
				</div>
				<div class="emblem-col">
					<div class="icon">
						<img
							src="http://www.fortyonetwenty.com/wp-content/uploads/2012/10/mustache.png"
							alt="Character">
					</div>
					<h2>이민호</h2>
					<p>조원</p>
				</div>
				<hr>
			</div>
		</div>
	</div>

	<div class="full-width red">
		<div class="containers">
			<div class="testimonials">
				<ul class="swipe-wrap">
					<li class="testimonial">
						<!-- <div class="avatar">
							<img src="resources/forest/images/java_120.png" alt="error">
						</div> -->
						<blockquote>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer vel fermentum nisl. Donec viverra metus quam, quis
								blandit leo vehicula non. Donec luctus pharetra tempor. Etiam et
								ex et libero volutpat egestas. Cras pharetra, mi sit amet
								interdum egestas, ligula metus auctor ipsum,</p>
							<footer>
								<cite> CoMu <span class="project">최유철, 김태현, 김고운,
										이민호</span>
								</cite>
							</footer>
						</blockquote>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="full-width">
		<div class="containers">
			<div class="clients">
				<h2>프로젝트 사용 기술</h2>
				<ul>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/java_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/oracle_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/html_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/css_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/js_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/jsp_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/jquery_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/ajax_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/java_cc_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/git_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/github_120.png"></li>
					<li style="margin-right: 39px;"><img
						src="resources/forest/images/skills/gitkraken_120.png"></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="full-width dark-grey flat footer">
		<div class="containers">
			<div class="footer-foot">
				<div class="info">
					<p>
						<span>CoMu Project</span>
					</p>
					<p>© Copyright 2017 CoMu. All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- ============== AboutUs CONTENT END ================= -->

</body>

<!-- COMU PAGE MAIN SPACE CSS  -->
</html>
