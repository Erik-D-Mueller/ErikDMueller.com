<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<c:url var="jquery" value="/js/jquery.min.js" />
<script src="${jquery}"></script>
<c:url var="jqueryValidate" value="/js/jquery.validate.min.js" />
<script src="${jqueryValidate}"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<c:url var="cssHref" value="/css/styles.css" />
<link rel="stylesheet" type="text/css" href="${cssHref}">
<title>Tool Library</title>

<c:url value="/js" var="jsHref" />
<script src="${jsHref}/validation.js"></script>

</head>
<body>
	<header>
		<c:url var="homePageHref" value="/" />
		<c:url var="imgSrc" value="/img/PowerDrills.jpg" />
		<c:url var="TLLlogo" value="/img/TLLlogo.png" />
	</header>
	<div class="jumbotron jumbotron-billboard">
		<div class="img"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2 id="library-title">Tool Library</h2>
					<p>Please take a look at our collection of tools!</p>
				</div>
			</div>
		</div>
	</div>
	<c:url var="homePageHref" value="/" />
	<c:url var="toolSearchHref" value="/toolHistory" />
	<c:url var="toolMasterHref" value="/completeToolList" />
	<c:url var="availableToolHref" value="/availableToolList" />
	<c:url var="checkedOutToolsHref" value="/checkedOutTools" />
	<c:url var="viewCartHref" value="/viewCart" />
	<c:url var="memberListHref" value="/memberList" />
	<c:url var="returnToolHref" value="/returnTool" />
	<c:url var="newUserHref" value="/users/new" />
	<c:url var="logoutAction" value="/logout" />
	<c:url var="userProfile" value="/userProfile" />
	<c:url var="loginHref" value="/login" />


	<nav class="navbar navbar-expand-md navbar-light bg-light">
		<nav class="navbar navbar-light bg-light">
			<a class="navbar-brand" href="${homePageHref}"> <img
				src="${TLLlogo}" id="navbarLogo"
				class="d-inline-block align-top" alt="logo"> Tool Lending
				Library
			</a>
		</nav>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${homePageHref}">Home <span class="sr-only">(current)</span></a>
				</li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Tool Lists </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${availableToolHref}">Available
							Tools</a> <a class="dropdown-item" href="${toolMasterHref}">Tool
							Master List</a>

						<c:if test="${currentUser.role == 'LIBRARIAN'}">
							<a class="dropdown-item" href="${checkedOutToolsHref}">Checked
								Out Tools</a>
						</c:if>

					</div></li>
				<c:if test="${!empty currentUser}">
					<li class="nav-item"><a class="nav-link" href="${userProfile}">User
							Profile</a></li>
				</c:if>

				<c:if test="${currentUser.role == 'LIBRARIAN'}">

					<li class="nav-item"><a class="nav-link"
						href="${toolSearchHref}">Tool Search</a></li>

					<li class="nav-item"><a class="nav-link"
						href="${viewCartHref}">View Cart</a></li>

					<li class="nav-item"><a class="nav-link"
						href="${memberListHref}">Member List</a></li>

					<li class="nav-item"><a class="nav-link"
						href="${returnToolHref}">Return Tool</a></li>
				</c:if>
			</ul>
			<ul class="navbar-nav">
			<c:if test="${currentUser.role == 'LIBRARIAN'}">
				<li class="nav-item active"><a class="nav-link"
					href="${newUserHref}">Sign Up</a></li>
			</c:if>
				<c:choose>	
					<c:when test="${empty currentUser}">
						<li class="nav-item active" id="loginButton"><a
							class="nav-link" href="${loginHref}">Log In</a></li>
					</c:when>
					<c:otherwise>

						<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

						<li class="nav-item active"><a class="nav-link"
							id="logoutLink" href="${logoutAction}">Log Out</a></li>

					</c:otherwise>
				</c:choose>

			</ul>

		</div>
	</nav>

	<c:if test="${not empty currentUser}">
		<div id="currentUserHolder">
			<p id="currentUser">
				Current User: <span class="current"> ${currentUser.userName}</span>
			</p>
			<c:if test="${member != null}">
				<p id="member">
					Currently Serving:<span class="current"> ${member.memberName}</span>
				</p>
			</c:if>
		</div>

	</c:if>
	<div class="container">
	<div id="everything">