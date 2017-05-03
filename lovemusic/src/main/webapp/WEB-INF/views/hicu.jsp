<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HiCu - Click and Play!</title>
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
	href="myfiles/images/main/logo_1pa.png" />
<!-- COMU BACKGROUND VIDEO CSS -->
<link rel="stylesheet" type="text/css" href="myfiles/css/hicu.css">

<!-- alert bootstrap START -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.0/jquery-confirm.min.js"></script>
<!-- alert bootstrap END -->
</head>
<body>

	<!-- ====================== MENU ================================================ -->
	<div id="menu" class="qt-menu-wrapper" data-0-top>
		<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
			<ul class="qt-desktopmenu">
				<li><img class="logo-img" src="myfiles/images/main/logo_5.png"></li>
				<li><a href="home">Home</a></li>
				<li class="active"><a href="comu">CoMu</a></li>
				<li><a href="hicu">HiCu</a></li>
				<li><a href="mypage">MyPage</a></li>
				<li><a href="shared">Shared</a></li>
				<li><a href="howto">HowTo</a></li>
				<li><a href="aboutus">AboutUs</a></li>
				<li class="login-status"><c:if test="${empty loginId}">
						<span class="btn btn-primary"
							style="background-color: rgba(255, 33, 78, 0.7);" id="logIn">login
							<span class="glyphicon glyphicon-log-in"></span>
						</span>
					</c:if> <c:if test="${not empty loginId}">
						<span class="btn btn-primary"
							style="background-color: rgba(255, 33, 78, 0.7);" id="logOut">logout
							<span class="glyphicon glyphicon-log-out"></span>
						</span>
					</c:if></li>
			</ul>
		</nav>
	</div>


	<!-- ====================== MENU END ================================================ -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h5 class="modal-title">Save as File</h5>
				</div>
				<div class="modal-body">
					<form role="form" id="hicuSaveForm">
						<div class="form-group">
							<label for="codeTitle"><span
								class="glyphicon glyphicon-user"></span> Title</label> <input
								type="text" class="form-control" id="codeTitle"
								name="file_title" placeholder="Enter title">
						</div>
						<div class="form-group">
							<label for="codeResult"><span
								class="glyphicon glyphicon-eye-open"></span> CodeResult</label>
							<textarea class="form-control" rows="5" id="codeResult"
								name="file_ori"></textarea>
						</div>
						<div class="form-group" style="display: none;">
							<label for="compiledResult"><span
								class="glyphicon glyphicon-random"></span> compiledResult</label>
							<textarea class="form-control" rows="5" id="compiledResult"
								name="file_com"></textarea>

						</div>
					</form>
				</div>
				<div class="modal-footer" id="modalFooter">
					<!-- <a href="#" class="button save" id="saveHicuCode">Save</a> -->
					<button id="saveHicuCode" type="button" class="btn-success"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk">Save</span>
					</button>
					<!-- <a href="#" class="button delete" data-dismiss="modal">close</a> -->
					<button type="button" class="btn-danger" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove">close</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End! -->

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
													<tr>
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
											<div class="buttons_row" id="LED_row"></div>
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
													src="myfiles/images/hicu/btn_save.png" data-toggle="modal"
													data-target="#myModal"><img id="reset"
													src="myfiles/images/hicu/btn_reset.png"></span><span
													id="seeCodesArea" class="glyphicon glyphicon-eye-open"></span>
											</div>
											<div id="theResultArea">
												<textarea readonly="readonly" id="resultCode"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="filter"></div>
					<video autoplay loop class="fillWidth">
						<source src="myfiles/video/Hello-World.mp4" type="video/mp4" />
					</video>
				</div>
			</div>
		</div>
	</div>
	<div id="theSaveForm" hidden="">
		<form action="save" id="saveForm">
			<input type="text" name="userid" hidden="" value="${loginId}" /> <input
				type="text" name="file_ori" hidden="" value="" /> <input
				type="text" name="file_com" hidden="" value="" /> <input
				type="text" name="file_type" value="hicu" hidden="" />
		</form>
	</div>


	<!-- =======  CUSTOM JS LIBRARIES: ======================== -->
	<script src="js/bootbox.min.js"></script>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pizzicato/0.6.1/Pizzicato.js"></script>
	<script src="myfiles/js/hicu.js"></script>
	<script type="text/javascript">
		$(function() {
			moveTotalWrapper();
			$("#logIn").click(function() {
				location.href = "login";
			});
			$("#logOut").click(function() {
				location.href = "logout";
			});
			$(".qwsmoothscroll").eq(2).addClass("active");
		});
		function moveTotalWrapper() {
			$("#totalWrapper").css("padding-top", $("#stickymenu").height());
		}
	</script>
</body>

</html>
