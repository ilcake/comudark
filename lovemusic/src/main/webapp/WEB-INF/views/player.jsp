<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CoMu Player</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="resources/jquery-3.1.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<link href='resources/myfiles/css/player.css' rel='stylesheet'
	type='text/css'>

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
<script src="resources/myfiles/js/editor.js"></script>
<script src="resources/myfiles/js/player.js"></script>

<!-- ================   INCLUDE AUDIO JS   =================== -->
<script src="resources/audiojs/three.min.js"></script>
<script src="resources/audiojs/ATUtil.js"></script>
<script src="resources/audiojs/Stats.js"></script>
<script src="resources/audiojs/RequestAnimationFrame.js"></script>
<script src="resources/audiojs/jquery.mousewheel.js"></script>
<script src="resources/audiojs/ImprovedNoise.js"></script>
<script src="resources/audiojs/Visualizer.js"></script>
<script src="resources/audiojs/audio.js"></script>

</head>
<body>
	<div id="source" hidden="hidden">${board.file_ori}</div>
	<table>
		<tr style="height: 5%;">
			<td colspan="2" style="padding-top: 0px; text-align: left;">ID |
				<span class="title">TITLE</span> | FILE TITLE
			</td>
		</tr>
		<tr style="height: 15%;">
			<td class="middle">&nbsp;<img src="images/galaxy-1.jpg"
				class="image">&nbsp;
				<button id="runBtn">
					<span class="glyphicon glyphicon-play" aria-hidden="true"></span>
				</button>
				<button>
					<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
				</button>
			</td>
			<td><div id="editor"></div></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="visual"></div>
			</td>
		</tr>
	</table>
</body>
</html>