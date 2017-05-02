/**
 * 
 */

$(function() {
	var source = $('#source').text();
	console.log(source);
	$('#runBtn').click(
		function() {
			var width = 800;
			var height = 570;
			window.resizeTo(width, height);
			$("#visual").show();
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

	var editor = new MyEditor('editor');
	editor.setValue(source);
	editor.setReadOnly(true);
});