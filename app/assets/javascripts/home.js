function hideAll(){
	$("section").hide();
}

function showWhen() {
	hideAll();
	hideImage();
	$("#when").slideDown('slow');
}

function showWhere() {
	hideAll();
	hideImage();
	$("#where").slideDown('slow');
}

function showHow(){
	hideAll();
	hideImage();
	$("#how").slideDown('slow');
}

function showRegistry(){
	hideAll();
	hideImage();
	$("#registry").slideDown('slow');
}

function hideImage(){
	$("#initial").fadeOut('fast');
}

$().ready( function() {
	hideAll();
	$("#when-link").click(function() { showWhen() });
	$("#where-link").click(function() { showWhere() });
	$("#how-link").click(function() { showHow() });
	$("#registry-link").click(function() { showRegistry() });
});