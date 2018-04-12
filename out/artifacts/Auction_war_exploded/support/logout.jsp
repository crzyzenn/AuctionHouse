<%--
  Created by IntelliJ IDEA.
  User: Cryzenn
  Date: 4/12/2018
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("logout") != null){
        session.removeAttribute("support");
        response.sendRedirect("index.jsp");
    }
%>
