$(document).ready(function() {
	$('#path').click(function(event) {
		var name = $('#ipath').val();
		$.get('result.jsp', {
			path : name,
			isparent : false
		}, function(responseText) {
			$('#display').html(responseText);
			$('#iparent').val(name);
		});
	});

	$('#parent').click(function(event) {
		var name = $('#iparent').val();
		$.get('result.jsp', {
			path : name,
			isparent : true
		}, function(responseText) {
			var n = name.lastIndexOf("/");
			var parent = name.substring(0, n);
			$('#display').html(responseText);
			$('#ipath').val(parent);
			$('#iparent').val(parent);
		});
	});
});
