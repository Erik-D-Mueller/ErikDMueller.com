<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:if test="${member != null}">

	<h2>${member.memberName}'s cart currently contains:</h2>

	<c:url value="/removeItem" var="formAction" />
	<form action="${formAction}" method="POST">
		<div class="table-responsive">
			<c:if test="${shoppingCart != null}">
				<table class="table table-striped table-hover table-bordered">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Tool Id</th>
							<th scope="col">Tool Name</th>
							<th scope="col">Tool Description</th>
							<th scope="col"></th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${tools}" var="tool">
							<tr>
								<td>${tool.toolId}</td>
								<td>${tool.toolName}</td>
								<td>${tool.toolDescription}</td>
								<td><button class="btn btn-danger" name="tool_id"
										value="${tool.toolId}">Remove</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</form>

	<c:url value="/availableToolList" var="availableToolHref" />
	<div id="viewCartDiv1">
		<form action="${availableToolHref}" method="GET">
			<div id="submitButtonDiv">
				<input class="btn btn-primary" id="formSubmitButton" type="submit"
					value="Add more items to cart" />
			</div>
		</form>
	</div>
	<br>
	<br>
	<c:if
		test="${shoppingCart != null && shoppingCart.numberOfItemsInCart > 0}">
		<c:url value="/checkOut" var="formAction" />
		<form action="${formAction}" method="POST">
			<div id="submitButtonDiv">

				<a href="#" data-href="delete.php?id=23" data-toggle="modal"
					data-target="#confirm-delete"><button type="button"
						class="btn btn-success">Check Out</button></a>

				<div class="modal fade" id="confirm-delete" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">Confirm Checkout for
								${member.memberName}</div>
							<div class="modal-body">

								<table class="table table-striped table-hover table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col">Tool Id</th>
											<th scope="col">Tool Name</th>
											<th scope="col">Tool Description</th>

										</tr>
									</thead>

									<tbody>
										<c:forEach items="${tools}" var="tool">
											<tr>
												<td>${tool.toolId}</td>
												<td>${tool.toolName}</td>
												<td>${tool.toolDescription}</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
								<input class="btn btn-success" id="formSubmitButton"
									type="submit" value="Confirm Checkout" />

							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</c:if>

</c:if>

<c:if test="${member == null}">
	<h3>No Member Selected</h3>
</c:if>

<c:import url="/WEB-INF/jsp/footer.jsp" />