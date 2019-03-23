<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>

<c:url var="paperResume"
	value="/download/pdf/ErikDMueller_Paper_Resume.pdf" />
<c:url var="webResume" value="resume" />

<c:url var="toolSoftwareHome" value="/homepage" />

<c:url var="webResume" value="resume" />

<c:url var="jquery"
	value="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" />
<script src="${jquery}"></script>

<c:url var="linkedInLogo" value="/img/linkedInLogo.png" />
<c:url var="gitHubLogo" value="/img/gitHubLogo.png" />

<c:url var="cssHref" value="/css/homepage0.css" />
<link rel="stylesheet" type="text/css" href="${cssHref}">

<!-- The below stuff is for the audio controls, credit to https://github.com/Rosey/audio_player -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">

<c:url var="cssHref10"
	value="http://fonts.googleapis.com/css?family=Kotta+One|Cantarell:400,700" />
<link rel="stylesheet" type="text/css" href="${cssHref10}">

<meta charset="utf-8">

<title>Erik D Mueller:Mover&Shaker!</title>

<!--  I decided to include jquery incase I use it later -->

<c:url var="resume" value="/resume" />

</head>

<body>

	<div class="container">

		<section class="content">
			<div id="homePage">

				<h1 id="name">Erik D Mueller</h1>

				<div id="quote">
					<p>
						<strong>A picture is worth a thousand words</strong>
					</p>
				</div>

				<div id="paragraph">
					<p>
						<strong> I'm a developer, a thinker and a <br /> problem
							solver. We're all better <br /> off if we work together, that's<br />
							the basis for everything that I do.
						</strong>
					</p>
				</div>
				<p>
					<a class="mainButton navButton" oldDiv="homePage"
						newDiv="contactPage">CONTACT</a>
				</p>
				<p>
					<a class="mainButton navButton" oldDiv="homePage"
						newDiv="resumePage"> RESUME </a>
				</p>
				<p>
					<a class="mainButton navButton" oldDiv="homePage"
						newDiv="portfolioPage">PORTFOLIO</a>
				</p>
				<p>
					<button class="audioButton" onclick="bgmPlay()">PLAY</button>

					<button class="audioButton" onclick="bgmPause()">PAUSE</button>
				</p>

				<audio id="bgm" autoplay>

					<source
						src="https://raw.githubusercontent.com/ErikUnique/ResumeWebsite/master/HomeAudioClip%20(online-audio-converter.com).mp3"
						type="audio/mpeg" />
				</audio>
			</div>
	

	
		<div id="contactPage">

			<a target="_blank" href="https://github.com/ErikUnique"><img
				class="linkPics" src="${gitHubLogo}" alt="GitHub Link"></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank"
				href="https://www.linkedin.com/in/erik-d-mueller-b190a3ab/"><img
				class="linkPics" src="${linkedInLogo}" alt="LinkedIn Link"></a>

			<div id="quote"></div>

			<div id="paragraph">

				<div id="emailDiv"></div>

				<section id="emailSuccessDiv">
					<h2>Success</h2>
				</section>

			</div>

			<p>
				<a class="mainButton" id="emailButton">EMAIL</a>
			</p>
			<p>
				<a class="mainButton  navButton" oldDiv="contactPage"
					newDiv="homePage">HOME</a>
			</p>

	</div>




	<div id="resumePage">
	
			<h1>RESUME</h1>
			<br />
			<p>
				<a href="${webResume}" class="mainButton" id="webResumeButton">ONLINE</a>
			</p>

			<p>
				<a href="${paperResume}" class="mainButton" id="pdfResumeButton">DOWNLOAD</a>
			</p>

			<p>
				<a class="mainButton  navButton" oldDiv="resumePage"
					newDiv="homePage">HOME</a>
			</p>


		</div>
		
		
		<div id="portfolioPage" style="text-align: left;">

			<h1>portfolio</h1>
			<br />
			<h5>Tool Lending Library Inventory Management Software</h5>


			<div class="copyP">

				<ul class="copyP">
					<li class="copyP">Java Spring MVC website with session for
						user preferences</li>
					<li>Uses 9 controllers, 4 DAOs, 11 classes and a 5 table
						postgresql database</li>
					<li>Uses bootstrap and is completely mobile responsive</li>
					<li>Made completely from scratch aside from Bootstrap and the
						SpringFramework</li>
					<li>Has CSRF filter</li>
					<li>Has Client side and Server side form validation on all
						form inputs</li>
					<li>Uses salted password hashing on the database></li>
					<li>Integrated Junit tests for all the DAOs</li>
					<li>Bash script and sql scripts to set up the database</li>
					<li>Uses a CDN for jquery and bootstrap</li>
					<li>Two login modes: Librarian or User, librarian has full
						functionality, <br />user can edit their personal info
					</li>
				</ul>

			</div>
			<p>
				<a target="_blank" class="mainButton" href="${toolSoftwareHome}">Enter
					tool Lending Library</a>
			</p>

			<p>
				<a class="mainButton  navButton" oldDiv="portfolioPage"
					newDiv="homePage">HOME</a>
			</p>
</div>

		</section>
</body>

<script>
	var bgm = document.getElementById("bgm");

	function bgmPlay() {
		bgm.play();
		console.log("test");
	};

	function bgmPause() {
		bgm.pause();
	};

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
</script>

</html>