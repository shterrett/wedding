$(document).ready(function(){
	$('.hotel-detail').hide();
	$('#hotels li').click(function(){
		$('.hotel-detail').slideUp();
		var target_id = "#" + $(this).attr("id").replace("hotel",  "hotel-detail")
		$(target_id).slideDown();
	})
});