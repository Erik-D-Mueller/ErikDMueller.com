<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


	<h2>
		<span class="toolListHeader">${currentUser.userName}'s Profile</span>
	</h2>
	
	<c:if test="${currentUser.role == 'LIBRARIAN'}">
		<p> ${currentUser.userName}'s role is a librarian.</p>
	</c:if>
	<c:if test="${currentUser.role == 'MEMBER'}">
		<p> ${currentUser.userName}'s role is a member.</p>
	</c:if>
	<c:forEach items="${listOfTools}" var="tool">
		<p>${tool.toolId}</p>
		<p>${tool.toolName}<p>
		<p>${tool.checkoutDate}<p>
		<p>${tool.returnDate}<p>
	</c:forEach>
			
<c:import url="/WEB-INF/jsp/footer.jsp" />