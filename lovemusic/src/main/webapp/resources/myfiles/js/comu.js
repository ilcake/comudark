var errorLine;
var recentTA;
$(function() {

	/*
	 * if (typeof jQuery != 'undefined') { // jQuery is loaded => print the
	 * version alert(jQuery.fn.jquery); }
	 */
	setJqueryFn();
	$("#myCarousel").css("height", "100%").css("padding-top", "2%");
	$(".get-started").click(getStarted);
	$("#addBtn").click(addBtn);
	$(".saveBtn").click(save);
	$("#imgInp").on('change', function() {
		readURL(this);
	});
	$("#sampleRun").click(function() {
		recentTA = $("#sample").get(0);
		comuRun($("#sample").val());
	});
	$("#mainRun").click(function() {
		recentTA = $("#main").get(0);
		comuRun($("#main").val());
	});
	$("#errorClick").click(function() {
		selectTextareaLine(recentTA, errorLine);
	});

	if ($("#title").val() != null && $("#title").val() > 0) {
		$(".get-started").trigger("click");
	}
});

// 시작 버튼이 눌러졌을 때 혹은 MY MUSIC에서 로드 될 때
function getStarted() {
	$(".comu-container").show("slow");
	$(this).attr("hidden", "");
	$(".btn-default").css("background-color", "rgb(39,169,157)");
	$("#addBtn").css("background-color", "#f0ad4e");
}

function addBtn() {
	var sample = $('#sample').val();
	var position = $("#main").getCursorPosition();
	$("#main").setCursorPosition(position);
	$("#main").insertAtCursor(sample);
	$('#sample').val('');
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
			var check = resp.substring(0, 5);
			if (check == "error") {
				var errorMsg = resp.substring(5, resp.length);
				errorLine = parseInt(errorMsg);
				$("#errorClick").html("errorLine :  " + errorLine);
				$("#errorContent").html(
						errorMsg.substring(errorLine, errorMsg.length));
			} else {
				$("#modalBtn").trigger("click");
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

// 외부 jqeury 함수 셋팅
function setJqueryFn() {
	$.fn.setCursorPosition = function(position) {
		if (this.length == 0)
			return this;
		return $(this).setSelection(position, position);
	}
	$.fn.setSelection = function(selectionStart, selectionEnd) {
		if (this.length == 0)
			return this;
		input = this[0];
		if (input.createTextRange) {
			var range = input.createTextRange();
			range.collapse(true);
			range.moveEnd('character', selectionEnd);
			range.moveStart('character', selectionStart);
			range.select();
		} else if (input.setSelectionRange) {
			input.focus();
			input.setSelectionRange(selectionStart, selectionEnd);
		}
		return this;
	}
	$.fn.focusEnd = function() {
		this.setCursorPosition(this.val().length);
		return this;
	}
	$.fn.getCursorPosition = function() {
		var el = $(this).get(0);
		var pos = 0;
		if ('selectionStart' in el) {
			pos = el.selectionStart;
		} else if ('selection' in document) {
			el.focus();
			var Sel = document.selection.createRange();
			var SelLength = document.selection.createRange().text.length;
			Sel.moveStart('character', -el.value.length);
			pos = Sel.text.length - SelLength;
		}
		return pos;
	}
	$.fn.insertAtCursor = function(myValue) {
		return this.each(function(i) {
			if (document.selection) {
				// For browsers like Internet Explorer
				this.focus();
				sel = document.selection.createRange();
				sel.text = myValue;
				this.focus();
			} else if (this.selectionStart || this.selectionStart == '0') {
				// For browsers like Firefox and Webkit based
				var startPos = this.selectionStart;
				var endPos = this.selectionEnd;
				var scrollTop = this.scrollTop;
				this.value = this.value.substring(0, startPos) + myValue
						+ this.value.substring(endPos, this.value.length);
				this.focus();
				this.selectionStart = startPos + myValue.length;
				this.selectionEnd = startPos + myValue.length;
				this.scrollTop = scrollTop;
			} else {
				this.value += myValue;
				this.focus();
			}
		})
	}
}

// 에러 메세지 클릭시 해당 하는 라인 셀렉트
function selectTextareaLine(tarea, lineNum) {
	lineNum--; // array starts at 0
	var lines = tarea.value.split("\n");

	// calculate start/end
	var startPos = 0, endPos = tarea.value.length;
	for (var x = 0; x < lines.length; x++) {
		if (x == lineNum) {
			break;
		}
		startPos += (lines[x].length + 1);

	}

	var endPos = lines[lineNum].length + startPos;

	// do selection
	// Chrome / Firefox

	if (typeof (tarea.selectionStart) != "undefined") {
		tarea.focus();
		tarea.selectionStart = startPos;
		tarea.selectionEnd = endPos;
		return true;
	}

	// IE
	if (document.selection && document.selection.createRange) {
		tarea.focus();
		tarea.select();
		var range = document.selection.createRange();
		range.collapse(true);
		range.moveEnd("character", endPos);
		range.moveStart("character", startPos);
		range.select();
		return true;
	}
	return false;
}