<script src="resources/forest/components/sticky/jquery.sticky.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/qt-main.css">
<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_comu.png" />

<style type="text/css">
#totalWrapper {
	width: 100%;
	height: 100vh;
	background-color: white;
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
	});

	function moveTotalWrapper() {
		$("#totalWrapper").css("padding-top", $("#stickymenu").height());
	}
</script>
<!-- ====================== MENU ================================================ -->
<div id="menu" class="qt-menu-wrapper" data-0-top>
	<nav id="stickymenu" class="qt-menu grey-text text-lighten-4">
		<!-- desktop menu -->
		<ul class="qt-desktopmenu">
			<li><a href="home">Home</a></li>
			<li><a href="comu" class="qwsmoothscroll">CoMu</a></li>
			<li><a href="hicu" class="qwsmoothscroll">HiCu</a></li>
			<li><a href="mypage" class="qwsmoothscroll">MyPage</a></li>
			<li><a href="shared" class="qwsmoothscroll">Shared</a></li>
			<li><a href="howto" class="qwsmoothscroll">HowTo</a></li>
			<li><a href="aboutus" class="qwsmoothscroll">AboutUs</a></li>
		</ul>
		<!-- mobile menu -->
		<ul id="slide-out" class="side-nav qt-mobilemenu">
			<li><a href="home" class="qwsmoothscroll">Home</a></li>
			<li><a href="comu" class="qwsmoothscroll">CoMu</a></li>
			<li><a href="#hicu" class="qwsmoothscroll">HiCu</a></li>
			<li><a href="mypage" class="qwsmoothscroll">MyPage</a></li>
			<li><a href="shared" class="qwsmoothscroll">Shared</a></li>
			<li><a href="howto" class="qwsmoothscroll">HowTo</a></li>
			<li><a href="aboutus" class="qwsmoothscroll">AboutUs</a></li>
		</ul>
		<a href="#" data-activates="slide-out"
			class="button-collapse qt-menu-switch"><span class="lnr lnr-menu"></span></a>
	</nav>
</div>
<!-- ====================== MENU END ================================================ -->