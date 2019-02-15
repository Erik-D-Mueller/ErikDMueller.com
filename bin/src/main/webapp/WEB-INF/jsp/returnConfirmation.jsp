<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h1>${currentUser.userName}, you have successfully returned the following item: </h1>

<h2>${toolId}</h2>



<c:import url="/WEB-INF/jsp/footer.jsp" />