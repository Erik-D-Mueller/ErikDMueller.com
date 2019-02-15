<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>Search currently checked out tools:</h2>

<div class="blueBox">
<div id="newReviewForm">
	<c:url value="/toolHistory" var="formAction" />
	<form action="${formAction}" method="POST">

		<div id="searchString">
			<label for="searchString">Enter search terms here: </label> <input
				type="text" name="searchString" id="searchString">
		</div>
		<br>

		<c:if test="${charError==true}">
			<h4 class="error">${charErrorMsg}</h4>
		</c:if>

		<div id="searchTypeDropBox">
			<label for="searchType">Search By: </label> <select name="searchType">
				<option value="toolId">Tool Id #</option>
				<option value="memberName">Member Name</option>
				<option value="driversLicense">Driver's License</option>

			</select>
		</div>
<br>
		<div id="submitButtonDiv">
			<input id="formSubmitButton" type="submit" value="Search" class = "btn btn-success" />
		</div>
	</form>

</div>

</div>

<div id="toolTable">
	<table class="table table-striped table-hover table-bordered">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Individual Tool Id</th>
				<th scope="col">Tool Name</th>
				<th scope="col">Member Name</th>
				<th scope="col">Date Checked Out</th>
				<th scope="col">Date Expected Back</th>
			</tr>
		</thead>

		<tbody>
 			<c:forEach items="${reservations}" var="reservation">
				<tr>
					<td>${reservation.toolId}</td>
					<td>${reservation.toolName}</td>
					<td>${reservation.memberName}</td>
					<td>${reservation.checkoutDate}</td>
					<td>${reservation.returnDate}</td>
				</tr>
 			</c:forEach>
		</tbody>
	</table>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />