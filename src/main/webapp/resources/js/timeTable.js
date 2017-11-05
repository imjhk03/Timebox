/* 사용자 메뉴 */
$(document).ready(function() {
	/* 사용자 메뉴 */
	$("#accountMenu").hide();
	
	$('#pageHeaderAccount').click(function() {
		$('#accountMenu').slideToggle('fast');
	});
	
	$('.subclass').click(function() {
		winobj = window.open('boardLink', "",
		"toolbar=no,menubar=no,width=450,height=310")
	});
	
	$('.noclass').click(function() {
		winobj = window.open('timeChoice', "",
		"toolbar=no,menubar=no,width=650,height=415")
	});
	
	$('#timeTableSetting').click(function() {
		winobj = window.open('timeChoice', "",
		"toolbar=no,menubar=no,width=650,height=415")
	});
});

function timeChoice() {
	winobj = window.open('timeChoice', "",
			"toolbar=no,menubar=no,width=650,height=415")
}