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
	width: 100%;
	height: 100vh;
	background-color: white;
}
</style>


<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
<script src="resources/jquery-3.1.1.min.js"></script>
<!-- INCLUDES THE CSS FRAMEWORK VIA #IMPORT AND SASS -->
<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_comu.png" />
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/qt-main.css">
<script src="resources/forest/components/sticky/jquery.sticky.js"></script>
<script type="text/javascript">
	$(function() {
		$("#stickymenu").sticky({
			topSpacing : 0,
			responsiveWidth : true,
			zIndex : 100
		});
		moveTotalWrapper();
	});

	function moveTotalWrapper() {
		$("#totalWrapper").height("100vh");
		$("#totalWrapper").css("padding-top", $("#stickymenu").height());
	}
</script>
<!-- ====================== MENU ================================================ -->
<div id="menu" class="qt-menu-wrapper" data-0-top>
	<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
		<ul class="qt-desktopmenu">
			<li><a href="home">Home</a></li>
			<li><a href="comu">CoMu</a></li>
			<li><a href="hicu">HiCu</a></li>
			<li><a href="mypage">MyPage</a></li>
			<li><a href="shared">Shared</a></li>
			<li><a href="howto">HowTo</a></li>
			<li><a href="aboutus">AboutUs</a></li>
		</ul>
	</nav>
</div>
<!-- ====================== MENU END ================================================ -->