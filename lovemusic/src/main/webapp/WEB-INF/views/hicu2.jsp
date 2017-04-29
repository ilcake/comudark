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
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper">
		<button type="button" data-toggle="modal" data-target="#visual"
			id="modalBtn" hidden="hidden">Open Modal</button>
		<div class="comuContent row-fluid row">
			<div class="col-md-3">
				<div class="toolbar">
					<div class="tools">
						<input type="button" id="runBtn" value="run"> <input
							type="button" id="addBtn" value="add"> <input
							type="button" id="saveBtn" value="save">
					</div>
				</div>
				<div class="tree">
					<span class="nameTag clickable list-explorer"
						data-clicked="list-explorer"> List Explorer</span>
					<div class="window clickable treeOver" data-clicked="list-explorer">
						<div id="treeViewDiv"></div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="sampleEditorDiv">
					<span class="nameTag clickable sample" data-clicked="sample">
						Sample </span>
					<div class="window editor ">
						<div id="sampleEditor" class="clickable" data-clicked="sample">this
							is sample</div>
					</div>

				</div>
				<div class="mainEditorDiv">
					<span class="nameTag clickable main" data-clicked="main">
						Main</span>
					<div class="window editor ">
						<div id="mainEditor" class="clickable" data-clicked="main">this
							is main</div>
					</div>

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
		</div>

		<div id="visual" class="modal fade" role="dialog"></div>
	</div>
</body>
</html>