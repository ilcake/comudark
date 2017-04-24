<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/forest/components/sticky/jquery.sticky.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/qt-main.css">
<style type="text/css">
#totalWrapper {
	position: relative;
	width: 100%;
	height: 100vh;
	background-color: white;
}

.login-status {
	position: absolute;
	right: 2.5%;
}

.logo-img {
	position: absolute;
	left: 19px;
	height: 54px;
	top: 17px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#stickymenu").sticky({
			topSpacing : 0,
			responsiveWidth : true,
			zIndex : 100
		});
		moveTotalWrapper();

		$("#logIn").click(function() {
			location.href = "login";
		});
		$("#logOut").click(function() {
			location.href = "logout";
		});
	});

	function moveTotalWrapper() {
		$("#totalWrapper").css("padding-top", $("#stickymenu").height());
	}
</script>
<!-- ====================== MENU ================================================ -->
<div id="menu" class="qt-menu-wrapper" data-0-top>
	<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
		<ul class="qt-desktopmenu">
			<li><img class="logo-img" src="myfiles/images/main/logo_5.png"></li>
			<li><a href="home">Home</a></li>
			<li><a href="comu">CoMu</a></li>
			<li><a href="hicu">HiCu</a></li>
			<li><a href="mypage">MyPage</a></li>
			<li><a href="shared">Shared</a></li>
			<li><a href="howto">HowTo</a></li>
			<li><a href="aboutus">AboutUs</a></li>
			<li class="login-status"><c:if test="${empty loginId}">
					<span class="btn btn-primary"
						style="background-color: rgba(255, 33, 78, 0.7);" id="logIn">log
						in <span class="glyphicon glyphicon-log-in"></span>
					</span>
				</c:if> <c:if test="${not empty loginId}">
					<span class="btn btn-primary"
						style="background-color: rgba(255, 33, 78, 0.7);" id="logOut">log
						out <span class="glyphicon glyphicon-log-out"></span>
					</span>
				</c:if></li>
		</ul>
	</nav>
</div>
<!-- ====================== MENU END ================================================ -->