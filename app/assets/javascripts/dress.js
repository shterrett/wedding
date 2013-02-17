$(document).ready(function() {
	$('.answer').hide();
	$('.answer>img').hide()
	$('.question').click(function(e){
		e.preventDefault();
		$('.answer').slideUp();
		$(this).next().slideDown();
	});
	$('.answer>span').hover(function(e){
		var selector = "#" + $(this).attr("id").replace("-link", "");
		$(selector).fadeToggle();
	});
})