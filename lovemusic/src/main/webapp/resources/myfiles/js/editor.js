/**
 * 
 */

function MyEditor(id) {
	this.id = id;
	this.editor = this.setEditor(id);
	this.setFontSize("14pt");
	this.setTheme("vibrant_ink");
	this.setReadOnly(false);
}

MyEditor.prototype.append = function(source) {
	var session = this.editor.session;
	session.insert({
		row : session.getLength(),
		column : 0
	}, "\n" + source);
}

MyEditor.prototype.selectLine = function(lineNum) {
	var Range = require("ace/range").Range;
	this.editor.selection
		.setRange(new Range(lineNum - 1, 0, lineNum - 1, 99999));
}

MyEditor.prototype.setTheme = function(theme) {
	this.editor.setTheme("ace/theme/" + theme);
}
MyEditor.prototype.insert = function(value) {
	this.editor.insert(value);
}

MyEditor.prototype.setValue = function(value) {
	this.editor.setValue(value);
}
MyEditor.prototype.getValue = function() {
	return this.editor.getValue();
}

MyEditor.prototype.setFontSize = function(size) {
	document.getElementById(this.id).style.fontSize = size;
}

MyEditor.prototype.setReadOnly = function(readOnly) {
	this.editor.setReadOnly(readOnly);
}

MyEditor.prototype.setEditor = function(id) {
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
							token : "comment", // multi line comment
							regex : "\\/\\*",
							next : "comment"
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
							token : "constant.numeric",
							regex : "[0-9]+"
						}, {
							token : "comment",
							regex : "\/\/.*"
						}, this.keywordRule ],
					"comment" : [ {
						token : "comment", // closing comment
						regex : ".*?\\*\\/",
						next : "start"
					}, {
						token : "comment", // comment spanning whole line
						regex : ".+"
					} ]
				};
				this.normalizeRules()
			};
			oop.inherits(DynHighlightRules, TextHighlightRules);
			exports.DynHighlightRules = DynHighlightRules;
		});

	var TextMode = require("ace/mode/text").Mode;
	var dynamicMode = new TextMode();
	dynamicMode.HighlightRules = require("DynHighlightRules").DynHighlightRules;

	var edit = ace.edit(id);
	edit.resize();
	edit.session.setMode(dynamicMode);
	return edit;
}