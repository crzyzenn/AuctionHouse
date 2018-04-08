<%--
  Created by IntelliJ IDEA.
  User: Cryzenn
  Date: 4/8/2018
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Help.Connect, java.sql.*" %>

<%
    Class.forName("com.matisse.sql.MtDriver");
    Connection conn = DriverManager.getConnection("jdbc:mt://localhost/Auction");
    PreparedStatement stm = conn.prepareStatement("INSERT INTO imagetest values (?)")
    stm.setObject(1, );


%>
