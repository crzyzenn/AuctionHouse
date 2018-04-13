<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, Help.Connect" %>
<%@ page import="javax.xml.transform.Result" %>


<!-- Get existing auction items -->
<%
    Connect con = new Connect();
    try {
        Statement stm = con.getStatement();
        try (ResultSet rs = stm.executeQuery("SELECT * FROM all_auction_items WHERE auction_id =" + request.getParameter("id"))) {

%>


<!-- Get the page layout -->
<jsp:include page="essentials.jsp"></jsp:include>
<ul class="breadcrumb">
    <li><a href="dashboard.jsp">Home</a></li>
    <li><a href="auction.jsp">Auctions</a></li>
    <li class="active"><a href="#">View Auction Items</a></li>
</ul>

<%--Delan auction item--%>
<%
    if (request.getParameter("deleted") != null) {
        out.println("<script>$.notify('Sucessfully deleted Lot: " + request.getParameter("deleted") + "', {className:'success', autoHideDelay:2000});</script>");
    } else if (request.getParameter("error") != null) {
        out.println("<script>$.notify('Failed to delete Lot: " + request.getParameter("error") + "', {className:'error', autoHideDelay:2000});</script>");
    }
%>
<%--End of Delete--%>


<%--Adding an auction item--%>
<%
    if (request.getParameter("added") != null && request.getParameter("added") == "") {
        out.println("<script>$.notify('Item has been added sucessfully', {className:'success', autoHideDelay:2000});</script>");
    } else if (request.getParameter("error") != null && request.getParameter("error") == "") {
        out.println("<script>$.notify('Item could not be added', {className:'error', autoHideDelay:2000});</script>");
    } else if (request.getParameter("updated") != null && request.getParameter("updated") == "") {
        out.println("<script>$.notify('Item has been updated sucessfully', {className:'success', autoHideDelay:2000});</script>");
    } else if (request.getParameter("published") != null && request.getParameter("published") == "") {
        out.println("<script>$.notify('Item has been published to the catalogue!', {className:'success', autoHideDelay:2000});</script>");
    }
%>
<%--End of add--%>
<%


%>
<div id = 'right-container' style = "overflow-y: scroll">
    <h3>All items in <%out.println(request.getParameter("name"));%>:</h3><br>

    <!-- View all the auction items available -->
    <div class="pre-scrollable">
        <table class="table table-hover">
            <thead>
            <tr>
                <!-- <th>S.N</th> -->
                <th><h4>Item Lot Number</h4></th>
                <th><h4>Piece Name</h4></th>
                <th><h4>Category</h4></th>
                <th><h4>Price ($)</h4></th>
            </tr>
            </thead>



            <tbody>


            <%
                int a = 0;
                int b = 0;
                while(rs.next()){
                    String item_lot_number = rs.getString(2);
                    String piece_title = rs.getString(5);
                    String production_date = rs.getString(6);
                    String artist_name = rs.getString(7);
                    String category = rs.getString(8);
                    String description = rs.getString(9);
                    String medium = rs.getString(10);
                    String frame = rs.getString(11);
                    String dimensions = rs.getString(12);
                    String price = rs.getString(13);
                    String item_image = rs.getString(14);
                    String weight = rs.getString(16);

                    a++;
                    b--;
                    out.println("<tr>");
                    // echo "<td><br>".$a++."</td>";
                    out.println("<td>");

                    out.println("<h5 id = 'item' style = 'cursor:pointer;' data-toggle='modal' href='#modal-id"+a+"'>");

                    out.println(rs.getString(2));

                    out.println("</h5>");
                    // End of modal head


                    // Modal body

                    out.println("<div class='modal fade' id='modal-id"+a+"'>"); %>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h2>Item Lot (<%=rs.getString(2)%>)</h2>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>Piece's Name</td>
                                <td><%=piece_title%></td>
                            </tr>
                            <tr>
                                <td>Production Year</td>
                                <td><%=production_date%></td>
                            </tr>
                            <tr>
                                <td>Category</td>
                                <td><%=category%></td>
                            </tr>
                            <tr>
                                <td>Medium</td>
                                <td><%=medium%></td>
                            </tr>
                            <tr>
                                <td>Type</td>
                                <td><%=frame%></td>
                            </tr>
                            <tr>
                                <td>Dimensions (Width x Height)</td>
                                <td><%=dimensions%></td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td><%=description%></td>
                            </tr>
                            <tr>
                                <td>Price ($)</td>
                                <td><%=price%></td>
                            </tr>
                            <tr>
                                <td>Weight (kg)</td>
                                <td><%=weight%></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><img src = "../Images/<%=item_image%>" style="width: 80%;"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
            </td>
            <%
                    out.println("<td>"+piece_title+"</td>");
                    out.println("<td>"+category+"</td>");
                    out.println("<td>"+price+"</td>");

                    out.println("</tr>");
                    }
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
        out.println(e.getMessage());
        con.closeConnection();
    }
%>