<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">





<head>

<c:url var="jquery"
	value="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js" />
<script src="${jquery}"></script>

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








			<form action="sendEmail" method="post">

				<table class="table table-bordered" style="width: 60%;">

					<thead>
						<tr>
							<th>
								<center>Simple MailSending Form</center>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Name:</td>
							<td><input type="text" name="name" required="a"
								placeholder="Name" class="form-control"></td>
						</tr>

						<tr>
							<td>Recipient Email:</td>
							<td><input type="text" name="email" required=""
								placeholder="Recipient Email" class="form-control"></td>
						</tr>
						<tr>
							<td>Subject:</td>
							<td><input type="text" name="subject" required=""
								placeholder="Subject" class="form-control"></td>
						</tr>
						<tr>
							<td>Message: <td>
							
							<td><textarea name="message" cols="50" rows="5" required=""
									placeholder="Message.." class="form-control"></textarea></td>
						</tr>

						<tr>

							<td><input type="reset" value="Reset" class="btn btn-info"></td>

							<td><input type="submit" name="register" value="Submit"
								class="btn btn-primary"></td>
						</tr>
					</tbody>
				</table>
				<center>
					<a href="email-attachment">Send Email With Attachments</a>
				</center>
			</form>
	
	</div>
	</center>
























	</tbody>



















	<h1 id="name">Erik D Mueller</h1>

	<div id="quote">
		<p>
			<strong>A picture is worth a thousand words</strong>
		</p>
	</div>

	<div id="paragraph">
		<p>
			<strong> I'm a developer, a thinker and a <br /> problem
				solver. We're all better
</br> off if we work together, that's</br> the basis for
								everything that I do. </strong>
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



	<form action="https://formcarry.com/s/N6ytU2ZSS2R" method="POST"
									accept-charset="UTF-8">


		<input type="email" name="email">
		<!-- use this to reply visitors and prevent spam via akismet -->
		<input type="text" name="firstName"> <input type="text"
										name="lastName"> <input type="text"
										name="anotherInput">

		<input type="hidden" name="_gotcha">
		<!-- use this to prevent spam -->
		<input type="submit" value="Submit">
	</form>



	<input type="text" name="name">



	<p>
		<button class="audioButton" onclick="bgmPlay()">PLAY</button>

		<button class="audioButton" onclick="bgmPause()">PAUSE</button>
	</p>
	<audio id="bgm" autoplay>
		<source src="http://tezhantezcan.com/bgm.mp3" type="audio/mpeg" />
	</audio>
	</section>



	<section class="content" id="contactPageHidden">

		<h1>Erik D Mueller</h1>

		<div id="quote">
			<p>
				<strong>contact</strong>
			</p>
		</div>

		<div id="paragraph">
			<p>
				<strong> I'm a developer, a thinker and a <br /> problem
					solver. We're all better</br> off if we work together, that's</br> the basis
					for everything that I do.
				</strong>
			</p>
		</div>
		<p>
			<a class="mainButton" id="contactButton">CONTACT</a>
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


	<span class="homeFadeOut btn">Click me</span>


	<div class='homeOpacity fade-in homeInvisible'>You look amazing!</div>

	</div>

							</body>

<script type="text/javascript">

// Contact/home fade in and out
 

<!--  audio controls script -->

var bgm = document.getElementById("bgm");
function bgmPlay() {
	bgm.play();
	console.log("test");
}

function bgmPause() {
	bgm.pause();
}


<!-- this triggers the hinge if user presses a key -->

$('#contactButton').click(function(){

	$('#homePage').removeClass('blur-out-expand-fwd')
	
});



$('#contactButton').click(function(){

	$('#homePage').addClass('blur-out-expand-fwd');

	$('#homePage').removeClass('focus-in-contract-bck');
	
	
	
});








$('#portfolioButton').click(function(){

	$('#homePage').removeClass('blur-out-expand-fwd');
	
	$('#homePage').addClass('focus-in-contract-bck');


});



</script>



</html>

