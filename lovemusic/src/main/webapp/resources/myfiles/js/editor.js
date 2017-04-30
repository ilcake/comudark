/**
 * 
 */

function Editor(id) {
	this.id = id;
	this.setEditor(id);
	this.setFontSize("14pt");
	this.setTheme("vibrant_ink");
}

Editor.prototype.setFontSize = function(size) {
	document.getElementById(this.id).style.fontSize = size;
}

Editor.prototype.setTheme = function(theme) {
	this.editor.setTheme("ace/theme/" + theme);
};

Editor.prototype.setEditor = function(id) {
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

	this.editor = ace.edit(id);
	this.editor.resize();
	this.editor.session.setMode(dynamicMode);
}