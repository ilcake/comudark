

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
		<!-- desktop menu -->
		<ul class="qt-desktopmenu">
			<li><a href="home" class="qwsmoothscroll">Home</a></li>
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