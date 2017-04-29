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

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
	crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper">
		<button type="button" data-toggle="modal" data-target="#visualModal"
			id="runModal" hidden="hidden"></button>
		<button type="button" data-toggle="modal" data-target="#saveModal"
			id="saveModalBtn" hidden="hidden"></button>
		<button type="button" data-toggle="modal" data-target="#loadModal"
			id="loadModalBtn" hidden="hidden"></button>
		<input id="mainText" type="hidden" value="${file.file_ori}">
		<c:if test="${not empty loginId}">
			<input id="logInflag" type="hidden" value="true">
		</c:if>
		<div class="comuContent">
			<div class="toolbar">
				<div>
					<input type="button" id="runBtn" value="run"> <input
						type="button" id="addBtn" value="add"> <input
						type="button" id="saveBtn" value="save"> <input
						type="button" id="loadBtn" value="load">
				</div>
				<div>
					Font Size : <select id="fontSize">
						<option>12pt</option>
						<option selected="selected">14pt</option>
						<option>16pt</option>
						<option>18pt</option>
						<option>20pt</option>
						<option>22pt</option>
					</select>
				</div>
				<div>
					Theme : <select id="theme">
						<option>solarized_light</option>
						<option>chrome</option>
						<option selected="selected">vibrant_ink</option>
						<option>cobalt</option>
						<option>monokai</option>
						<option>terminal</option>
					</select>
				</div>
			</div>
			<div class="tree">
				<span class="nameTag clickable list-explorer"
					data-clicked="list-explorer"> List Explorer</span>
				<div class="window clickable treeOver" data-clicked="list-explorer">
					<div id="treeViewDiv"></div>
				</div>
			</div>
			<div class="sampleEditorDiv">
				<span class="nameTag clickable sample" data-clicked="sample">
					Sample </span>
				<div class="window editor "></div>
				<div id="sampleEditor" class="clickable" data-clicked="sample"></div>
			</div>
			<div class="mainEditorDiv">
				<span class="nameTag clickable main" data-clicked="main">
					Main</span>
				<div class="window editor "></div>
				<div id="mainEditor" class="clickable" data-clicked="main"></div>
			</div>
			<div class="error">
				<span class="nameTag clickable errorTag" data-clicked="error">
					Console</span>
				<div class="window editor clickable" data-clicked="error">
					<div class="errorPlace">
						<div id="errorContent">
							<a href="#" id="errorClick"></a><br>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="visualModal" class="modal fade" role="dialog"></div>
	</div>
	<div id="saveModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Save File</h4>
				</div>
				<div class="modal-body">
					<form action="save" method="post" id="saveForm"
						enctype="multipart/form-data">
						<input name="filenum" type="hidden" value="${file.filenum}">
						<input name="userid" type="hidden" value="${loginId}"> <label>
							<img id="imgView" src="resources/covers/${file.cover_re}"
							onERROR="this.src='resources/myfiles/images/comu/robot.png'"
							style="width: 100px; height: 100px; border-radius: 100px;">
							<input type="file" style="display: none;" id="imgInp"
							name="upload" />
						</label> <input type="text" class="form-control" id="title"
							name="file_title" value="${file.file_title}" />
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="save">
						Save<span class="glyphicon glyphicon-saved"></span>
					</button>
				</div>
			</div>

		</div>
	</div>
	<div id="loadModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Load File</h4>
				</div>
				<div class="modal-body">
					<div id="loader"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="load">
						Load<span class="glyphicon glyphicon-loaded"></span>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>