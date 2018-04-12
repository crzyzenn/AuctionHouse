<%@page import="sun.invoke.empty.Empty"%>
<%@ page import = "java.sql.*,Help.Connect" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connect con = new Connect();
    Statement stm = con.getStatement();



    try{
        ResultSet rs = stm.executeQuery("SELECT *  FROM support_users WHERE username = '" + username + "' AND password = '" + password + "'");

        // If no user is found
        if(rs.next()){
            // Set session for the admin
            session.setAttribute("support", username);
            session.setAttribute("type", rs.getString(8));
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

