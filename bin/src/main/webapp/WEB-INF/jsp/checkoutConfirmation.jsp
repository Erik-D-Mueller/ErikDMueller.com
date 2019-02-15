<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<div class="blueBox">
<h1>${memberName}, you have successfully checked out the following items: </h1>
<h3> Your confirmation number is ${confNum}</h3>
</div>

<div class="table-responsive" id="toolTable">
			<table class="table table-striped table-hover table-bordered">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Tool Id</th>
						<th scope="col">Tool Name</th>
						<th scope="col">Due Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reservations}" var="reservation">
						<tr>
							<td>${reservation.toolId}</td>
							<td>${reservation.toolName}</td>
							<td>${reservation.returnDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />