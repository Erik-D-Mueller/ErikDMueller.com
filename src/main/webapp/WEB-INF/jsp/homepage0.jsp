<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>

<c:url var="jquery"
	value="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" />
<script src="${jquery}"></script>

<c:url var="linkedInLogo" value="/img/linkedInLogo.png" />
<c:url var="linkedInLogo" value="/img/linkedInLogo.png" />

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

	<div class="container bgVisShading">

		<section class="content" id="homePage">

			<h1 id="name">Erik D Mueller</h1>

			<div id="quote">
				<p>
					<strong>A picture is worth a thousand words</strong>
				</p>
			</div>

			<div id="paragraph">
				<p>
					<strong> I'm a developer, a thinker and a <br /> problem
						solver. We're all better <br/> off if we work together, that's<br/> the
						basis for everything that I do.
					</strong>
				</p>
			</div>
			<p>
				<a class="mainButton" href="#top" id="contactButton">CONTACT</a>
			</p>
			<p>
				<a class="mainButton" href="${resume}"> RESUME </a>
			</p>
			<p>
				<a class="mainButton" href="#top" id="portfolioButton">PORTFOLIO</a>
			</p>

	<p>
		<button class="audioButton" onclick="bgmPlay()">PLAY</button>

		<button class="audioButton" onclick="bgmPause()">PAUSE</button>
	</p>
	<audio id="bgm" autoplay>
		<source src="http://tezhantezcan.com/bgm.mp3" type="audio/mpeg" />
	</audio>
	
							</section>

	<section class="content" id="contactPage">
	
	
	
	<img src="/img/gitHubLogo.png" alt="GitHub">

		<div id="quote">
			
		</div>

		<div id="paragraph">
					<form action="sendEmail" method="post">

	<p><strong> Full Name or Company:<br/>
		
	<input type="text" name="name" required="a" placeholder="Name" class="form-control">
		
	<br/>Return Email:<br/>
	<input type="text" name="email" required="" placeholder="Recipient Email" class="form-control">
				
							<br/>Subject:<br/>
							<input type="text" name="subject" required=""
								placeholder="Subject" class="form-control">
				
					<br/>	Message:<br/>
								
				<textarea name="message" cols="50" rows="5" required=""
									placeholder="Message.." class="form-control"></textarea>
				

					<input type="reset" value="Reset" class="btn btn-info">

					<input type="submit" name="register" value="Submit"
								class="btn btn-primary"><
								
			</form>

		</div>
		<p>
		<button type="submit" name onclick="bgmPlay()">SEND</button>

	</p>
		<p>
			<a class="mainButton" id="homeButton">HOME</a>
		</p>
	
	</section>

							</body>

<script>

// Contact/home fade in and out
 



var bgm = document.getElementById("bgm");

function bgmPlay() {
	bgm.play();
	console.log("test");
};

function bgmPause() {
	bgm.pause();
};


$('#contactButton').click(function(){
	
	
	$('#homePage').addClass('blur-out-expand-fwd');
	$('#homePage').removeClass('focus-in-contract-bck');
	
	setTimeout(function(){
		
		$('#homePage').hide();
		$('#homePage').removeClass('blur-out-expand-fwd');
		$('#contactPage').show();
		$('#contactPage').addClass('focus-in-contract-bck');
	
	},500  );
	
});


$('#homeButton').click(function(){

	
	$('#contactPage').addClass('blur-out-expand-fwd');
	$('#contactPage').removeClass('focus-in-contract-bck');
	
setTimeout(function(){
		
		$('#contactPage').hide();
		$('#contactPage').removeClass('blur-out-expand-fwd');
		$('#homePage').show();
		$('#homePage').addClass('focus-in-contract-bck');

		
		
	},500  );
	
	
	
});




$('#portfolioButton').click(function(){

	$('#homePage').removeClass('blur-out-expand-fwd');
	
	$('#homePage').addClass('focus-in-contract-bck');


});


</script>

</html>

