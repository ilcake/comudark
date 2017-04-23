
var theMap;
var bpm;
var tempol
var beatStack;
var melodyStack;
var bassStack;
var thePicked = [];
var drumSet = [ "hihat", "kick", "snare", "tom1", "tom2", "tom3" ];

/*******************************************
*
* 		     Initiation Function
* 
********************************************/
function initHiCu() {
	makeLED();
	console.log("=============Get Ins List==============");

	/*******************************************
	*
	* 				get Ins List
	* 
	********************************************/
	$.ajax({
		url : "getList",
		type : "POST",
		success : function(resp) {
			theMap = resp;
			$.each(theMap, function(index, item) {
				if (item.length != 0) {
					console.log("index_" + index);
					$.each(item, function(ind, it) {
						console.log(" ㄴ  " + it.filePath);
					});
				}
			});
			console.log("==================================");
		},
		error : function(resp) {}
	});

}


/********************************************** 
*
*                 on Click Play !
*
***********************************************/
function playEvent() {
	var theSource = $("#resultCode").val();
	console.log("play ==> " + theSource);
	$.ajax({
		type : "POST",
		url : "compile",
		data : {
			"source" : theSource
		},
		success : function(resp) {
			alert(resp);
			eval(resp);
			$("#play").addClass("playing");
			$("#stop").addClass("playing");
		},
		error : function(resp) {
			alert(JSON.stringify(resp));
		}
	});
}

function stopEvent() {
	console.log("STOP!!");
	$("#stop").removeClass("playing");
	$("#play").removeClass("playing");

}


/********************************************** 
*
*              on click Add Btn
*
***********************************************/
function insAddEvent() {
	var ins = $(this).attr("dt-ins");
	console.log(ins + " is requested");
	var serial = 1 + Math.floor(Math.random() * 50000);

	var theContents = "";
	theContents += "<div id='area_" + serial + "' class='addedLines'>";
	switch (ins) {
	case "beats":
		var btSelected = $("#beatSelection").val();
		switch (btSelected) {
		case "loops":
			theContents += "<div class='buttons_row'>";
			theContents += "<span class='label'>" + btSelected + " <img src='myfiles/images/hicu/ins_remove.png' class='ins_remove' dt-line='" + serial + "'></span> ";
			for (var i = 1; i < 17; i++) {
				theContents += "<img dt-cla='loops' dt-sta='off' dt-ins='beat' dt-loc='1' dt-nt='" + i + "' id='beat_" + i + "' class='hiBtn beat' src='myfiles/images/hicu/button_off.png'>";
			}
			theContents += "</div>";
			break;

		case "acu":
		case "r8":
			theContents += "<div class='selectLine'><table class='theSelectionTable'><tr>";
			theContents += "<th><span class='label'>" + btSelected + "</span> <img src='myfiles/images/hicu/ins_remove.png' class='ins_remove' dt-line='" + serial + "'></th>";
			theContents += "<th><div class='tempodisplay'><span id='tempo'>120</span>&nbsp;<span id='bpm'>bpm</span></div>";
			theContents += "<span class='tempocontrol'><img class='tempC' src='myfiles/images/hicu/tempo_dec.png' id='tempodec'>";
			theContents += "<img class='tempC' src='myfiles/images/hicu/tempo_inc.png' id='tempoinc'></span>";
			theContents += "</th></tr></table></div>";
			$.each(drumSet, function(index, item) {
				theContents += "<div class='buttons_row'>";
				theContents += "<span class='label'>" + item + "</span> ";
				for (var i = 1; i < 17; i++) {
					theContents += "<img dt-sta='off' dt-ins='" + btSelected + "' dt-nt='" + item + "' dt-loc='" + i + "' id='" + item + "_" + i + "' class='hiBtn " + btSelected + "' src='myfiles/images/hicu/button_off.png'>";
				}
				theContents += "</div>";
			//plusSize += 41.33;
			});
			break;
		}
		break;

	case "bass":

		break;

	case "melody":
		break;
	}
	theContents += "</div>";
	$("#btnsArea").html(theContents);
	$(".ins_remove").on("click", insRemoveEvent);
	$(".hiBtn").on("click", btnEvent);
	tmpControl();
	console.log("wow!! " + serial + " added");
}

/********************************************** 
*
*               INS Remove Event!
*
***********************************************/
function insRemoveEvent() {
	var thisbtn = "area_" + ($(this).attr("dt-line"));
	$("#" + thisbtn).remove();
	console.log("wow!! " + thisbtn + " removed!");
}

/********************************************** 
*
*                make LED Line!
*
***********************************************/
function makeLED() {
	var theLeds = "";
	for (var i = 1; i < 17; i++) {
		theLeds += "<img class='leds'	id='LED_" + i + "' src='myfiles/images/hicu/LED_off.png'>";
	}
	$("#LED_row").append(theLeds);
}

/********************************************** 
*
*                set Height automatic!
*
***********************************************/
function setMaxHeightRow() {
	var winHeight = $(window).height();
	console.log(winHeight);
	$(".row").css("max-height", (winHeight - 100));
}

/********************************************** 
*
*                  btnEvent!
*
***********************************************/

function btnEvent() {
	console.log("clicked!");
	var theOne = $(this);

	var status = $(this).attr("dt-sta");
	var isLoop = ($(this).attr("dt-cla")) == "loops";

	if (status == "off") {
		var insData = theOne.attr("dt-ins");
		var ntData = theOne.attr("dt-nt");
		var locData = theOne.attr("dt-loc");
		var theCodeDt = insData + "-" + ntData + "-" + locData;
		if (isLoop) {
			switch (insData) {
			case "beat":
				beatStack = theCodeDt;
				break;
			case "melody":
				melodyStack = theCodeDt;
				break;
			case "bass":
				bassStack = theCodeDt;
				break;
			}



			$.each(thePicked, function(index, item) {
				var whoIsIt = item.split("-")[0];
				if ((whoIsIt == "beat") || (whoIsIt == "melody") || (whoIsIt == "bass")) {
					thePicked.splice(index, 1);
				}
			});
			for (var i = 0; i < 17; i++) {
				$("#beat_" + i).attr("src", "myfiles/images/hicu/button_off.png");
				$("#beat_" + i).attr("dt-sta", "off");
			}
		}
		theOne.attr("src", "myfiles/images/hicu/button_on.png");
		theOne.attr("dt-sta", "on");
		thePicked.push(insData + "-" + ntData + "-" + locData);
		thePicked.sort();
	} else {
		theOne.attr("src", "myfiles/images/hicu/button_off.png");
		theOne.attr("dt-sta", "off");
		var nin = theOne.attr("dt-ins");
		var nnt = theOne.attr("dt-nt");
		var nlc = theOne.attr("dt-loc");
		var who = thePicked.indexOf(insData + "-" + ntData + "-" + locData);
		thePicked.splice(who, 1);

	}
	thePicked.sort();
	mkCode();
}


/********************************************** 
*
*                  makeCode!
*
***********************************************/

function mkCode() {
	var theCode = "";
	var theBeatCode = "";
	var theMelodyCode = "";
	var theBassCode = "";
	var temp = "";
	var beatTemp = "";
	var melodyTemp = "";
	var bassTemp = "";
	var leng = thePicked.length;
	$.each(thePicked, function(index, item) {
		var theOne = item.split("-");
		console.log(theOne);
	});

	thePicked.sort();
	$.each(thePicked, function(num, who) {
		console.log("Each Num==" + num);
		var theOne = who.split("-");
		var theIns = theOne[0];
		if (theIns == "beat") {
			beatTemp = theOne;
		} else if (theIns == "melody") {
			melodyTemp = theOne;
		} else if (theIns == "bass") {
			bassTemp = theOne;
		} else {
			var isChange = (num == 0 || temp != theIns);
			if (isChange) {
				theCode += "\nins " + theIns + "{\n";
				theCode += "  location 1;\n";
				temp = theIns;
			}
			theCode += "  note(" + theOne[1] + "," + theOne[2] + ");\n";
			if ((num + 1) == leng) {
				theCode += "}\n";
			} else if ( (thePicked[num + 1].split("-")[0] != theIns) ) {
				theCode += "}\n";
			}
		}
		if (beatTemp.length > 0) {
			theBeatCode = "loop beat " + beatTemp[1] + "{\n  location 1;\n  do 1;\n}\n";
		} else {
			theBeatCode = "bpm " + $("#tempo").text() + ";";
		}

		if (bassTemp.length > 0) {
			theBassCode = "loop bass " + bassTemp[1] + "{\n  location 1;\n  do 1;\n}\n";
		}

		if (melodyTemp.length > 0) {
			theMelodyCode = "loop melody " + melodyTemp[1] + "{\n  location 1;\n  do 1;\n}\n";
		}
	});

	$("#resultCode").text(theBeatCode + theBassCode + theMelodyCode + theCode);
}


/********************************************** 
*
*                tmpControl();
*
***********************************************/
function tmpControl() {
	var bpmNow = Number($("#tempo").text());
	$("#tempo").text(bpmNow);


	$("#tempodec").on("click", function() {
		var bpmNow = Number($("#tempo").text());
		bpmNow -= 5;
		console.log("tempodec is on" + bpmNow);
		$("#tempo").text(bpmNow);
		goNewTempo(bpmNow);
	});
	$("#tempoinc").on("click", function() {
		var bpmNow = Number($("#tempo").text());
		bpmNow += 5;
		console.log("tempoinc is on" + bpmNow);
		$("#tempo").text(bpmNow);
		goNewTempo(bpmNow);
	});
	console.log("tmp Control loaded //==" + bpm);
}

/********************************************** 
*
*                 getTempo; Method;
*
***********************************************/

function goNewTempo(theod) {
	var theTempoValue = 16;
	bpm = ((theTempoValue * 60) / theod) / 4;
	tempo = bpm / theTempoValue;
}

/********************************************** 
*
*                 on Ready!
*
***********************************************/
$(function() {
	initHiCu();
	setMaxHeightRow();
	$("#play").on("click", playEvent);
	$("#stop").on("click", stopEvent);
	$(".ins_add").on("click", insAddEvent);
});