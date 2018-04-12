
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Help.Connect" %>
<%@ page import="java.sql.*" %>


<jsp:include page="layout.jsp"></jsp:include>
    <h1>Welcome back, <%out.print(session.getAttribute("client"));%></h1>
</div>