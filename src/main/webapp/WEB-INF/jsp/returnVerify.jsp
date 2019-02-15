<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h4>Confirm return:</h4>

<div>
	<c:url value="/returnConfirmation" var="formAction" />
	<form action="${formAction}" method="POST">

		<table class="table table-striped table-hover table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Tool Id</th>
					<th scope="col">Tool Name</th>
					<th scope="col">Checked Out To</th>
					<th scope="col">Tool Description</th>
					<th scope="col"></th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>${tool.toolId}</td>
					<td>${tool.toolName}</td>
					<td>${tool.memberName}</td>
					<td>${tool.toolDescription}</td>
					<td><button class="btn btn-danger" name="tool_id"
							value="${tool.toolId}">Confirm Return</button></td>
				</tr>
			</tbody>
		</table>

	</form>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />