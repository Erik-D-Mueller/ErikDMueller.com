<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="formAction" value="/users" />
<form:form method="POST" action="${formAction}" id="newUserForm"
	modelAttribute="registration">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<div class="row" id="newUserForm">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="userName">User Name</label>
				<form:input type="text" path="userName" id="userName"
					name="userName" placeHolder="User Name" class="form-control" />
				<form:errors path="userName" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="driversLicense">Drivers License</label>
				<form:input type="text" path="driversLicense" id="driversLicense"
					name="driversLicense" placeHolder="Drivers License"
					class="form-control" />
				<form:errors path="driversLicense" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<form:input type="password" path="password" id="password"
					name="password" placeHolder="Password" class="form-control" />
				<form:errors path="password" cssClass="error" />
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password</label>
				<form:input type="password" path="confirmPassword"
					id="confirmPassword" name="confirmPassword"
					placeHolder="Re-Type Password" class="form-control" />
				<form:errors path="confirmPassword" cssClass="error" />
			</div>

			<div class="form-group">
				<div id="roleDropBox">
					<label for="role">Role: </label>
					<form:select name="role" path="role">
						<form:option value="MEMBER">Member</form:option>
						<form:option value="LIBRARIAN">Librarian</form:option>
					</form:select>
					<form:errors path="role" cssClass="error" />
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Create User</button>
		</div>
		<div class="col-sm-4"></div>
	</div>
</form:form>

<c:import url="/WEB-INF/jsp/footer.jsp" />