$(document).ready(function() {
	// body...
	$('#container').hide();
	$('.show-doctors').click(function(e) {
		e.preventDefault();
		$('#container').show();

	});

});
