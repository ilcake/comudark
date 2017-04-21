
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
		$("#totalWrapper").css("padding-top", 88);
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