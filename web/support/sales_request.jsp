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
        String query = "SELECT *  FROM client_requests where  declined = 'NA'";
        ResultSet rs = stm.executeQuery(query);





%>


<jsp:include page="layout.jsp"></jsp:include>
<%
    if(request.getParameter("done") != null){
        out.println("<script>$.notify('Changes saved!.', {className:'success', autoHideDelay:3000, hideAnimation:'fadeOut'})</script>");
    }
    else if(request.getParameter("decline") != null){
        Statement st = con.getStatement();
        st.executeQuery("UPDATE client_requests SET declined = 'yes' WHERE OID = " + request.getParameter("id"));

    }
%>

<h3>Pending Requests</h3>
<br>

<table class="table table-hover">
    <thead>
    <tr>
        <th>Name</th>
        <th>Requested By</th>
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
        <td>
            <!-- Button trigger modal -->
            <p style = "cursor: pointer;" data-toggle="modal" data-target="#modelId<%=rs.getString(1)%>">
                <%out.println(rs.getString(2));%>
            </p>

            <!-- Modal -->
            <div class="modal fade" id="modelId<%=rs.getString(1)%>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="modelTitleId"><%out.println(rs.getString(2));%></h4>
                        </div>
                        <div class="modal-body">
                            <table class="table table-hover">
                            	<tbody>
                            		<tr>
                            			<td>Name</td>
                                        <td><%out.println(rs.getString(2));%></td>
                            		</tr>
                                    <tr>
                                        <td>Description</td>
                                        <td><%out.println(rs.getString(3));%></td>
                                    </tr>
                            	</tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save</button>
                        </div>
                    </div>
                </div>
            </div>


        </td>
        <td><%out.println(rs.getString(5));%></td>

        <td>
            <!--Approval modal-->
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modelId<%=i%>">
                <i class="fa fa-check-circle" aria-hidden="true"></i>
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
                            <h4 class="modal-title" id="modelTitleId">Approving (<%out.println(rs.getString(2));%>)</h4>
                        </div>
                        <div class="modal-body">
                            <!--Editing form-->
                            <form action="formcontrol.jsp" method="POST">
                                <table class="table" id="registerForm">
                                    <tbody>
                                    <tr>
                                        <td>Choose date of inspection</td>
                                        <td>
                                            <input type="hidden" name="old_name" value="<%=rs.getString(2)%>">
                                            <input type="date" name="approval_date" class="form-control" required>
                                        </td>

                                    </tr>
                                    </tbody>
                                </table>
                                <br>

                                <!--End of editing form-->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" name = "approve" class="btn btn-primary">Save</button>

                        </div>
                        </form>
                    </div>
                </div>
            </div>


            <!--Delete modal-->
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
                            <h4 class="modal-title" id="modelTitleId">You are trying to disapprove (<%out.println(rs.getString(2));%>)</h4>
                        </div>
                        <div class="modal-body">
                            This cannot be undone. Are you sure ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <a type="button" href = "sales_request.jsp?decline&id=<%out.println(rs.getString(1));%>" class="btn btn-primary">Yes</a>
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
        response.sendRedirect("sales_request.jsp?done");
        con.closeConnection();
    }
%>