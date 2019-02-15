<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="blueBox">
	<h4>Please enter the tool id number to return:</h4>
	<br>

	<div>
		<c:url value="/returnVerify" var="formAction" />
		<form action="${formAction}" method="POST" id="returnTool">

			<div>
				<label for="returnTool" id="toolId"> Tool Id: </label> <input
					type="text" name="toolId" id="toolId" required>
			</div>

			<div>
				<br> <input id="formSubmitButton" type="submit" value="Submit"
					class="btn btn-success" />
			</div>

		</form>
	</div>

	<div>${toolReturnError}</div>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />