<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="essentials.jsp"></jsp:include>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Dashboard</title>
</head>
<%
	if(request.getParameter("logout") != null){
		session.invalidate();
		response.sendRedirect("index.jsp");
	}

%>


<body>

<form action = "dashboard.jsp" method = "GET">
	<input type = "hidden" name = "logout" value = "logout">
	<button type = "submit" class = "btn btn-lg btn-primary">Logout</button>
</form>
</body>
</html>