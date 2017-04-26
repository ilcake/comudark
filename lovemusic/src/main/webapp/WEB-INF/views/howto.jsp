<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html style="background-color: white;">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Home</title>

<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<meta name="description" content="">

<meta name="author" content="">

<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/qt-main.css">

<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_1pa.png" />

<script src="resources/jquery-3.1.1.min.js"></script>

<!-- 기존 적용 기능 끝 -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar">

	<!-- 기존 적용 기능 시작 -->

	<!-- ====================== MENU ================================================ -->

	<jsp:include page="navibar.jsp" flush="false" />

	<script type="text/javascript">
		$(".qwsmoothscroll").eq(6).addClass("active");
	</script>

	<script src="js/qt-main.js"></script>

	<link href="resources/myfiles/css/howto.css" rel="stylesheet">

	<!-- ====================== MENU END ================================================ -->

	<div id="totalWrapper" style="background-color: white;">

		<div class="container">

			<div class="row">

				<div class="span3 bs-docs-sidebar" style="position: fixed;">

					<ul class="nav nav-list bs-docs-sidenav affix-top">

						<li><a href="#comu"> CoMu </a></li>

						<li><a href="#hicu"> HiCu </a></li>

						<li><a href="#사용법"> 사용법 </a></li>

						<li><a href="#기타"> 기타 </a></li>

					</ul>

				</div>

				<div class="span9">

					<section id="comu">

						<div class="page-header">

							<h1>CoMu</h1>

						</div>

						<h3>Lorem Ipsum</h3>
						<p>"Neque porro quisquam est qui dolorem ipsum quia dolor sit
							amet, consectetur, adipisci velit..."</p>
						<pre class="prettyprint linenums">
						<ol class="linenums">
						<li class="L0">
						<span class="dec">Neque porro quisquam
						</span>
						</li>
						</ol>
						</pre>


					</section>

					<section id="hicu">

						<div class="page-header">

							<h1>HiCu</h1>

						</div>

					</section>

					<section id="사용법">

						<div class="page-header">

							<h1>사용법</h1>

						</div>

					</section>

					<section id="기타">

						<div class="page-header">

							<h1>기타</h1>

						</div>

					</section>


					<section id="comu1">

						<div class="page-header">

							<h1>CoMu</h1>

						</div>

					</section>

					<section id="hicu1">

						<div class="page-header">

							<h1>HiCu</h1>

						</div>

					</section>

					<section id="사용법1">

						<div class="page-header">

							<h1>사용법</h1>

						</div>

					</section>

					<section id="기타1">

						<div class="page-header">

							<h1>기타</h1>

						</div>

					</section>

				</div>

			</div>

		</div>

	</div>

	<!-- HOWTO JAVASCRIPT START -->

	<script type="text/javascript"
		src="resources/myfiles/js/howto/widgets.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-transition.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-alert.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-modal.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-dropdown.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-scrollspy.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-tab.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-tooltip.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-popover.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-button.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-collapse.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-carousel.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-typeahead.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/bootstrap-affix.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/holder.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/prettify.js"></script>

	<script type="text/javascript"
		src="resources/myfiles/js/howto/application.js"></script>

	<!-- HOWTO JAVASCRIPT END -->

</body>

</html>