$(document).ready(function() {
	$('#login-form').hide("fast");
	
	$('#pageContentHeader').delay(1000).animate({'marginTop' : "-=160px"});
	
    $('#login-form').delay(1000).animate({'marginTop' : "+=160px"}, function() {
		$(this).fadeIn();
	});
});