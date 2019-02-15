<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<h1>Welcome to the Tool Borrowing Library!</h1>


<div id="myCarousel" class="container">
  <h3>View some of the tools in our collection!</h3>  
  
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="false">
    <ol class="carousel-indicators">
   		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    	<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    	<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  	</ol>
    
    <div class="carousel-inner" role="listbox">
      <div class="carousel-item active">
        <img class="slidePic"  src="img/buzzsaw.png" alt="pic1">
        <div class="carousel-caption">
          <h3></h3>
        </div>
      </div>
      <div class="carousel-item">
        <img class="slidePic" src="img/hammer.jpg" alt="pic2">
        <div class="carousel-caption">
          <h3></h3>
        </div>
      </div>
      <div class="carousel-item">
        <img class="slidePic" src="img/PowerDrills.jpg" alt="pic3">
        <div class="carousel-caption">
          <h3></h3>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class="container">
<h1>About the company</h1>
<p>Founded in the Summer of 2018 with the mission to provide tools to the needy and also to pass our class we have been providing exceptional customer service for 2 weeks!</p>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />