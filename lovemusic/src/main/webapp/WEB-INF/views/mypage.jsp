<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPAGE</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
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

<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate.min.js"></script>
<!--  JQUERY VERSION MUST MATCH WORDPRESS ACTUAL VERSION (NOW 1.12) -->

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
	overflow: hidden;
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
	z-index: 1000;
	position: absolute;
	top: 20%;
	width: 100%;
	text-align: center;
	color: #fff;
}

.text-white {
	color: #fff !important
}

.text-thin {
	font-weight: 100
}

/* mypage css */
  .center, td, tr{
   text-align : center; 
   margin : auto;
  }
  
  .center{
   width: 650px;
  }
  
  td{
   width: 80px;
   max-width: 80px;
  }
  
  #div3{
   border: solid 1px black;
  }
  
  #div4{
   background-image: url("images/album.jpg");
   background-size: 10%;
   background-repeat: no-repeat;
   background-position: center;
  }
  
  .font{
   font-size: 14px;
  }
  
  .border{
   border: solid 1px gray;
  }
  
  #imgtable{
   width: 20px;
  }
  
  /* board css */
a, a:link, a:hover, a:visited, a:active {
	text-decoration: none;
	color: black;
}

.tr_header{
	margin-top: -5%;
	margin-bottom: -5%;
}

.td_img{
	width:20%;
}

.td_center{
	width: 60%;
}

img {
	border-radius: 100px;
	width: 65px;
	height: 65px;
}

.td_button{
	width:20%;
	text-align: right;
}

.glyphicon{
	font-size: 20px;
}

.panel-group, .panel panel-default {
	margin: auto;
	background: rgba(0, 0, 0, 0.4);
	color: black;
	text-align: left;
}

.panel-heading{
	background-color: blue;
}

/*게시판 블록*/
.box{
	min-width: 70px;
	width: 30%;
	margin: 20px;
	padding: 10px;
	border-radius: 20px;
	float:left;
	display:inline;
	color:black;
	background-color:white;
}

table{
	font-size: medium;
}

.reply > td{
	/*border: solid white 2px;*/
	background-color:#f0f5f5;
	font-size: small;
	padding: 5px;
}

.writerButton{
	position: relative;
	float: left;
	font-size:small;
	margin-bottom: -20%;
}

.replybutton{
	position: relative;
	float: right;
	font-size:small;
	margin-bottom: -20%;
}

.container{
	overflow: visible;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	   //fileList START======
	   $.ajax({
	     type : "get",
	     url : "fileList",
	     success : function(resp) {
	      var msg = "<table class='center' id='loadlist'><tr>";
	      $.each(resp,function(index, item) {
	         //img 주소 : 테스트용 임시 주소!!
	         msg += '<td class="font"><img src="resources/covers/'
	           + item.cover_re
	           + '" style="width:60px; height:60px; border-radius:100px;" draggable="true" ondragstart="drag(event)" id='
	           + item.filenum
	           + '><br>';
	         var title = item.file_title;
	         //if(title.length>8){title = title.substring(0,8)+'<br>'+title.substring(8,title.length);}
	         msg += title
	           + '</td>';
	         if ((index + 7) % 6 == 0) {
	          msg += "</tr><tr>";
	         }
	        });
	      msg += "</tr><table>";
	      $("#loader").html(msg);
	     }
	   });
	   //fileList END=====

	   var page = 1;
	    
	   $(window).scroll(function(){
	         var scrollHeight = $(window).scrollTop() + $(window).height();
	         var documentHeight = $(document).height();
	         
	         if(scrollHeight == documentHeight) {
	               page=page+2;
	               
	             //board 3번 이후로 불러오기
	             if(page==3){
	              $('<c:forEach var="board" items="${boardList}" begin="3" end="4"><table class="border" style="table-layout:fixed; width:600px; margin:auto;"><tr><td id="imgtable" class="border"><img src="" alt="image(클릭 시 곡 재생)"></td><td>${board.title}'+page+'</td></tr></table></c:forEach>').appendTo('#more');
	             }else if(page==5){
	              $('<c:forEach var="board" items="${boardList}" begin="5" end="6"><table class="border" style="table-layout:fixed; width:600px; margin:auto;"><tr><td id="imgtable" class="border"><img src="" alt="image(클릭 시 곡 재생)"></td><td>${board.title}'+page+'</td></tr></table></c:forEach>').appendTo('#more');

	             }
	         }
	    });
	  });
	  
	  function allowDrop(ev) {
	   ev.preventDefault();
	  }
	  
	  function drag(ev) {
	   ev.dataTransfer.setData("text", ev.target.id);
	  }
	  
	  function drop(ev) {
	   ev.preventDefault();
	   var data = ev.dataTransfer.getData("text");
	   ev.target.appendChild(document.getElementById(data));
	   location.href = 'dragwrite?filenum=' + data;
	  }
	  
	  function drop2(ev) {
	   ev.preventDefault();
	   var data = ev.dataTransfer.getData("text");
	   ev.target.appendChild(document.getElementById(data));
	   if(confirm('delete?')){
	    location.href = 'dragdelete?filenum=' + data;
	   }
	  }
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
				<li><a href="comu" class="qwsmoothscroll active">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll">HiCu</a></li>
				<li><a href="mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="shared" class="qwsmoothscroll">Shared</a></li>
				<li><a href="howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<!-- mobile menu -->
			<ul id="slide-out" class="side-nav qt-mobilemenu">
				<li><a href="home" class="qwsmoothscroll">Home</a></li>
				<li><a href="comu" class="qwsmoothscroll active">CoMu</a></li>
				<li><a href="hicu" class="qwsmoothscroll">HiCu</a></li>
				<li><a href="mypage" class="qwsmoothscroll">MyPage</a></li>
				<li><a href="shared" class="qwsmoothscroll">Shared</a></li>
				<li><a href="howto" class="qwsmoothscroll">HowTo</a></li>
				<li><a href="aboutus" class="qwsmoothscroll">AboutUs</a></li>
			</ul>
			<a href="#" data-activates="slide-out"
				class="button-collapse qt-menu-switch"><span
				class="lnr lnr-menu"></span></a>
		</nav>
	</div>
	<!-- ====================== MENU END ================================================ -->

   <!-- main section  ================================ -->
   <main class="qt-main">
    <!-- ====================== SECTION BOOKING AND CONTACTS ================================================ -->
    <div id="booking" class="section section-booking qt-fullscreen scrollspy  qt-polydecor poly3">
    <div class="parallax"><img src="resources/images/galaxy-3.jpg" alt="background"></div>
     <div class="qt-valign-wrapper">
      <div class="qt-valign flow-text">
       <h3 class="qt-section-title" data-100p-top="opacity:0;" data-70p-top="opacity:1;">MYPAGE<i class="deco"></i></h3>
       <div class="qt-booking-form">
        <ul class="tabs">
               <li class="tab col s6"><h5><a href="#form" class="active">FILES</a></h5></li>
               <li class="tab col s6"><h5><a href="#contacts">BOARDS</a></h5></li>
           </ul>
        <div id="form" class="row qt-contacts"> <!-- tab1 -->
         <div id="loader"></div> <!-- loaded file -->
         <hr>
         <table><tr>
          <td id="div2"><a href="write">&lt; go write</a></td>
          <td id="div3" ondrop="drop(event)" ondragover="allowDrop(event)">
           Drop & write</td>
          <td id="div4" ondrop="drop2(event)" ondragover="allowDrop(event)"></td> 
         </tr></table>
           </div>
          <div id="contacts" class="row qt-contacts"> <!-- tab2 -->
           <c:forEach var="board" items="${boardList}" end="1">
           <table class='border' style="table-layout:fixed; width:600px; margin:auto;">
            <tr><td id="imgtable" class='border'><img src="" alt="image(클릭 시 곡 재생)"></td><td>${board.title}</td></tr>
            <tr><td colspan='2'>${board.content}</td></tr>
            <tr class='border'><td colspan='2'>구독/추천</td></tr>
            <tr class='border'><td colspan='2'>reply</td></tr>
           </table><br>
           </c:forEach>
           <div id="more"></div>

          </div>
       </div>
         </div>
     </div>
    </div>
    <!-- ====================== SECTION BOOKING AND CONTACTS END ================================================ -->

   </main>
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

	<!-- comu Video back Script -->
	<script type="text/javascript">
		$(document).ready(function() {
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
			var windowWidth = $(window).width(),
				windowHeight = $(window).height() + 5,
				videoWidth,
				videoHeight;
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
					$('.homepage-hero-module .video-container video').addClass(
						'fadeIn animated');
				});
		}
	</script>
</body>

</html>
