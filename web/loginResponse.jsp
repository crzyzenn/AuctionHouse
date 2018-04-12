<%@page import="sun.invoke.empty.Empty"%>
<%@ page import = "java.sql.*,Help.Connect" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connect con = new Connect();
    Statement stm = con.getStatement();



    try{
        ResultSet rs = stm.executeQuery("SELECT *  FROM clients WHERE client_username = '" + username + "' AND client_password = '" + password + "'");

        // If no user is found
        if(rs.next()){
            // Set session for the admin
            session.setAttribute("client", username);
            session.setAttribute("tel", rs.getString(5));
        }
        else{
            out.print("No");
        }
        con.closeConnection();
    }
    catch(Exception e){
        System.out.println(e.getMessage());
        con.closeConnection();
    }
%>

