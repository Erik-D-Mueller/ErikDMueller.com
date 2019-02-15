<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="noHeader" id="masterToolList">
	
	<h2>
		<span class="toolListHeader">Tools available to check out:</span>
	</h2>

	<c:url value="/viewCart" var="formAction" />
	<form action="${formAction}" method="POST">

		<div class="table-responsive" id="toolTable">
			<table
				class="table table-striped table-hover table-bordered">
				<thead class="thead-dark">
				<c:choose>
					<c:when test="${member != null}">
						<tr>
						<th scope="col">Tool Id</th>
						<th scope="col">Tool Name</th>
						<th scope="col">Tool Description</th>
						<th>Click to add to cart</th>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
						<th scope="col">Tool Id</th>
						<th scope="col">Tool Name</th>
						<th scope="col">Tool Description</th>
						</tr>
					</c:otherwise>
				</c:choose>
					
				</thead>
				
				<tbody>
					<c:choose>
						<c:when test="${member != null}">
							<c:forEach items="${availableTools}" var="tool">
								<tr id="divIDNo${tool.toolId}">
									<td>${tool.toolId}</td>
									<td>${tool.toolName}</td>
									<td>${tool.toolDescription}</td>
									<td><button name="tool_id" class="btn btn-success" value="${tool.toolId}">Add To Cart</button></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${availableTools}" var="tool">
								<tr id="divIDNo${tool.toolId}">
									<td>${tool.toolId}</td>
									<td>${tool.toolName}</td>
									<td>${tool.toolDescription}</td>
								</tr>
							</c:forEach>						
						</c:otherwise>
					</c:choose>
				</tbody>
				
				
			</table>
		</div>

		<c:url value="/viewCart" var="formAction" />

	</form>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />