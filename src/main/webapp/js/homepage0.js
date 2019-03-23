jQuery(function($) {
	
	
	$('#emailButton')
			.click(
					function() {

						alert("You can email me at:\r\n\r\nErikDanielMueller@gmail.com\r\n\r\n I look forward to hearing from you!");

					});

	// This is what dissolves out the old div and materializes the new div
	$('.navButton').click(function() {

		var oldDiv = "#" + $(this).attr("oldDiv");
		var newDiv = "#" + $(this).attr("newDiv");

		$(oldDiv).addClass('blur-out-expand-fwd');

		$(oldDiv).removeClass('focus-in-contract-bck');
		$(newDiv).removeClass('blur-out-expand-fwd');
		$(newDiv).removeClass('focus-in-contract-bck');

		// It takes half  second to dissolve old div, before materialzing new div
		setTimeout(function() {

			// If we're going into the portfolio then darken the background, override style page
			if (newDiv === "#portfolioPage") {

				$('.container').css("background-color", "rgba(0, 0, 0, 0.3)");

			}

			// If we're leaving the portfolio div then give control of the background back to style page
			if (oldDiv === "#portfolioPage") {

				$('.container').removeAttr("style");

			}

			$(oldDiv).hide();
			$(newDiv).show();
			$(newDiv).addClass('focus-in-contract-bck');

		}, 500);

	});

		
	
});