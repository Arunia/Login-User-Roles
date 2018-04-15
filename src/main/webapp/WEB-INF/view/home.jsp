<!-- We need this for our logout button -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
	<title>luv2code Company Home Page</title>
</head>

<body>
	<h2>luv2code Company Home Page</h2>
	<hr>
	
	<p>
	Welcome to the luv2code company home page!
	</p>
	
	<hr>
	
	<!--  display user name(=user id) and role(=authorities) -->
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities"/>
	</p>
	
	<hr>
	
	<!-- Only show this section for the user with MANAGER role -->
	<security:authorize access="hasRole('MANAGER')">
		<!-- Add a link to point to /leaders ... this is for the managers -->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
			(Only for Manager peeps)
		</p>
	</security:authorize>
	
	<!-- Add a logout button -->
	<security:authorize access="hasRole('ADMIN')">
		<!-- Add a link to point to /systems ... this is for the admins -->
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems People</a>
			(Only for Admin peeps)
		</p>
	</security:authorize>	
	
	
	<hr>
	
	
	<form:form action="${pageContext.request.contextPath}/logout"
				method="POST">
		<input type="submit" value="Logout" />	
	</form:form>
	
	
</body>

</html>