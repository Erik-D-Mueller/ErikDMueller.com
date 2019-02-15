<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div class="noHeader" id="masterToolList">

	<h2>
		<span class="toolListHeader">List of All Members</span>
	</h2>

	<c:url value="/chooseMember" var="editCart" />
	<form action="${editCart}" method="GET">

		<div id="toolTable">
			<table class="table table-striped table-hover table-bordered">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Member ID</th>
						<th scope="col">Member Name</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${memberList}" var="member">
						<tr>
							<td>${member.memberId}</td>
							<td>${member.memberName}</td>
							<td><a href="${editCart}?memberId=${member.memberId}">
									<button type="button" class="btn btn-success">Select
										this member</button>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />