<%@page import="sun.invoke.empty.Empty"%>
<%@ page import = "java.sql.*,Help.Connect" %>

<%
    if(request.getParameter("edit") != null){
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        Connect con = new Connect();
        Statement stm = con.getStatement();


        try {
            String query = "UPDATE client_requests SET piece_name = '" + name + "', description = '" + description + "' WHERE piece_name = '" + request.getParameter("old_name")+"'";
            out.println(query);
            stm.executeQuery(query);
            response.sendRedirect("pending.jsp?done");
            con.closeConnection();
        } catch (Exception e) {
            out.println(e.getMessage());
            response.sendRedirect("pending.jsp?done");
            con.closeConnection();
        }
    }
    else if(request.getParameter("editProfile") != null){


        String fname = request.getParameter("name");
        String surname = request.getParameter("surname");
        String address = request.getParameter("address");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String old_tel = request.getParameter("old_tel");

        Connect con = new Connect();
        Statement stm = con.getStatement();


        try {
            String query = "UPDATE clients SET fname = '" + fname + "', surname = '" + surname + "', address = '" +address + "', tel = '" +tel + "', email = '" + email + "' WHERE tel = '" + old_tel +"'";
            out.println(query);
            session.removeAttribute("tel");
            session.setAttribute("tel", request.getParameter("tel"));
            stm.executeQuery(query);

            response.sendRedirect("settings.jsp?done");
            con.closeConnection();
        } catch (Exception e) {
            out.println(e.getMessage());
            response.sendRedirect("settings.jsp?done");
            con.closeConnection();
        }
    }
    else {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String tel = session.getAttribute("tel").toString();

        Connect con = new Connect();
        Statement stm = con.getStatement();


        try {
            String query = "INSERT INTO client_requests (piece_name, description, request_by, declined) VALUES ('" + name + "', '" + description + "','" + tel + "', 'NA')";
            out.println(query);
            stm.executeQuery(query);
            response.sendRedirect("pending.jsp?requestDone");
            con.closeConnection();
        } catch (Exception e) {
            out.println(e.getMessage());
            response.sendRedirect("pending.jsp?requestDone");
            con.closeConnection();
        }
    }
%>

