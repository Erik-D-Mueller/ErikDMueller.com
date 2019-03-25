jQuery(function($) {
	
	
	/* setTimeouts are supposed to operate sequentually, but the timers are NOT summed, the timers are bassed on when they themselves are added to
	the queue, which is likely nanoseconds apart, and the timers are a minimum, not a maximum */
	
	/* No, it doesn't. "Execution context" doesn't mean "thread", and until recently Javascript had no support for anything resembling
	threads. What actually happens is that an event is pushed onto the event queue that's set to execute in the number of 
	 milliseconds specified by the second argument to SetTimeout/SetInterval. The consequence of this is that if you request a 
	 1000ms delay, then 1000ms is the MINIMUM delay you'll get. If the execution engine is busy doing something else when the 
	 1000ms delay is over then it will have to wait until it's done with what it's doing. */
	
	$('#emailButton')
			.click(
					function() {

						alert("You can email me at:\r\n\r\nErikDanielMueller@gmail.com\r\n\r\n I look forward to hearing from you!");

					});

	// This is what dissolves out the old div and materializes the new div
	$('.navButton').click(function() {

		/* This helps temporarily lock the height and width of the screen during the animation because
		otherwise the screen gets bigger to accomodate the animation and then shrinks back
		and its not smooth at all and defeats the purpose. Looked Really bad on phones */
		$('body').css("overflow", "hidden");
		
		var oldDiv ="#" + $(this).attr("oldDiv");
		var newDiv ="#" + $(this).attr("newDiv");
		
		$(oldDiv).addClass('blur-out-expand-fwd');

		$(oldDiv).removeClass('focus-in-contract-bck');
		$(newDiv).removeClass('blur-out-expand-fwd');
		$(newDiv).removeClass('focus-in-contract-bck');

		// It takes half  second to dissolve old div, before materialzing new div
		setTimeout(function() {

			// If we're going into the portfolio then darken the background, override style page
			
			// If we're leaving the portfolio div then give control of the background back to style page
			
			$(oldDiv).hide();
			$(newDiv).show();
			$(newDiv).addClass('focus-in-contract-bck');
			
			//Override css sheet and darken the background if its portfolio div
			if (newDiv === "#portfolioPage") {

				$('.container').css("background-color", "rgba(0, 0, 0, 0.3)");

			}
			//Give control of transparency back to css sheet if we're leaving the portfolio
			if (oldDiv === "#portfolioPage") {

				$('.container').removeAttr("style");

			}


		}, 500);
		

		
		setTimeout(function(){	
		
			/*  This unlocks the screen a half second after the second animation starts to let it play out */
			$('body').removeAttr("style");
			
			
			
			
		},1000);

	});

});