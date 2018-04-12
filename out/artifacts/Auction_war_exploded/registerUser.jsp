<%--
  Created by IntelliJ IDEA.
  User: Cryzenn
  Date: 4/11/2018
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import  ="java.sql.*, Help.Connect "%>

<%
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String address = request.getParameter("address");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String query = "INSERT INTO clients VALUES('" + name + "', '" + surname + "', '" + address + "', '" + tel + "', '" + email + "', '" + username + "', '" + password + "' )";


    Connect con = new Connect();
    try{
        Statement stm = con.getStatement();
        stm.executeQuery(query);
        response.sendRedirect("register.jsp?registered");
        con.closeConnection();
    }
    catch (Exception e){
        response.sendRedirect("register.jsp?registered");
        con.closeConnection();
    }


%>