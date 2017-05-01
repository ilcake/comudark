<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoMu - Make Your OWN!</title>
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
<script src="resources/audiojs/audio.js"></script>

<!-- ===================   INCLUDE JSTREE   ===================  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
	crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
<script src="resources/myfiles/js/editor.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script> -->
<body>
	<button type="button" data-toggle="modal" data-target="#visualModal"
		id="runModal" hidden="hidden"></button>
	<button type="button" data-toggle="modal" data-target="#saveModal"
		id="saveModalBtn" hidden="hidden"></button>
	<button type="button" data-toggle="modal" data-target="#loadModal"
		id="loadModalBtn" hidden="hidden"></button>
	<button type="button" data-toggle="modal"
		data-target="#loadItemViewModal" id="loadItemBtn" hidden="hidden"></button>
	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper">
		<input id="mainText" type="hidden" value="${file.file_ori}">
		<div class="comuContent row-fluid row">
			<div class="col-md-3">
				<div class="toolbar">
					<div class="tools">
						<div>
							<input type="button" id="runBtn" class="consoleBtn"> <input
								type="button" id="saveBtn" class="consoleBtn"> <input
								type="button" id="loadBtn" class="consoleBtn">
						</div>
						<div id="ConsoleSelectArea">
							<table id="fontAndTheme">
								<tr>
									<td class="tableSetTd">Font Size</td>
									<td class="tableSetTd tableSetSel"><select id="fontSize">
											<option>12pt</option>
											<option selected="selected">14pt</option>
											<option>16pt</option>
											<option>18pt</option>
											<option>20pt</option>
											<option>22pt</option>
									</select></td>
								</tr>
								<tr>
									<td class="tableSetTd">Theme</td>
									<td class="tableSetTd tableSetSel"><select id="theme">
											<option>solarized_light</option>
											<option>chrome</option>
											<option selected="selected">vibrant_ink</option>
											<option>cobalt</option>
											<option>monokai</option>
											<option>terminal</option>
									</select></td>
								</tr>
							</table>
						</div>
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
						Main</span><span id="addBtnSpan"><span id="movelabel">Move</span>&nbsp;&nbsp;<input
						type="button" id="addBtn" class="consoleBtn"></span>
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
	</div>
	<div id="visual" class="modal fade" role="dialog"></div>
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

						<table>
							<tr>
								<td class="modalLabel">Cover Image</td>
								<td class="modalLabel">File Name</td>
							</tr>
							<tr>
								<td class="fileIcon"><label><img id="imgView"
										src="resources/covers/${file.cover_re}"
										onERROR="this.src='resources/myfiles/images/comu/robot.png'"
										style="width: 100px; height: 100px; border-radius: 100px;">
										<input type="file" style="display: none;" id="imgInp"
										name="upload" /> </label></td>
								<td class="fileTitle"><input type="text"
									class="form-control" id="title" name="file_title"
									value="${file.file_title}" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="theSaveCode"></div>
								</td>
							</tr>
						</table>
						<input name="userid" type="hidden" value="${loginId}">
						<c:if test="${not empty file.filenum}">
							<input id="filenum" name="filenum" type="hidden"
								value="${file.filenum}">
						</c:if>
					</form>
				</div>
				<div class="modal-footer" id="modalFooter">
					<a href="#" class="button save" id="save">Save</a>
					<!-- <button type="button" class="myBtn">
						Save<span class="glyphicon glyphicon-floppy-saved"></span>
					</button> -->
				</div>
			</div>

		</div>
	</div>
	<div id="loadModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#comu"
							id="loadComu">COMU</a></li>
						<li><a data-toggle="tab" href="#hicu" id="loadHicu">HICU</a></li>
					</ul>
					<div class="tab-content" style="margin-top: 1px;">
						<!-- =============  tab1 : COMU  ========= -->
						<div id="comu" class="tab-pane in active">
							<div id="comuLoader">
								<!-- loaded file -->
							</div>
						</div>
						<!-- =============  tab2 : HICU  =========== -->
						<div id="hicu" class="tab-pane fade">
							<div id="hicuLoader"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer" id="loadFooter">
					<a href="#" class="button add" id="load">Load</a>
					<!-- <button type="button" class="myBtn">
						Load<span class="glyphicon glyphicon-loaded"></span>
					</button> -->
				</div>
			</div>
		</div>
	</div>

	<div id="loadItemViewModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div id="loadEditor"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>