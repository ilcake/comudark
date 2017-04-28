var errorLine;
var recentEditor;
var sampleEditor;
var mainEditor;
$(function() {
	setView();
	setStringFormat();
	getMusicTree();
	setEditor();
	setClickable();
	/*
	 * if (typeof jQuery != 'undefined') { // jQuery is loaded => print the
	 * version alert(jQuery.fn.jquery); }
	 */

	$(".get-started").click(getStarted);
	$("#addBtn").click(addBtn);
	$("#saveBtn").click(save);
	$("#imgInp").on('change', function() {
		readURL(this);
	});

	$("#runBtn").click(function() {
		if (recentEditor == null) {
			alert("sample or main?")
			return;
		}
		$("#errorContent").html("<a href='#' id='errorClick'></a><br>");
		comuRun(recentEditor.getValue());
	});
	$("#errorClick").click(function() {
		selectTextareaLine(errorLine);
	});

});

function setClickable() {
	$(".clickable").click(function() {
		$(".clickable").each(function(index, item) {
			$(item).removeClass("clicked");
		});
		var tmp = $(this).attr("data-clicked");
		switch (tmp) {
		case "list-explorer":
			$(".list-explorer").addClass("clicked");
			recentEditor = null;
			break;
		case "sample":
			$(".sample").addClass("clicked");
			recentEditor = sampleEditor;
			break;
		case "main":
			$(".main").addClass("clicked");
			recentEditor = mainEditor;
			break;
		case "error":
			$(".errorTag").addClass("clicked");
			recentEditor = null;
			break;
		}
	});
}

function setView() {
	$("#totalWrapper").css("height", $(window).height()).css("padding-top",
			"90px");
}

function setEditor() {
	define(
			"DynHighlightRules",
			[],
			function(require, exports, module) {
				"use strict";
				var oop = require("ace/lib/oop");
				var TextHighlightRules = require("ace/mode/text_highlight_rules").TextHighlightRules;
				var DynHighlightRules = function() {
					this.keywordRule = {
						regex : "\\w+",
						onMatch : function() {
							return "text"
						}
					}
					this.$rules = {
						"start" : [
								{
									token : "keyword",
									regex : "tempo|bpm|loop|ins"
								},
								{
									token : "variable",
									regex : "location|do|note|reverb|delay|low|high"
								},
								{
									token : "constant",
									regex : "bass|beat|melody|acu|dub|guitarcode|guitarnote|piano|r8"
								}, {
									token : "markup.heading",
									regex : "[_A-Za-z$][_A-Za-z0-9$]*"
								}, {
									token : "comment",
									regex : "[0-9]+"
								}, this.keywordRule ]
					};
					this.normalizeRules()
				};
				oop.inherits(DynHighlightRules, TextHighlightRules);
				exports.DynHighlightRules = DynHighlightRules;
			});

	var TextMode = require("ace/mode/text").Mode;
	var dynamicMode = new TextMode();
	dynamicMode.HighlightRules = require("DynHighlightRules").DynHighlightRules;

	sampleEditor = ace.edit("sampleEditor");
	sampleEditor.resize();
	sampleEditor.setTheme("ace/theme/vibrant_ink");
	sampleEditor.session.setMode(dynamicMode);
	document.getElementById('sampleEditor').style.fontSize = '18px';

	mainEditor = ace.edit("mainEditor");
	mainEditor.resize();
	mainEditor.setTheme("ace/theme/vibrant_ink");
	mainEditor.session.setMode(dynamicMode);
	document.getElementById('mainEditor').style.fontSize = '18px';

}

function setStringFormat() {
	if (!String.format) {
		String.format = function(format) {
			var args = Array.prototype.slice.call(arguments, 1);
			return format.replace(/{(\d+)}/g, function(match, number) {
				return typeof args[number] != 'undefined' ? args[number]
						: match;
			});
		};
	}
}

function getMusicTree() {
	$
			.ajax({
				type : "post",
				url : "getList",
				success : function(resp) {
					var tree = '{ "data" : [';
					var mapKey = Object.keys(resp);
					var insId = 0;
					var arr = [];
					$
							.each(
									mapKey,
									function(index, item) {
										// console.log(JSON.stringify(resp[item][0]));
										// console.log(resp[item][0]["motherName"]);
										// console.log(resp[item][0]["insName"]);
										// console.log(resp[item][0]["fileName"]);
										// tree += String.format("{'id' : '{0}'
										// , 'parent' : '#', 'text'
										// : '{1}' }", );
										if ($.inArray(
												resp[item][0]["motherName"],
												arr) == -1) {
											if (index != 0) {
												tree += ", "
											}
											tree += String
													.format(
															'{"id" : "{0}" ,"parent" : "#", "text" : "{1}"}',
															resp[item][0]["motherName"],
															resp[item][0]["motherName"]);
											arr
													.push(resp[item][0]["motherName"]);
										}
										if (resp[item][0]["insName"] != 'effect') {
											tree += String
													.format(
															', {"id" : "{0}" , "parent" : "{1}", "text" : "{2}" }',
															resp[item][0]["insName"],
															resp[item][0]["motherName"],
															resp[item][0]["insName"]);
										}
										var arrayList = resp[item];
										$
												.each(
														arrayList,
														function(listIndex,
																listItem) {
															var id = insId++;
															var parent = listItem["insName"];
															var text = listItem["fileName"];
															tree += String
																	.format(
																			', {"id" : "{0}" , "parent" : "{1}", "text" : "{2}" }',
																			id,
																			parent,
																			text);
														});
									});
					tree += "] }";
					var jsonTree = JSON.parse(tree);
					$('#treeViewDiv').jstree({
						'plugins' : [ "wholerow" ],
						'core' : jsonTree
					});
				}
			});
}

// 시작 버튼이 눌러졌을 때 혹은 MY MUSIC에서 로드 될 때
function getStarted() {
	$(".comu-container").show("slow");
	$(this).attr("hidden", "");
}

function addBtn() {
	var sample = sampleEditor.getValue();
	mainEditor.insert(sample);
	sampleEditor.setValue("");
}

function comuRun(source) {
	if (source == null || source.length == 0) {
		alert("입력 값이 없습니다.");
		return false;
	}
	$.ajax({
		type : "post",
		url : "compile",
		data : {
			"source" : source
		},
		success : function(resp) {
			console.log("resp = " + resp);
			var check = resp.substring(0, 5);
			if (check == "error") {
				var errorMsg = resp.substring(5, resp.length);
				console.log("errorMsg = " + errorMsg);
				errorLine = parseInt(errorMsg);
				errorMsg = errorMsg.substring((errorLine + "").length + 4,
						errorMsg.length);
				$("#errorClick").html("Error Line :  " + errorLine);
				$("#errorContent").append(errorMsg);
			} else {
				$("#modalBtn").trigger("click");
				setCurrentTimevalue();
				eval(resp);
			}
		}
	});
}

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#imgView').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

// 파일 저장
function save() {
	if ($("#title").val() == null || $("#title").val() == 0) {
		alert("제목을 입력하세요");
		return false;
	}
	$("#form").submit();
}

// 에러 메세지 클릭시 해당 하는 라인 셀렉트
function selectTextareaLine(lineNum) {
	var Range = require("ace/range").Range;
	console.log(new Range(lineNum, 0, lineNum, 9999));
	recentEditor.selection
			.setRange(new Range(lineNum - 1, 0, lineNum - 1, 9999));
}