<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="background: white;">
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
	href="myfiles/images/main/logo_1pa.png" />

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

<link rel="stylesheet" type="text/css"
	href="resources/forest/css/howto.css" />

</head>

<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<script type="text/javascript">
		$(".qwsmoothscroll").eq(5).addClass("active");
	</script>

	<div id="totalWrapper" style="background-color: white;">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<!-- start the main content container -->
					<div id="wiki-column-container"
						class="wiki-right-present wiki-left-present">
						<!-- content row with three strips -->
						<div class="column-container column-container-reverse">
							<!-- TOC, approvals, etc -->
							<div class="column-strip wiki-column" id="wiki-right">
								<!-- table of contents -->
								<div id="toc" class="toc toggleable">
									<a href="#toc" class="title toggler"
										data-open-icon="icon-caret-right"
										data-closed-icon="icon-caret-down">How To<i></i></a>
									<ul class="toggle-container">
										<li><a rel="internal" href="#CoMu란">CoMu란?</a>
											<ul>
												<li><a rel="internal" href="#CoMu_기본문법">CoMu 기본문법</a>
													<ul>
														<li><a rel="internal" href="#">1. CoMu 1</a>
														<li><a rel="internal" href="#">2. CoMu 2</a>
														<li><a rel="internal" href="#">3. CoMu 3</a>
													</ul>
												<li><a rel="internal" href="#Sample_Code">샘플코드 재생</a>
												<li><a rel="internal" href="#HiCu">HiCu</a>
											</ul>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-8">
					<!-- start the main content container -->
					<div id="wiki-column-container"
						class="wiki-right-present wiki-left-present">
						<!-- content row with three strips -->
						<div class="column-container column-container-reverse">
							<!-- center: main article content -->
							<div id="wiki-content"
								class="column-half wiki-column text-content">
								<article id="wikiArticle">
									<p></p>
									<section class="Quick_links" id="Quick_Links">
										<!-- -->
									</section>
									<p></p>
									<div class="summary">
										<p>
											<em>CoMu</em> 는 여러분에게 제공한 컴퓨터 언어 코드를 통해서 음악이 생성되고, 들려지는 새로운
											경험을 제공합니다.
										</p>
									</div>

									<h3 id="CoMu란">
										<br>
									</h3>
									<h3>CoMu란?</h3>

									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

									<h3 id="CoMu_기본문법">
										<br>
									</h3>
									<h3>CoMu 기본문법</h3>

									<p>사이트에서 제공되어진 기본 문법 설명란</p>

									<h3 id="Sample_Code">
										<br>
									</h3>
									<h3>샘플코드</h3>
									<textarea class="form-control" rows="10" readonly="readonly">"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi enim quam, cursus ut metus non, posuere pulvinar purus. Vestibulum et lorem vel neque consectetur finibus vitae id tortor. Donec leo felis, rutrum at porta nec, pulvinar faucibus sapien. Integer sollicitudin neque eget facilisis iaculis. Phasellus ultrices rutrum orci, in imperdiet urna vestibulum a. Phasellus ut odio nec augue ullamcorper sodales. In consectetur et arcu a dignissim."
									</textarea>

									<span class="glyphicon glyphicon-play" aria-hidden="true"></span>

									<h3 id="HiCu">
										<br>
									</h3>
									<h3>HiCu</h3>

									<p>HiCu 설명</p>
								</article>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>