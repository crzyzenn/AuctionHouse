<%--
  Created by IntelliJ IDEA.
  User: Cryzenn
  Date: 4/8/2018
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Help.Connect" %>
<%
  Connect conn = new Connect();
  Statement stm = conn.getStatement();
  ResultSet rs = stm.executeQuery("SELECT * FROM users") ;
  while(rs.next()){
    out.println("Username = " + rs.getString(2) + ", Password = " + rs.getString(3));
  }
  conn.closeConnection();

%>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  Hello
  </body>
</html>
