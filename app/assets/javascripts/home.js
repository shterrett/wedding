function hideAll(){
	$("section").hide();
}

function hideImage(){
	$("#initial").fadeOut('fast');
}

$().ready( function() {
	hideAll();
	$(".js-link>a").click(function(e){
		e.preventDefault();
		hideImage();
		hideAll();
		var section_id = "#" + $(this).attr('id').replace('-link', '');
		$(section_id).slideDown('slow').addClass("active");		
	});
});
