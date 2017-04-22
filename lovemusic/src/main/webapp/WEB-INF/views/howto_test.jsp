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

<link rel="stylesheet" type="text/css"
	href="resources/forest/css/howto.css" />
<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<script type="text/javascript">
		$(".qwsmoothscroll").eq(5).addClass("active");
	</script>

	<div id="totalWrapper" style="background-color: white;">

		<div class="container">
			<div class="row">
				<div class="col-md-3">
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
										data-closed-icon="icon-caret-down">현재 문서 내<i></i></a>
									<ul class="toggle-container">
										<li><a rel="internal" href="#첫번째_웹사이트_이야기">첫번째 웹사이트
												이야기</a>
											<ul>
												<li><a rel="internal" href="#기본_소프트웨어_설치하기">기본
														소프트웨어 설치하기</a>
												<li><a rel="internal" href="#웹사이트의_외관은_어떻게_할까요">웹사이트의
														외관은 어떻게 할까요?</a>
												<li><a rel="internal" href="#파일들_다루기">파일들 다루기</a>
												<li><a rel="internal" href="#HTML_기본">HTML 기본</a>
												<li><a rel="internal" href="#CSS_기본">CSS 기본</a>
												<li><a rel="internal" href="#JavaScript_기본">JavaScript
														기본</a>
												<li><a rel="internal" href="#웹사이트_출판하기">웹사이트 출판하기</a>
												<li><a rel="internal" href="#웹의_동작_방식">웹의 동작 방식</a>
											</ul></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-9">
					<div class="summary">
						<p>
							<em>Web과 함께 시작하기</em> 는 여러분에게 웹 개발의 실질적인 측면을 소개하는 간결한 시리즈 입니다.
							여러분의 간단한 웹페이지를 생성하고 출판하기 위해 필요한 도구들을 마련하게 될 것입니다.
						</p>
					</div>

					<h3 id="첫번째_웹사이트_이야기">첫번째 웹사이트 이야기</h3>

					<p>전문적인 웹사이트를 생성하기 위해서는 아주 많은 작업이 필요합니다. 그렇기 때문에 만약 여러분이 웹개발을
						처음 시작하는 것이라면 저희가 작은것부터 시작할 수 있도록 도와드릴 수 있습니다. 여러분은 페이스북을 당장 만들수는
						없지만 여러분 개인의 간단한 온라인 웹사이트를 만드는 것은 그리 어렵지 않습니다. 따라서 여러분 개인의 간단한
						웹사이트를 만드는것부터 시작할 겁니다.</p>

					<p>아래 나열된 항목들을 통해, 아무것도 모르는 상태에서 여러분은 여러분의 첫번째 온라인 웹페이지를 만들 수
						있습니다. 시작해봅시다!</p>

					<h3 id="기본_소프트웨어_설치하기">소프트웨어 설치하기</h3>

					<p>웹 사이트 생성을 위한 도구는 아주 많습니다. 만약 여러분이 막 시작하였다면, 많은 코드 편집기나 프레임워크
						그리고 테스트 도구들 때문에 혼란스러울겁니다. 기본 소프트웨어 설치하기에서는 여러분이 기본적인 웹 개발을 시작하기 위해
						필요한 소프트웨어를 어떻게 설치할 수 있는지 단계적으로 알려드릴겁니다.</p>

					<h3 id="웹사이트의_외관은_어떻게_할까요">웹사이트의 외관은 어떻게 할까요?</h3>

					<p>여러분의 웹사이트를 위한 코드 작성을 시작하기 전에, 여러분은 먼저 계획을 해야 합니다. 어떤 정보들을
						강조할 것인가요? 어떤 글꼴이나 생상을 사용할 것인가요? 웹사이트의 외관은 어떻게 할까요? 우리는 여러분이 사이트의
						내용이나 디자인을 계획하기 위해 따라할 수 있는 간단한 방법을 제공할 것입니다.</p>

					<h3 id="파일들_다루기">파일들 다루기</h3>

					<p>웹사이트는 많은 파일들(문자, 코드, 스타일시트, 미디어, 등등)로 이루어져있습니다. 여러분이 웹사이트를
						만들 때, 여러분은 합리적인 구조로 이러한 파일들을 모아야 하고 서로 잘 작용이 가능한지 확인해야 합니다. 파일들
						다루기는 여러분의 웹사이트를 위해 합리적인 파일 구조를 어떻게 설정하고 여러분이 어떤 문제들을 주의해야 하는지 설명할
						것입니다.</p>

					<h3 id="HTML_기본">HTML 기본</h3>

					<p>Hypertext Markup Language (HTML) 는 여러분의 웹 컨텐츠를 구조화하고, 의미와
						의도를 주기위해 사용되는 코드입니다. 예를 들면, 내 컨텐츠가 문단의 집합인지, 또는 목차(*)의 리스트인지? 내
						페이지에 이미지를 넣어야 하는지? 데이터 테이블이 필요한지? 여러분을 난처하지 않게하면서, HTML 기본은 여러분이
						HTML에 익숙해질 수 있도록 충분한 정보를 제공할 것입니다.</p>

					<h3 id="CSS_기본">CSS 기본</h3>

					<p>Cascading Stylesheets (CSS) 는 여러분의 웹사이트를 디자인할 때 사용하는 코드입니다.
						예를 들면, 문자가 검정색이나 빨간색이길 원하는지? 컨텐츠가 화면의 어디에 표시되어야 하는지? 웹사이트를 꾸미기 위해
						무슨 배경 이미지나 색이 사용되어야 하는지? CSS 기본은 여러분이 시작하기 위해 필요한 것들을 가져다 줄 것입니다.
					</p>

					<h3 id="JavaScript_기본">JavaScript 기본</h3>

					<p>JavaScript 는 여러분이 인터렉티브한 기능을 웹사이트에 추가할 때 사용하는 프로그래밍 언어입니다.
						예를 들면 게임, 버튼이 눌리거나 폼에 정보가 입력되었을 때 발생하는 것, 동적인 스타일 효과, 애니매이션 등이
						있습니다. JavaScript 기본은 여러분께 이 흥미로운 언어로 가능한 것들에 대한 것과 어떻게 시작할 수 있는지에
						대한 아이디어를 제공할 것입니다.</p>

					<h3 id="웹사이트_출판하기">웹사이트 출판하기</h3>

					<p>일단 여러분이 코드 작성과 웹사이트를 위한 파일 구성을 마쳤다면, 사람들이 찾아볼 수 있도록 이 모든 것을
						온라인에 둘 필요가 있습니다. 예제 코드 출판하기는 여러분이 간단한 예제 코드를 어떻게 최소한의 노력으로 얻을 수
						있는지 설명할 것입니다.</p>

					<h3 id="웹의_동작_방식">웹의 동작 방식</h3>

					<p>여러분이 가장 선호하는 웹사이트에 접근할 때, 여러분이 모르는 많은 복잡한 것들이 눈에 띄지 않는 곳에서
						발생합니다. 웹의 동작 방식은 여러분이 컴퓨터로 웹페이지를 볼 때 발생하는 것들에 대한 개략적인 설명을 할 것입니다.
					</p>

				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#toc").on("click contextmenu", "a", function(event) {
			var $thisLink = $(this);
			var url = $thisLink.attr("href");
			var linkData = {
				category : "TOC Links",
				action : $thisLink.text(),
				label : $thisLink.attr("href")
			};

			var fixed = $("#toc.fixed").length > 0 ? "fixed" : "not fixed";
			var clickData = {
				category : "TOC Click",
				action : fixed
			};
			
			$(window).scroll(function(){
				var scrollTop = $(document).scrollTop();
				
				$("body").animate({"scrollTop" + 200});
			});
			
			/* $("h3").css("padding-top", 88); */
		});
	</script>
</body>
</html>