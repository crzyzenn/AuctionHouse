<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, Help.Connect" %>







<!-- Get the page layout -->
<jsp:include page="essentials.jsp"></jsp:include>

<%--Delete an auction item--%>
<%
    if (request.getParameter("deleted") != null) {
        out.println("<script>$.notify('Sucessfully deleted Auction: " + request.getParameter("deleted") + "', {className:'success', autoHideDelay:2000});</script>");
    } else if (request.getParameter("error") != null) {
        out.println("<script>$.notify('Failed to delete Lot: " + request.getParameter("error") + "', {className:'error', autoHideDelay:2000});</script>");
    }
%>
<%--End of Delete--%>


<%--Adding an auction item--%>
<%
    if (request.getParameter("added") != null && request.getParameter("added") == "") {
        out.println("<script>$.notify('Auction has been added sucessfully', {className:'success', autoHideDelay:2000});</script>");
    } else if (request.getParameter("error") != null && request.getParameter("error") == "") {
        out.println("<script>$.notify('Item could not be added', {className:'error', autoHideDelay:2000});</script>");
    } else if (request.getParameter("updated") != null && request.getParameter("updated") == "") {
        out.println("<script>$.notify('Auction has been updated sucessfully', {className:'success', autoHideDelay:2000});</script>");
    }
%>
<%--End of add--%>
<%


%>
<ul class="breadcrumb">
    <li><a href="dashboard.jsp">Home</a></li>
    <li class="active"><a href="auction.jsp">Auctions</a></li>
</ul>
<div id = 'right-container'>


    <!-- Adding an item -->
    <a data-toggle="modal" href='#modal-id'><span style = 'color:white; cursor: pointer;' class = 'glyphicon glyphicon-plus-sign glyph'></span></a>
    <div class="modal fade" id="modal-id">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add Auction</h4>
                </div>
                <div class="modal-body">
                    <!-- Form -->
                    <form action="functions.jsp" method="POST" class = 'form-group'>

                        <table class="table table-responsive" id = 'uploadDiv'>

                            <tbody>
                            <tr>
                                <td>Auction Title</td>
                                <td>
                                    <input type="text" name="name" placeholder="Name of the auction" class="form-control" required="required" title="">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Auction Date</td>
                                <td>
                                    <input type="date" name="date" class="form-control" required="required" title="">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Auction Time</td>
                                <td>
                                    <input type="text" name="time" placeholder="What time?" class="form-control" required="required" title="">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Auction Theme</td>
                                <td>
                                    <select name = "theme"  class = "form-control">
                                        <option value = "Drawing">Drawing</option>
                                        <option value = "Painting">Paintings</option>
                                        <option value = "Photography">Photographic Images</option>
                                        <option value = "Sculpture">Sculptures</option>
                                        <option value = "Carving">Carvings</option>
                                    </select>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Auction Venue</td>
                                <td>
                                    <input type="text" name="venue" placeholder="Auction is held at?" class="form-control" required="required" title="">
                                </td>
                                <td></td>
                            </tr>


                            </tbody>
                        </table>

                        <!-- End of form -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" name = "addAuction" class="btn btn-primary">Save changes</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End of adding an item -->

    <form class="form-inline pull-right" method = "POST">
        <div class="form-group">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" id = 'search' name = 'search'>
                <div class="input-group-addon">
                    <select class = 'filterBy'>
                        <option value = 'All'>Filter By</option>
                        <option value = 'Category'>Category</option>
                        <option value = 'Artist'>Artist</option>


                    </select>
                    <!--<a class='link'><span class = 'glyphicon glyphicon-search' style = 'cursor: pointer;'></span></a>-->
                </div>
            </div>
        </div>

    </form>




    <hr>


    <%
//        <!-- Get existing auction items -->
        Connect con = new Connect();
        try {
        Statement stm = con.getStatement();
        ResultSet rs = stm.executeQuery("SELECT *  FROM auction");

    %>
    <!-- View all the auctions available -->
    <div class="pre-scrollable">
        <table class="table table-hover">
            <thead>
            <tr>
                <th><h4>Auction Title</h4></th>
                <th><h4>Theme</h4></th>
                <th><h4>Date</h4></th>
                <th><h4>Venue</h4></th>
                <th><h4>Action</h4></th>
            </tr>
            </thead>
            <tbody>
            <%
                int a = 0;
                int j = 0;
                while(rs.next()){
                    a++;
                    j--;
                    out.println("<tr>");
                    // echo "<td><br>".$a++."</td>";
                    // Price
                    out.println("<td><a class = 'h4' href = 'displayItems.jsp?id=" + rs.getString(2) + "&name="  + rs.getString(3)+ " '>"+rs.getString(3)+"</a></td>");
                    out.println("<td>"+rs.getString(4)+"</td>");
                    out.println("<td>"+rs.getString(5)+"</td>");
                    out.println("<td>"+rs.getString(6)+"</td>");

                    out.println("<td>");
            %>

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
                            <h4 class="modal-title" id="modelTitleId">You are trying to delete (<%out.println(rs.getString(3));%>)</h4>
                        </div>
                        <div class="modal-body">
                            This cannot be undone. Are you sure ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <a type="button" href = "functions.jsp?deleteAuction&id=<%out.println(rs.getString(2));%>" class="btn btn-primary">Yes</a>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <!-- Button trigger modal -->
            <a data-toggle="modal" data-target="#modelId<%=a%>">
                <button data-toggle="tooltip" data-placement = "right" title="Edit" class = "btn btn-primary editModal"><i class="glyphicon glyphicon-edit" aria-hidden="true"></i></button>
            </a>

            <!-- Modal -->
            <div class="modal fade" id="modelId<%=a%>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="modelTitleId">Item Lot (<%out.println(rs.getString(2));%>)</h4>
                        </div>
                        <div class="modal-body">
                            <form action="functions.jsp" method="POST" class = 'form-group'>

                                <table class="table table-responsive">

                                    <tbody>
                                    <tr>
                                        <td>Auction Title</td>
                                        <td>
                                            <input type="text" name="name" placeholder="Name of the auction" class="form-control" required="required" title="" value = "<%=rs.getString(3)%>">
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Auction Date</td>
                                        <td>
                                            <input type="date" name="date" class="form-control" required="required" title="" value="<%=rs.getString(5)%>">
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Auction Time</td>
                                        <td>
                                            <input type="text" name="time" placeholder="What time?" class="form-control" required="required" title="" value="<%=rs.getString(7)%>">
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Auction Theme</td>
                                        <td>
                                            <select name = "theme"  class = "form-control">
                                                <option value = "Drawing">Drawing</option>
                                                <option value = "Painting">Paintings</option>
                                                <option value = "Photography">Photographic Images</option>
                                                <option value = "Sculpture">Sculptures</option>
                                                <option value = "Carving">Carvings</option>
                                            </select>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Auction Venue</td>
                                        <td>
                                            <input type="text" name="venue" placeholder="Auction is held at?" class="form-control" required="required" title="" value="<%=rs.getString(6)%>">
                                        </td>
                                        <td></td>
                                    </tr>


                                    </tbody>
                                </table>

                        </div>
                        <div class="modal-footer">
                            <input type = "hidden" name = "id" value = "<%=rs.getString(2)%>">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type = "submit" name = "updateAuction" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
            <%
                        out.println("</td>");
                        out.println("</tr>");
                    }


            %>
            </tbody>
        </table>


    </div>
</div>
<%
    con.closeConnection();
    }
    catch(Exception e){
    con.closeConnection();
    }
%>