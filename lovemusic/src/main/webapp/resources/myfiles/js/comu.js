var errorLine;
var recentEditor;
var sampleEditor;
var mainEditor;
var loadEditor;
var loginId;
var selectedItem;
var source;
$(function() {
	setView();
	setStringFormat();
	setEditor();
	setClickable();

	getMusicTree();
	getLoginId();

	/*
	 * if (typeof jQuery != 'undefined') { // jQuery is loaded => print the
	 * version alert(jQuery.fn.jquery); }
	 */

	$("#runBtn").click(function() {
		if (recentEditor == null) {
			alert("sample or main?")
			return;
		}
		$("#errorContent").html("<a href='#' id='errorClick'></a><br>");
		$("#errorClick").click(function() {
			recentEditor.selectLine(errorLine);
		});
		comuRun(recentEditor.getValue());
	});

	$("#addBtn").click(addBtn);

	$("#fontSize").change(function() {
		sampleEditor.setFontSize($(this).val());
		mainEditor.setFontSize($(this).val());
	});

	$("#theme").change(function() {
		sampleEditor.setTheme($(this).val());
		mainEditor.setTheme($(this).val());
	})

	$("#imgInp").on('change', function() {
		readURL(this);
	});

	mainEditor.setValue($("#mainText").val());
	$('#load').click(function() {
		if (!source)
			alert('Click the File!');
		else
			mainEditor.append(source);
		source = null;
	});
});

function getLoginId() {
	$.ajax({
		type : 'post',
		url : 'getLoginId',
		success : function(resp) {
			loginId = resp;

			if (loginId) {
				$("#saveBtn").click(function() {
					$("#saveModalBtn").trigger("click");
				});
				$("#save").click(save);

				$("#loadBtn").click(function() {
					refreshLoadModal();
					$("#loadModalBtn").trigger("click");
				});
			} else {
				$("#saveBtn").click(function() {
					alert('로그인이 필요합니다.');
					$("#logIn").trigger("click");
				});
				$("#loadBtn").click(function() {
					alert('로그인이 필요합니다.');
					$("#logIn").trigger("click");
				});
			}
		}
	});
}

function save() {
	if ($("#title").val().length <= 0) {
		alert("Insert the Title")
		return;
	}
	var txt = mainEditor.getValue();

	$('<input>').attr({
		type : 'text',
		name : 'file_ori',
		value : txt
	}).appendTo('#saveForm');
	$('#saveForm').submit();
}

function load() {
	$('.loadable').click(function() {
		source = $(this).attr('data-file_ori');
		$('.loadable').each(function(index, item) {
			$(item).removeClass('selected')
		})
		$(this).addClass('selected');
		loadEditor.setValue(source);
		$('#loadItemBtn').trigger('click');
	});
}

function refreshLoadModal() {
	$
			.ajax({
				type : "get",
				url : "fileList",
				success : function(resp) {
					var comu = "<table class='table'><tr>";
					var hicu = "<table class='table'><tr>";
					$
							.each(
									resp,
									function(index, item) {
										var msg = '<td><div class="loadable" data-filenum="'
												+ item.filenum
												+ '" data-file_ori="'
												+ item.file_ori
												+ '"><img src="resources/covers/'
												+ item.cover_re
												+ '" style="width:80px; height:80px; border-radius:5px;"></div>';
										msg += item.file_title + '</td>';
										if ((index + 5) % 4 == 0) {
											msg += "</tr><tr>";
										}
										if (item.file_type == 'comu')
											comu += msg;
										else
											hicu += msg;
									});
					comu += "</tr><table>";
					hicu += "</tr><table>";
					$("#comuLoader").html(comu);
					$("#hicuLoader").html(hicu);
					load();
				}
			});
}

function setClickable() {
	$(".clickable").click(function() {
		$(".clickable").each(function(index, item) {
			$(item).removeClass("clicked");
		});
		var tmp = $(this).attr("data-clicked");
		switch (tmp) {
		case "list-explorer":
			$(".list-explorer").addClass("clicked");
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
			break;
		}
	});
}

function setView() {
	$("#totalWrapper").css("height", $(window).height()).css("padding-top",
			"90px");
}

function setEditor() {
	sampleEditor = new MyEditor('sampleEditor');
	mainEditor = new MyEditor('mainEditor');
	loadEditor = new MyEditor('loadEditor');
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

					$("#treeViewDiv").delegate("a", "dblclick",
							function(e, data) {
								var node = $(e.target).closest("li");
								var id = node[0].id; // id of the selected
								// node
							});
				}
			});
}

function addBtn() {
	var sample = sampleEditor.getValue();
	mainEditor.insert(sample);
	sampleEditor.setValue("");
}

function comuRun(source) {
	if (source == null || source.length == 0) {
		alert("There is no INPUT");
		return false;
	}
	$.ajax({
		type : "post",
		url : "compile",
		data : {
			"source" : source
		},
		success : function(resp) {
			var check = resp.substring(0, 5);
			if (check == "error") {
				var errorMsg = resp.substring(5, resp.length);
				errorLine = parseInt(errorMsg);
				errorMsg = errorMsg.substring((errorLine + "").length + 4,
						errorMsg.length);
				$("#errorClick").html("Error Line :  " + errorLine);
				$("#errorContent").append(errorMsg);
			} else {
				$("#runModal").trigger("click");
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
