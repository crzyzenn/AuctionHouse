<%--
  Created by IntelliJ IDEA.
  User: Cryzenn
  Date: 4/12/2018
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Help.Connect" %>
<%@ page import="java.sql.*" %>
<%

    Connect con = new Connect();
    Statement stm = con.getStatement();
    try {
        String query = "SELECT *  FROM client_requests";
        ResultSet rs = stm.executeQuery(query);
%>

<jsp:include page="layout.jsp"></jsp:include>
    <h3>Your notifications</h3>
    <br>
    <table class = 'formTable table-hover'>
        <tbody>
        <%
            while(rs.next()){
                if(rs.getString(6).equals("no")){
        %>
            <tr>
                <td style = "padding:2em"><span class="fa fa-check-circle"></span> Your request for <%out.println(rs.getString(2));%> has been accepted!<br>Item inspection has been scheduled on <%out.println(rs.getString(4));%></td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

<%
        con.closeConnection();
    }

    catch (Exception e1){
        con.closeConnection();
    }
%>