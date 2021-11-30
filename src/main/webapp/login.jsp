<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<%@include file="partials/head.jsp"%>
	<title>Login</title>
</head>
<body>
<%@include file="partials/navbar.jsp"%>
<div class="container-fluid">
	<form method="POST">
		<div class="my-3 col-lg-3 mx-auto">
			<label for="inputUsername" class="form-label">Username</label>
			<input id="inputUsername" class="form-control" type="text" name="username">
		</div>
		<div class="mb-3 col-lg-3 mx-auto">
			<label for="inputPassword" class="form-label">Password</label>
			<input id="inputPassword" class="form-control" type="text" name="password"/>
		</div>
		<div class="mb-3 text-center">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
</div>



<% request.setAttribute("username", request.getParameter("username")); %>
<%--<p>Username: ${username}</p>--%>
<% request.setAttribute("password", request.getParameter("password")); %>
<%--<p>Password: ${password}</p>--%>

<c:choose>
	<c:when test="${username.equals('admin') && password.equals('password')}">
<%--		<div>Correct</div>--%>
<%--		<%response.sendRedirect("/profile.jsp");%>--%>
		<c:redirect url="profile.jsp"/>
	</c:when>
	<c:otherwise>
<%--		<c:redirect url="login.jsp"/>--%>
<%--		<div>Wrong</div>--%>
	</c:otherwise>
</c:choose>
<%@include file="partials/scripts.jsp"%>
</body>
</html>
