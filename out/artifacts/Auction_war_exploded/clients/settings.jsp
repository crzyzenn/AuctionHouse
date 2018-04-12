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

    Connect c = new Connect();
    Statement stm = c.getStatement();

    try{

        ResultSet rs = stm.executeQuery("SELECT *  FROM clients WHERE tel = '" + session.getAttribute("tel") + "'");
%>

<jsp:include page="layout.jsp"></jsp:include>
<%
    if(request.getParameter("done") != null){
        out.println("<script>$.notify('Changes saved!.', {className:'success', autoHideDelay:3000, hideAnimation:'fadeOut'})</script>");
    }

%>



<h3>Edit profile info</h3>
<br>


<form action="formcontrol.jsp" method = "POST">
    <table class="formTable" id = "registerForm">
        <thead>
        </thead>
        <tbody>
        <%
            while(rs.next()){

        %>
            <tr>
                <td>First Name</td>
                <td>
                    <input type="text" name="name" class="form-control" required="required" value = "<%=rs.getString(2)%>">
                </td>

            </tr>
            <tr>
                <td>Surname</td>
                <td>
                    <input type="text" name="surname" class="form-control" required="required" title="" value = "<%=rs.getString(3)%>">
                </td>

            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <input type="text" name="address" class="form-control" required="required" title="" value = "<%=rs.getString(4)%>">
                </td>

            </tr>
            <tr>
                <td>Telephone Number</td>
                <td>
                    <input type="number" name="tel" class="form-control" required="required" title="" value = "<%=rs.getString(5)%>">
                    <input type = "hidden" name = "old_tel" value="<%=rs.getString(5)%>">
                </td>

            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <div class="input-group">
                        <input type="email" name="email" class="form-control" required="required" title="" value = "<%=rs.getString(6)%>">
                        <div class="input-group-addon">
                            <span class="input-group-text">@example.com</span>
                        </div>
                    </div>
                </td>

            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <br>
    <button type="submit" name = "editProfile" class = "btn btn-primary form-control">Save</button>
</form>
</div>

<%
        c.closeConnection();
    }
    catch (Exception e1){
        c.closeConnection();
    }
%>