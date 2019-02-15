<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<script type="text/javascript"></script>

<h2>
	<span class="toolListHeader">Your Profile</span>
</h2>

<c:if test="${currentUser.role == 'LIBRARIAN'}">
	<p>You're logged in as a librarian.</p>
</c:if>
<c:if test="${currentUser.role == 'MEMBER'}">
	<p>You're logged in as a member.</p>
</c:if>
<br>

<div id="bothInputs">
	<div class="blueBox">
		<p>Would you like to change your password?</p>
		<c:url value="/changePassword" var="formAction" />

		<form:form method="POST" action="${formAction}"
			id="changePasswordForm" modelAttribute="updatePW">
			<div id="newPasswordFromJSP">
				<label for="password">Enter your new password: </label>
				<form:input path="password" type="password" id="password"
					name="password" />
				<form:errors path="password" cssClass="error" />
			</div>
			<br>
			<div class="form-group">
				<label for="confirmPassword">Confirm your new password:</label>
				<form:input type="password" path="confirmPassword"
					id="confirmPassword" name="confirmPassword"
					placeHolder="Re-Type Password" />
				<form:errors path="confirmPassword" cssClass="error" />
			</div>

			<input class="btn btn-success" id="formSubmitButton" type="submit"
				value="Change Password" />

		</form:form>

	</div>

	<br> <br>

	<div class="blueBox">
		<p>Your Driver's License is listed as
			"${currentUser.driversLicense}". Would you like to change it?</p>
		<c:url value="/changeDL" var="formAction" />
		<form:form method="POST" action="${formAction}" id="changeDL"
			modelAttribute="updateDL">
			<div>
				<label for="newDL">Enter Your New Driver's License: </label>
				<form:input type="text" path="newDL" name="newDL" id="newDL" />
				<form:errors path="newDL" cssClass="error" />
			</div>
			<div>
				<label for="confirmDL">Confirm Your New Driver's License:</label>
				<form:input type="text" path="confirmDL" name="confirmDL"
					id="confirmDL" />
				<form:errors path="confirmDL" cssClass="error" />
			</div>

			<br>
			<input class="btn btn-success" id="formSubmitButton" type="submit"
				value="Change Driver's License Number" />

		</form:form>

	</div>
</div>
<br>
<br>
<p>Below is a list of tools you have checked out</p>

<div class="table-responsive" id="toolTable">
	<table class="table table-striped table-hover table-bordered">
		<thead class="thead-dark">
			<c:if test="${currentUser != null}">
				<tr>
					<th scope="col">Tool Id</th>
					<th scope="col">Tool Name</th>
					<th scope="col">Date Borrowed</th>
					<th scope="col">Return By</th>
				</tr>
			</c:if>
		</thead>

		<tbody>
			<c:if test="${currentUser != null}">
				<c:forEach items="${listOfTools}" var="tool">
					<tr id="divIDNo${tool.toolId}">
						<td>${tool.toolId}</td>
						<td>${tool.toolName}</td>
						<td>${tool.checkoutDate}</td>
						<td>${tool.returnDate}</td>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />