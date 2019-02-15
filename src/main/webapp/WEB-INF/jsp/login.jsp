<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<c:url var="formAction" value="/doLogin" />

		<form:form method="POST" action="${formAction}" modelAttribute="login">
			<input type="hidden" name="destination" value="${param.destination}" />
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

			<div class="form-group">
				<label for="userName">User Name</label>
				<form:input type="text" path="userName" class="form-control"
					id="userName" name="userName" placeHolder="User Name" />
				<form:errors path="userName" cssClass="error" />
			</div>

			<div class="form-group">
				<label for="password">Password</label>
				<form:input type="password" path="password" class="form-control"
					id="password" name="password" placeHolder="Password" />
				<form:errors path="password" cssClass="error" />
			</div>
			
			<button type="submit" class="btn btn-primary" id="login-btn">Login</button>
		</form:form>
	</div>
	<div class="col-sm-4"></div>
</div>

<c:if test="${loginFail==true}">
	<div class="row" id="login-error">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<h7 class="error">&#9888 Your username or password doesn't match
			what we have on file. Try signing in again.</h7>
		</div>
		<div class="col-sm-4"></div>
	</div>
</c:if>
<c:import url="/WEB-INF/jsp/footer.jsp" />