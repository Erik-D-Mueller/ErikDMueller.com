<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!--  WELCOME!  

This is a website that I put together for two business women starting a Triathlon training camp!  

It is half done because they have not yet given me all of the triathlon content to finish it with. 

Java SpringMVC framework running on an Apache-Tomcat 9 Server hosted through JavaPipe

The front end I pieced together with different chunks of code from free BootStrapMade templates.
(no point in reinventing the wheel to build  car)

Has a nice contact form and form field validation.

No graphical editors of any type used (although I did use chunks from bootStrapMade templates)

Completely Mobile responsive including for the IphoneX which has over 400 CSS pixels per inch.

It scores a 100% on a light-audit SEO test!

-->

<!DOCTYPE HTML>
<html lang="en">

<head>
<meta charset="utf-8" content="IE=edge,chrome=1"
	http-equiv="X-UA-Compatible">
<title>Azur Triathlon Camp</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description"
	content="This is the official website for Azur Tri Camp, a triathlon training camp run by Naomi Azur and Melanie Gulliver in France.  The site was designed by Erik D Mueller of ErikDMueller.com the front end uses some pieces from a BootstrapMade template.">


<!-- simply grabbing pictures from the img folder does not require jstl -->

<c:url var="jquery" value="/js/jquery.js" />
<c:url var="jqueryscrollTo" value="/js/jquery.scrollTo.js" />
<c:url var="jquerynav" value="/js/jquery.nav.js" />
<c:url var="jquerylocalScroll" value="/js/jquery.localScroll.js" />
<c:url var="bootstrap" value="/js/bootstrap.js" />
<c:url var="jqueryprettyPhoto" value="/js/jquery.prettyPhoto.js" />
<c:url var="isotope" value="/js/isotope.js" />
<c:url var="jqueryflexslider" value="/js/jquery.flexslider.js" />
<c:url var="inview" value="/js/inview.js" />
<c:url var="animate" value="/js/animate.js" />
<c:url var="custom" value="/js/custom.js" />
<c:url var="contactformcontactform" value="/contactform/contactform.js" />


<link href="css/bootstrap-responsive.css" rel="stylesheet">



<link href="css/style.css" rel="stylesheet">

<link href="color/default.css" rel="stylesheet">

<link rel="shortcut icon" href="img/favicon.ico">

</head>

<body>
	<!-- navbar -->
	<div class="navbar-wrapper">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<!-- Responsive navbar -->
					<a class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse"><span class="icon-bar"></span><span
						class="icon-bar"></span><span class="icon-bar"></span> </a>
					<h1 class="brand">
						<a href="#about">AZUR TRIATHLON CAMP</a>
					</h1>
					<!-- navigation -->
					<nav class="pull-right nav-collapse collapse">
						<ul id="menu-main" class="nav">
							<li><a title="services" href="#services">Triathlon-Camps</a></li>
							<li><a title="team" href="#about">About</a></li>
							<li><a title="contact" href="#contact">Contact</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- Header area -->
	<div id="header-wrapper" class="header-slider">
		<header class="clearfix">
			<div class="logo">

				<STRONG><h1>Azur Triathlon Camp</h1></STRONG> <STRONG><h2>Triathlon
						Training and Sightseeing in one!</h2></STRONG> <br /> <br /> <br /> <br />
				<div class="container">
					<div class="row">
						<div class="span12">
							<div id="main-flexslider" class="flexslider">
								<ul class="slides">
									<li>

										<p class="home-slide-content">
											TOUR BEAUTIFUL <STRONG>FRANCE</STRONG>
										</p>


									</li>
									<li>

										<p class="home-slide-content">
											WORK OUT IN A <STRONG>TEAM</strong>
										</p>

									</li>
									<li>
										<p class="home-slide-content">
											CRUSH THE <STRONG>TRIATHLON</STRONG>
										</p>
									</li>
								</ul>
							</div>






							<!-- end slider -->
						</div>
					</div>
				</div>
		</header>
	</div>





	<!-- section: services -->
	<section id="services" class="section orange">
		<div class="container">
			<h4>Levels of Triathlon Camp Available</h4>
			<!-- Four columns -->
			<div class="row">
				<div class="span4 animated-fast flyIn">
					<div class="service-box">
						<img src="img/general/intro.jpg" alt="countryside" />
						<h2>Intro to Triathlon</h2>
						<p>This camp is for absolute beginners who want to get their
							feet wet and prepare for their first triathlon!</p>
					</div>
				</div>
				<div class="span4 animated flyIn">
					<div class="service-box">
						<img src="img/general/beginner.jpg" alt="countryside" />
						<h2>Beginners Triathlon</h2>
						<p>This camp is for triathletes who know the basics but want
							to expand their abilities!</p>
					</div>
				</div>
				<div class="span4 animated-fast flyIn">
					<div class="service-box">
						<img src="img/general/intermediate.jpg" alt="countryside" />
						<h2>Intermediate Triathlon</h2>
						<p>This camp is for people who are intermediate Triathletes
							and want to sharpen their skills!</p>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- end section: services -->



	<!-- section: team -->
	<section id="about" class="section">
		<div class="container">
			<h4>Who We Are</h4>
			<div class="row">
				<div class="span12 offset1">
					<div>

						<p>Naomi Azur and Melanie were both triathletes competing that
							spent a large amount of time in the off season training. They
							found that there were not a lot of triathlon training camps that
							blended training with seeing the world. After some discussion
							they decided to work together and supply the need!</p>
					</div>
				</div>






			</div>
			<div class="row">

				<div class="span5 offset1 flyIn">
					<div class="people">
						<img class="team-thumb img-circle" src="img/team/NaomiAzure.png"
							alt="" /> <br /> <br />
						<h3>Naomi Azur</h3>
						<p>Naomi has done multiple triathlons and enjoys doing them
							with a group of people in order to learn from and push each
							other. She enjoys spreading the enjoyment of triathlon and
							decided to start a triathlon camp with Melanie. Naomi started
							running with the purpose of weight loss and a healthy lifestyle.

							After a few months running through her work event she was able to
							get a bike to do a charity ride, that's when the love of biking
							started. "Each sport has its unique challenges, just like life""


							After discovering the sport of triathlon, there was no going
							back, she decided to learn how to swim and train for triathlon
							races! "Since training for triathlon, my life has changed in so
							many ways, all in an amazing way!" "From never running in my life
							to triathlon racing, it was a unique life changing moment" Now,
							Naomi passes the experience and knowledge to beginner triathletes
							who are aspiring to challenge themselves. She works with athletes
							of all ages and backgrounds to uncover their true potential in
							swimming, biking and running. Naomi and Melanie met during one of
							the running camps in Colorado and enjoyed the idea of beginner
							triathlon camp, and traveling while being active, and there "Azur
							Tri Camp" was born.</p>
					</div>
				</div>
				<div class="span5 flyIn">
					<div class="people">
						<img class="team-thumb img-circle"
							src="img/team/MelanieGulliver.jpg"
							alt="Very Fit woman holding bicycle" /> <br /> <br />
						<h3>Melanie Gulliver</h3>
						<p>Melanie Gulliver is a triple Triathlete competitor and owns
							a large beautiful property in the south of France that is the
							base camp of Azur Triathlon Training. Melanie is a trained as a
							chartered accountant in London and when she is not training she
							is usually advising on healthy eating for athletes, advising
							small businesses in financial decisions or giving motivational
							speeches.</p>

					</div>
				</div>

			</div>
		</div>
		<!-- /.container -->
	</section>
	<!-- end section: team -->


	<!-- section: contact -->
	<section id="contact" class="section green">
		<div class="container">
			<h4>Get in Touch</h4>
			<p>Email us and let us know which camp you are interested in and
				when a good time to call you is. Please include your full name,
				which level and date of camp that you are interested in, how many
				people, a phone number and an email address and what time of day is
				good to call.</p>
			<div class="blankdivider30"></div>
			<div class="row">
				<div class="span12">
					<div class="cform" id="contact-form">
						<div id="sendmessage">Your message has been sent. Thank you!</div>
						<div id="errormessage"></div>


						<form action="https://formspree.io/AzurTriCamp@gmail.com"
							method="post" class="contact form">

							<div class="row">
								<div class="span6">
									<div class="field your-name form-group">
										<!-- For some reason the form field validation is not working, so I wrote required="required" which is better than nothing -->

										<input type="text" name="name" class="form-control" id="name"
											required="required" placeholder="Your Name"
											data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
										<div class="validation"></div>
									</div>
									<div class="field your-email form-group">


										<input type="text" class="form-control" name="email"
											required="required" id="email" placeholder="Your Email"
											data-rule="email" data-msg="Please enter a valid email" />

										<div class="validation"></div>
									</div>

									<div class="field subject form-group">
										<input type="text" class="form-control" name="subject"
											required="required" id="subject" placeholder="Subject"
											data-rule="minlen:4"
											data-msg="Please enter at least 8 chars of subject" />
										<div class="validation"></div>
									</div>
								</div>


								<div class="span6">
									<div class="field message form-group">


										<textarea class="form-control" name="message" rows="5"
											required="required" data-rule="required"
											data-msg="Please write something for us"
											placeholder="Message"></textarea>

										<div class="validation"></div>
									</div>

									<input type="submit" value="Send message"
										class="btn btn-theme pull-left">
								</div>
							</div>

						</form>

					</div>
				</div>
				<!-- ./span12 -->
			</div>
		</div>
	</section>
	<footer>
		<div class="container">
			<div class="row">

				<p class="copyright">&copy; AzurTriCamp, All Rights Reserved.</p>
			</div>
		</div>
		</div>
		<!-- ./container -->
	</footer>
	<a href="#" class="scrollup"><i
		class="icon-angle-up icon-square icon-bgdark icon-2x"></i></a>


	<script src="${jquery}"></script>
	<script src="${jqueryscrollTo}"></script>
	<script src="${jquerynav}"></script>
	<script src="${jquerylocalScroll}"></script>
	<script src="${bootstrap}"></script>
	<script src="${jqueryprettyPhoto}"></script>
	<script src="${isotope}"></script>
	<script src="${jqueryflexslider}"></script>
	<script src="${inview}"></script>
	<script src="${animate}"></script>
	<script src="${custom}"></script>
	<script src="${contactformcontactform}"></script>


</body>

</html>
