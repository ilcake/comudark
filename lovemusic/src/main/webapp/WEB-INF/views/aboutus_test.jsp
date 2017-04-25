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

<!-- About Us START -->
<link rel="stylesheet" href="resources/forest/css/aboutus_test.css">
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

	<!-- ============== AboutUs CONTENT START ================= -->
	<div class="full-width flush-top quotes"
		style="background-image: url('resources/forest/images/galaxy-3.jpg');">
		<div class="container">
			<div class="swipers" style="overflow: hidden;">
				<ul style="list-style: none; margin: 0px;">
					<li>
						<blockquote>
							<p class="fittext" data-max-font-size="60px"
								style="font-size: 60px;">CoMu Project</p>
							<cite class="fittext" data-max-font-size="24px"
								data-min-font-size="12px" style="font-size: 24px;"> 2조
								(Whole Note)</cite>
						</blockquote>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="full-width flush-top">
		<div class="container">
			<div class="emblem-row">
				<div class="emblem-col">
					<div class="icon">
						<img src="resources/forest/images/members/cyc_159.jpg" alt="cyc"
							class="img-circle">
					</div>
					<h2>최유철</h2>
					<p>조장</p>
					<div class="icon">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. In varius tellus at fermentum dignissim. Praesent
						pharetra ante erat, vel scelerisque tellus tempor quis. Duis
						eleifend massa nec sodales luctus.</div>
				</div>
				<div class="emblem-col">
					<div class="icon">
						<img src="resources/forest/images/members/kth_159.jpg" alt="kth"
							class="img-circle">
					</div>
					<h2>김태현</h2>
					<p>조원</p>
					<div class="icon">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. In varius tellus at fermentum dignissim. Praesent
						pharetra ante erat, vel scelerisque tellus tempor quis. Duis
						eleifend massa nec sodales luctus.</div>
				</div>
				<div class="emblem-col">
					<div class="icon">
						<img src="resources/forest/images/members/kgw_159.jpg" alt="kgw"
							class="img-circle">
					</div>
					<h2>김고운</h2>
					<p>조원</p>
					<div class="icon">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. In varius tellus at fermentum dignissim. Praesent
						pharetra ante erat, vel scelerisque tellus tempor quis. Duis
						eleifend massa nec sodales luctus.</div>
				</div>
				<div class="emblem-col">
					<div class="icon">
						<img src="resources/forest/images/members/lmh_159.jpg" alt="lmh"
							class="img-circle">
					</div>
					<h2>이민호</h2>
					<p>조원</p>
					<div class="icon">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. In varius tellus at fermentum dignissim. Praesent
						pharetra ante erat, vel scelerisque tellus tempor quis. Duis
						eleifend massa nec sodales luctus.</div>
				</div>
			</div>
		</div>
	</div>

	<div class="full-width red">
		<div class="container">
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
		<div class="container">
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
				</ul>
			</div>
		</div>
	</div>

</body>
</html>
