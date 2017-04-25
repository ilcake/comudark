
var theMap;
var bpm;
var tempo;
var beatStack;
var selectedBeat;
var melodyStack;
var bassStack;
var playGroup;
var interPlay;
var interLed;
var codeResult;
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
			console.log((theMap));
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
*        on Click Play ! / Stop !
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
			console.log(resp);
			codeResult = resp;
			playAction();
			$("#play").addClass("playing");
			$("#stop").addClass("playing");

		},
		error : function(resp) {
			alert(JSON.stringify(resp));
		}
	});
}
function goResult() {
	eval(codeResult);
}

function playAction(theCord) {
	goResult();
	goLed();
	interPlay = setInterval(goResult, (bpm * 1000));
	interLed = setInterval(goLed, (bpm * 1000));
}

function stopEvent() {
	console.log("STOP!!");
	$("#stop").removeClass("playing");
	$("#play").removeClass("playing");
	clearInterval(interPlay);
	clearInterval(interLed);
	playGroup.stop();

}


/********************************************** 
*
*              on click Add Btn
*
***********************************************/
function insAddEvent() {
	var ins = $(this).attr("dt-ins");
	console.log(ins + " is requested");

	var theContents = "";
	var serial = 1 + Math.floor(Math.random() * 50000);
	switch (ins) {
	case "beats":
		beatStack = "";
		thePicked = [];
		theContents += "<div id='area_" + serial + "' class='addedLines'>";
		var btSelected = $("#beatSelection").val();
		switch (btSelected) {
		case "beat":
			theContents += "<div class='buttons_row'>";
			theContents += "<table class='tbContainer'><tr><td class='tdLbContainer'>";
			theContents += "<span class='label'>" + btSelected + " <img src='myfiles/images/hicu/ins_remove.png' class='ins_remove' dt-line='" + serial + "' dt-who='beat'></span> ";
			theContents += "</td><td class='tdBtContainer'>";
			for (var i = 1; i < 17; i++) {
				theContents += "<img dt-cla='loop' dt-sta='off' dt-ins='beat' dt-loc='1' dt-nt='" + i + "' id='beat_" + i + "' class='hiBtn beat' src='myfiles/images/hicu/button_off.png'>";
			}
			theContents += "</td></tr></table>";
			theContents += "</div>";
			$("#btnsBeat").html(theContents);
			break;

		case "acu":
		case "r8":
			theContents += "<div id='area_" + serial + "' class='addedLines'>";
			theContents += "<div class='selectLine'><table class='theSelectionTable'><tr>";
			theContents += "<th><span class='label'>" + btSelected + "</span> <img src='myfiles/images/hicu/ins_remove.png' class='ins_remove' dt-line='" + serial + "'  dt-who='beat'></th>";
			theContents += "<th><div class='tempodisplay'><span id='tempo'>120</span>&nbsp;<span id='bpm'>bpm</span></div>";
			theContents += "<span class='tempocontrol'><img class='tempC' src='myfiles/images/hicu/tempo_dec.png' id='tempodec'>";
			theContents += "<img class='tempC' src='myfiles/images/hicu/tempo_inc.png' id='tempoinc'></span>";
			theContents += "</th></tr></table></div>";
			$.each(drumSet, function(index, item) {
				theContents += "<div class='buttons_row'>";
				theContents += "<table class='tbContainer'><tr><td class='tdLbContainer'>";
				theContents += "<span class='label'>" + item + "</span> ";
				theContents += "</td><td class='tdBtContainer'>";
				for (var i = 1; i < 17; i++) {
					theContents += "<img dt-sta='off' dt-ins='" + btSelected + "' dt-nt='" + item + "' dt-loc='" + i + "' id='" + item + "_" + i + "' class='hiBtn " + btSelected + "' src='myfiles/images/hicu/button_off.png'>";
				}
				theContents += "</td></tr></table>";
				theContents += "</div>";
			//plusSize += 41.33;
			});
			$("#btnsBeat").html(theContents);
			tmpControl();
			break;
		}
		break;

	case "bass":
		bassStack = "";
		console.log("the Bpm Now == " + bpm);
		console.log("search Bass == " + (bpm - 0.2) + "~" + (bpm + 0.2));

		var bassArr = theMap.bass;
		var newBass = [];
		$.each(bassArr, function(index, item) {
			if ((bpm - 0.2 <= item.bpm) && (bpm + 0.2) >= item.bpm) {
				newBass.push(item);
			}
		});
		console.log(newBass);
		newBass = shuffle(newBass);

		theContents += "<div id='area_" + serial + "' class='addedLines'>";
		theContents += "<div class='buttons_row'>";
		theContents += "<table class='tbContainer'><tr><td class='tdLbContainer'>";
		theContents += "<span class='label'>" + ins + " <img src='myfiles/images/hicu/ins_remove.png' class='ins_remove' dt-line='" + serial + "' dt-who='bass'></span> ";
		theContents += "</td><td class='tdBtContainer'>";

		$.each(newBass, function(index, item) {
			if (index < 16) {
				theContents += "<img dt-cla='loop' dt-sta='off' dt-ins='bass' dt-loc='1' dt-nt='" + item.fileName + "' id='beat_" + item.fileName + "' class='hiBtn bass' src='myfiles/images/hicu/button_off.png'>";
			}
		});
		theContents += "</td></tr></table>";
		theContents += "</div></div>";

		$("#btnsBass").html(theContents);

		break;

	case "melody":
		melodyStack = "";
		console.log("the Bpm Now == " + bpm);
		var melodyArr = theMap.melody;
		console.log(melodyArr);
		var newMel = [];
		$.each(melodyArr, function(index, item) {
			if ((item.bpm - 0.1 <= bpm) && (item.bpm + 0.1) >= bpm) {
				newMel.push(item);
			}
		});
		console.log(newMel);
		newMel = shuffle(newMel);
		theContents += "<div id='area_" + serial + "' class='addedLines'>";
		theContents += "<div class='buttons_row'>";
		theContents += "<table class='tbContainer'><tr><td class='tdLbContainer'>";
		theContents += "<span class='label'>Melo <img src='myfiles/images/hicu/ins_remove.png' class='ins_remove' dt-line='" + serial + "' dt-who='bass'></span> ";
		theContents += "</td><td class='tdBtContainer'>";

		$.each(newMel, function(index, item) {
			if (index < 16) {
				theContents += "<img dt-cla='loop' dt-sta='off' dt-ins='" + ins + "' dt-loc='1' dt-nt='" + item.fileName + "' id='" + ins + "_" + item.fileName + "' class='hiBtn " + ins + "' src='myfiles/images/hicu/button_off.png'>";
			}
		});
		theContents += "</td></tr></table>";
		theContents += "</div></div>";

		$("#btnsMelody").html(theContents);
		break;
	}
	theContents += "</div>";

	$(".ins_remove").on("click", insRemoveEvent);
	$(".hiBtn").on("click", btnEvent);
	console.log("wow!! " + serial + " added");
}



/********************************************** 
*
*               Shuffle Array!!!
*
***********************************************/
function shuffle(array) {
	var currentIndex = array.length,
		temporaryValue,
		randomIndex;

	// While there remain elements to shuffle...
	while (0 !== currentIndex) {

		// Pick a remaining element...
		randomIndex = Math.floor(Math.random() * currentIndex);
		currentIndex -= 1;

		// And swap it with the current element.
		temporaryValue = array[currentIndex];
		array[currentIndex] = array[randomIndex];
		array[randomIndex] = temporaryValue;
	}

	return array;
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
	theLeds += "<table class='tbContainer'><tr><td class='tdLbContainer'><span class='label blank'>GO</span></td><td class='tdBtContainer'>";
	for (var i = 1; i < 17; i++) {
		theLeds += "<img class='leds' id='LED_" + i + "' src='myfiles/images/hicu/LED_off.png'>";
	}
	theLeds += "</td></tr></table>";
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
	var isLoop = ($(this).attr("dt-cla")) == "loop";

	if (status == "off") {
		var insData = theOne.attr("dt-ins");
		var ntData = theOne.attr("dt-nt");
		var locData = theOne.attr("dt-loc");
		var theCodeDt = insData + "-" + ntData + "-" + locData;
		if (isLoop) {
			switch (insData) {
			case "beat":
				beatStack = theCodeDt;
				$.each(theMap.beat, function(index, item) {
					if (item.fileName == ntData) {
						bpm = item.bpm;
						console.log("theDuration now = " + bpm);
					}
				});


				$.each(thePicked, function(index, item) {
					var whoIsIt = item.split("-")[0];
					if ( (whoIsIt == "beat") ) {
						thePicked.splice(index, 1);
					}
				});
				for (var i = 0; i < 17; i++) {
					$("#beat_" + i).attr("src", "myfiles/images/hicu/button_off.png");
					$("#beat_" + i).attr("dt-sta", "off");
				}
				break;
			case "melody":
				melodyStack = theCodeDt;
				break;
			case "bass":
				bassStack = theCodeDt;
				break;
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
			beatTemp = beatStack.split("-");
		} else if (theIns == "melody") {
			melodyTemp = melodyStack.split("-");
		} else if (theIns == "bass") {
			bassTemp = bassStack.split("-");
		} else {
			var isChange = (num == 0 || temp != theIns);
			if (isChange) {
				theCode += "\nins " + theIns + "{\n";
				theCode += "  location 0;\n  do 1;\n";
				temp = theIns;
			}
			theCode += "  note(" + theOne[1] + "," + (theOne[2] - 1) + ");\n";
			if ((num + 1) == leng) {
				theCode += "}\n";
			} else if ( (thePicked[num + 1].split("-")[0] != theIns) ) {
				theCode += "}\n";
			}
		}
		if (beatTemp.length > 0 && (beatStack != "")) {
			theBeatCode = "\nloop beat" + beatTemp[1] + "{\n  location 0;\n  do 1;\n}\n";
		} else {
			theBeatCode = "bpm " + $("#tempo").text() + ";\n";
		}

		if (bassTemp.length > 0 && (bassStack != "")) {
			theBassCode = "\nloop bass" + bassTemp[1] + "{\n  location 0;\n  do 1;\n}\n";
		}

		if (melodyTemp.length > 0 && (melodyStack != "")) {
			theMelodyCode = "\nloop melody" + melodyTemp[1] + "{\n  location 0;\n  do 1;\n}\n";
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
	goNewTempo(bpmNow);
	mkCode();


	$("#tempodec").on("click", function() {
		var bpmNow = Number($("#tempo").text());
		bpmNow -= 5;
		console.log("tempodec is on" + bpmNow);
		$("#tempo").text(bpmNow);
		goNewTempo(bpmNow);
		console.log("theDuration now = " + bpm);
		mkCode();
	});
	$("#tempoinc").on("click", function() {
		var bpmNow = Number($("#tempo").text());
		bpmNow += 5;
		console.log("tempoinc is on" + bpmNow);
		$("#tempo").text(bpmNow);
		goNewTempo(bpmNow);
		console.log("theDuration now = " + bpm);
		mkCode();
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
*                 Led Controls
*
***********************************************/

function goLed() {
	onLeds();
	offLeds();
}

function onLeds() {
	console.log("onLeds start");
	for (var i = 1; i < 17; i++) {
		var thisMan = ("#LED_" + i);
		var theTime = ((bpm / 16) * i * 1000);
		mkOnLed(thisMan, theTime);
	}
}

function mkOnLed(who, time) {
	setTimeout(function() {
		$(who).attr("src", "myfiles/images/hicu/LED_on.png");
	}, time);
}
function mkOffLed(who, time) {
	setTimeout(function() {
		$(who).attr("src", "myfiles/images/hicu/LED_off.png");
	}, time);
}

function offLeds() {
	for (var i = 1; i < 17; i++) {
		var thisMan = ("#LED_" + i);
		var theTime = ((bpm / 16) * i * 1000) + ((bpm / 16) * 1000);
		mkOffLed(thisMan, theTime);
	}
}

function initLeds() {
	$(".leds").attr("src", "myfiles/images/hicu/LED_off.png");
}


/********************************************** 
*
*               loadAudio~
*
***********************************************/
function loadAudio(url, time, hasReverb, hasDelay, hasLowFilter, hasHighFilter) {
	playGroup = new Pizzicato.Group();

	var sound1 = new Pz.Sound({
		source : 'file',
		options : {
			path : url,
			loop : false
		}
	}, function() {
		console.log(url + ' file loaded!' + time);
		sound1.play(time, 0);
		playGroup.addSound(sound1);
	});
}


/********************************************** 
*
*                 on save!!!!
*
***********************************************/
function saveEvent() {
	var theCodes = $("#resultCode").text();

	$("#codeResult").text(theCodes);
	$.ajax({
		url : "compile",
		data : {
			"source" : theCodes
		},
		type : "POST",
		success : function(resp) {
			console.log(resp);
			$("#compiledResult").text(resp);
		},
		error : function() {}
	});
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
	$("#save").on("click", saveEvent);
	$("#reset").on("click", function() {
		location.reload();
	});
});