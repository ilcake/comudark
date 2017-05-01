/**
 * 
 */

$(function() {
	var source = $('#source').text();
	console.log(source);
	$('#runBtn').click(
			function() {
				$.ajax({
					type : 'post',
					url : 'compile',
					data : {
						'source' : source
					},
					success : function(resp) {
						var check = resp.substring(0, 5);
						if (check == "error") {
							var errorMsg = resp.substring(5, resp.length);
							var removeTag = errorMsg.replace(/<br>/gi, "\n")
									.replace(/&lt/gi, "<")
									.replace(/&gt/gi, ">");
							alert(removeTag);
						} else {
							setCurrentTimevalue();
							eval(resp);
						}
					}
				});
			});

	var playerEditor = new Editor('editor');
	playerEditor.editor.setValue(source);
});