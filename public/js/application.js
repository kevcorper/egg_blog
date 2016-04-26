$(document).ready(function() {
	$('.create-egg').on('click', function(event) {
		event.preventDefault();
		$target = $(event.target)

		if ($target.text() == "hide form") {
			$target.parent().find('.new-post').remove();
			$target.text('create egg');
		}
		else {
			$.ajax({url: $target.attr("href")})
				.done(function(response) {
					$target.after(response);
					$target.text("hide form");
				})
		};
	});
	

	$('.comments-button').on('click', function() {
		event.preventDefault();
		$('.comments-all').slideToggle()
	});

	$('.comment-form').on('submit', function(event) {
		event.preventDefault();

		$target = $(event.target)

		// $.ajax({url: $target.attr('action'), data: data.serialize()})
		// 	.done(function(response) {

		// 	})
	}); 
});
