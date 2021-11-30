<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! int counter = 0; %>
<% counter += 1; %>
<%! int visits = 0; %>
<%
	if (visits == 0) {
		request.setAttribute("hasUserBeenHere", false);
	} else {
		request.setAttribute("hasUserBeenHere", true);
	}

	visits++;
%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
	      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<title>Title</title>
</head>
<body>
<%@include file="partials/navbar.jsp" %>

<%
	if (request.getParameter("reset") != null && request.getParameter("reset").equals("true")) {
		counter = 0;
	}
%>

<h1>The current count is <%= counter %>.</h1>

<p>reset counter: ${param.reset}</p>

<c:choose>
	<c:when test="${hasUserBeenHere}">
		<h2>Welcome Back</h2>
	</c:when>
	<c:otherwise>
		<h2>Welcome</h2>
	</c:otherwise>
</c:choose>

View the page source!

<%-- this is a JSP comment, you will *not* see this in the html --%>

<!-- this is an HTML comment, you *will* see this in the html -->
<%@include file="partials/scripts.jsp" %>
</body>
</html>