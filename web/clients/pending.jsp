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
        String query = "SELECT *  FROM client_requests WHERE request_by = '" + session.getAttribute("tel")+ "'";
        ResultSet rs = stm.executeQuery(query);


%>


<jsp:include page="layout.jsp"></jsp:include>
<%
    if(request.getParameter("done") != null){
        out.println("<script>$.notify('Changes saved!.', {className:'success', autoHideDelay:3000, hideAnimation:'fadeOut'})</script>");
    }
    else if(request.getParameter("requestDone") != null){
        out.println("<script>$.notify('Your request has been sent. We will get back to you shortly!.', {className:'success', autoHideDelay:3000, hideAnimation:'fadeOut'})</script>");
    }
    else if(request.getParameter("deleted") != null){
        out.println("<script>$.notify('Sucessfully deleted!!.', {className:'success', autoHideDelay:3000, hideAnimation:'fadeOut'})</script>");

    }
    else if(request.getParameter("id") != null){
        Statement st = con.getStatement();
        st.executeQuery("DELETE FROM client_requests WHERE OID = " + request.getParameter("id"));

    }
%>

<h3>Pending Requests</h3>
<br>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Name</th>
            <th>Action</th>
		</tr>
	</thead>
	<tbody>
        <%
            int i = 0;
            int j = 0;
            while (rs.next()){
            i++;
            j--;
        %>
        <tr>
            <td><%out.println(rs.getString(2));%></td>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modelId<%=i%>">
                    <i class="fa fa-edit" aria-hidden="true"></i>
                </button>

                <!-- Modal -->
                <div class="modal fade" id="modelId<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="modelTitleId">Edit (<%out.println(rs.getString(2));%>)</h4>
                            </div>
                            <div class="modal-body">
                                <!--Editing form-->
                                <form action="formcontrol.jsp" method="POST">
                                    <table class="table" id = "registerForm">
                                        <tbody>
                                        <tr>
                                            <td>Name</td>
                                            <td>
                                                <input type = "hidden" name="old_name" value="<%=rs.getString(2)%>">
                                                <input type="text" name="name" class="form-control" placeholder="Name of the piece" required="required" value="<%=rs.getString(2)%>">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>Description</td>
                                            <td>
                                                <textarea name="description" class="form-control" rows="20" placeholder="Description of the piece" required><%out.println(rs.getString(3));%></textarea>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <br>

                                <!--End of editing form-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" name = "edit" class="btn btn-primary">Save</button>

                            </div>
                            </form>
                        </div>
                    </div>
                </div>


                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modelId<%=j%>">
                    <i class="fa fa-trash" aria-hidden="true"></i>
                </button>

                <!-- Modal -->
                <div class="modal fade" id="modelId<%=j%>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="modelTitleId">You are trying to delete (<%out.println(rs.getString(2));%>)</h4>
                            </div>
                            <div class="modal-body">
                                Are you sure ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                <a type="button" href = "pending.jsp?delete&id=<%out.println(rs.getString(1));%>" class="btn btn-primary">Yes</a>
                            </div>
                        </div>
                    </div>
                </div>
            </td>

        </tr>
        <%

            }
        %>
    </tbody>
</table>
<%


%>


</div>

<%
    con.closeConnection();
    } catch (Exception e) {
        response.sendRedirect("pending.jsp?deleted");
//        out.println(e.getMessage());
        con.closeConnection();
    }
%>