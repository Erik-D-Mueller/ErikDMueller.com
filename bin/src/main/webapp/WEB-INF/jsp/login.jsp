<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>${user.name}</h1>
<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<c:url var="formAction" value="/login" />

		<form method="POST" action="${formAction}">
			<input type="hidden" name="destination" value="${param.destination}" />
			<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
			
			<div class="form-group">
				<label for="userName">User Name</label> 
				<input type="text" class="form-control" id="userName"  aria-describedby="emailHelp" name="userName" placeHolder="User Name"/>
			</div>
			
			<div class="form-group">
				<label for="password">Password</label> 
				<input type="password" class="form-control" id="password" name="password" placeHolder="Password"/>
			</div>
			
			<button type="submit" class="btn btn-primary">Login</button>
		</form>
		
	</div>
	<div class="col-sm-4"></div>
</div>

<c:if test="${loginFail==true}">
	<h1>You failed to log in</h1>
</c:if>
<c:import url="/WEB-INF/jsp/footer.jsp" />