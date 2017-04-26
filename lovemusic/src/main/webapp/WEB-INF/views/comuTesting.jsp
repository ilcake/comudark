<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- ==============   INCLUDE JS AND CSS   ================= -->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="resources/myfiles/js/comu.js"></script>
<link href='resources/myfiles/css/comu.css' rel='stylesheet'
	type='text/css'>
<script src="resources/myfiles/js/bg-movie.js"></script>
<link href='resources/myfiles/css/bg-movie.css' rel='stylesheet'
	type='text/css'>

<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_comu.png" />

<!-- ================   INCLUDE AUDIO JS   =================== -->
<script src="resources/audiojs/three.min.js"></script>
<script src="resources/audiojs/ATUtil.js"></script>
<script src="resources/audiojs/Stats.js"></script>
<script src="resources/audiojs/RequestAnimationFrame.js"></script>
<script src="resources/audiojs/jquery.mousewheel.js"></script>
<script src="resources/audiojs/ImprovedNoise.js"></script>
<script src="resources/audiojs/Visualizer.js"></script>
<script src="resources/audiojs/comu.js"></script>
<script src="resources/audiojs/jquery.session.js"></script>

<!-- ===================   INCLUDE JSTREE   ===================  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper">
		<div class="video-container">
			<video autoplay loop class="fillWidth">
				<source src="myfiles/video/For_Wes.mp4" type="video/mp4" />
			</video>
		</div>

		<div class="get-started">
			<button type="button" class="btn btn-success btn-lg">GET
				STARTED</button>
		</div>

		<div class="comu-container" hidden="">
			<div class="row">
				<!--   12칸의 세로 영역을 분할하기 위해 col-md-x를 작성   -->
				<div class="col-md-3 leftplace">
					<h4 class="treeViewName">LIST:</h4>
					<div id="treeViewDiv"></div>
				</div>
				<div class="col-md-6 centerPlace">
					<form id="form" action="save" method="post"
						enctype="multipart/form-data">
						<div class="inlineD">
							<button type="button" data-toggle="modal" data-target="#visual"
								id="modalBtn" hidden="hidden">Open Modal</button>
							<h4>SAMPLE:</h4>
							<button type="button" class="btn btn-default btn-md float-right"
								id="sampleRun">
								RUN <span class="glyphicon glyphicon-play"></span>
							</button>
						</div>
						<textarea class="form-control" rows="5" name="sample" id="sample"></textarea>
						<br>
						<div class="inlineD">
							<h4>MAIN:</h4>
							<button type="button" class="btn btn-default btn-md center"
								id="addBtn">
								ADD <span class="glyphicon glyphicon-arrow-down"></span>
							</button>
							<button type="button" class="btn btn-default btn-md float-right"
								id="mainRun">
								RUN <span class="glyphicon glyphicon-play"></span>
							</button>
						</div>
						<textarea class="form-control" rows="15" name="file_ori" id="main">${file.file_ori}</textarea>
						<c:if test="${not empty loginId}">
							<br>
							<div class="row">
								<div class="col-md-2">
									<label> <img id="imgView"
										src="resources/covers/${file.cover_re}"
										onERROR="this.src='resources/myfiles/images/comu/robot.png'"
										style="width: 100px; height: 100px; border-radius: 100px;">
										<input type="file" style="display: none;" id="imgInp"
										name="upload" />
									</label>
								</div>
								<div class="col-md-10">
									<div class="inlineD">
										<h4>TITLE:</h4>
										<button type="button"
											class="btn btn-default btn-md saveBtn float-right">
											SAVE <span class="glyphicon glyphicon-saved"></span>
										</button>
									</div>
									<input type="text" class="form-control" id="title"
										name="file_title" value="${file.file_title}" />
								</div>
							</div>
							<br>
							<br>
						</c:if>
					</form>
				</div>

				<div class="col-md-3 rightPlace">
					<div class="errorPlace">
						<div>
							<a href="#" id="errorClick"></a>
						</div>
						<div id="errorContent"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div id="visual" class="modal fade" role="dialog"></div>
	</div>
</body>
</html>