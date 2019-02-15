<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>Please enter the tool being returned:</h1>


<div>
	<c:url value="/returnConfirmation" var="formAction" />
	<form action="${formAction}" method="POST">

		<div>
			<label for="returnTool" id="toolId"> Tool Id: </label> 
			<input type="text" name="toolId" id="toolId" required>
		</div>

		<div>
			<input id="formSubmitButton" type="submit" value="Submit" />
		</div>
	</form>

</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />