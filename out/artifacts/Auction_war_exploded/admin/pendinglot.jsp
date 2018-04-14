<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, Help.Connect" %>
<%@ page import="javax.xml.transform.Result" %>


<!-- Get existing auction items -->
<%
    Connect con = new Connect();
    try {
        Statement stm = con.getStatement();
        try (ResultSet rs = stm.executeQuery("SELECT * FROM all_auction_items WHERE auction_id = 0")) {

%>


<!-- Get the page layout -->
<jsp:include page="essentials.jsp"></jsp:include>

<%--Delete an auction item--%>
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
<ul class="breadcrumb">
    <li><a href="dashboard.jsp">Home</a></li>
    <li class="active"><a href="pendinglot.jsp">Pending Items</a></li>
</ul>
<div id = 'right-container' style = "overflow-y: scroll">


    <!-- Adding an new piece -->
    <a data-toggle="modal" href='#modal-id'><span style = 'color:white; cursor: pointer;' class = 'glyphicon glyphicon-plus-sign glyph'></span></a>
    <div class="modal fade" id="modal-id">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add new item</h4>
                </div>
                <div class="modal-body">
                    <!-- Form -->
                    <form action="functions.jsp" method="POST" id = 'updateData' class = 'form-group' enctype = "multipart/form-data">

                        <table class="table table-responsive" id = 'uploadDiv'>
                            <tbody>
                                <tr>
                                    <td>Seller's Name*</td>
                                    <td>
                                        <!--<input type="text" name = "" value = "">-->
                                        <div class="input-group">
                                            <input type="text" name="name" class="form-control" required="required" title="" value = "Auction House">
                                            <div class="input-group-addon">
                                                <span class="input-group-text"><i class="far fa-address-card"></i></span>
                                            </div>
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>Seller's Telephone Number (Primary)*</td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" name="pNumber" class="form-control" required="required" title="" value = "9852343256">
                                            <div class="input-group-addon">
                                                <span class="input-group-text"><span class = "fa fa-phone-square"></span></span>
                                            </div>
                                        </div>
                                    </td>

                                </tr>

                                <tr>
                                    <td>Seller's Telephone Number (Secondary)</td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number"  name="sNumber" class="form-control"  title="">
                                            <div class="input-group-addon">
                                                <span class="input-group-text"><span class = "fa fa-phone-square"></span></span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Address*</td>
                                    <td>
                                        <div class="input-group">
                                            <input type="text" name="address" class="form-control" required="required" title="">
                                            <div class="input-group-addon">
                                                <span class="input-group-text"><span class = "fa fa-building"></span></span>
                                            </div>
                                        </div>
                                    </td>
                                <tr>
                                    <td>Piece Title*</td>
                                    <td>
                                        <div class="input-group">
                                            <input type="text" name="piece_title" class="form-control" required="required" title="">
                                            <div class="input-group-addon">
                                                <span class="input-group-text"><span class = "fa fa-pencil-alt"></span></span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Period / Date*</td>
                                    <td>
                                        <div class="input-group">
                                            <input type="date" name="date" class="form-control" required="required" title="">
                                            <div class="input-group-addon">
                                                <span class="input-group-text"><span class = "fa fa-calendar-alt"></span></span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Artist(s)*</td>
                                    <td>
                                        <div class="input-group">
                                            <input type="text" name="artist" class="form-control" required="required" title="">
                                            <div class="input-group-addon">
                                                <span class="input-group-text"><span class = "fa fa-pencil-alt"></span></span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Category*</td>
                                    <td>
                                        <select name = "category" id = "category" class = "form-control">
                                            <option value = "Drawing">Drawing</option>
                                            <option value = "Painting">Paintings</option>
                                            <option value = "Photography">Photographic Images</option>
                                            <option value = "Sculpture">Sculptures</option>
                                            <option value = "Carving">Carvings</option>
                                        </select>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr class = 'new'>
                                    <td>Medium*</td>
                                    <td>
                                        <select name = 'medium' class = 'form-control'>
                                            <option value = 'Pencil'>Pencil</option>
                                            <option value = 'Ink'>Ink</option>
                                            <option value = 'Charcoal'>Charcoal</option>
                                            <option value = 'Other'>Other</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class = 'new'>
                                    <td>Type*</td>
                                    <td>
                                        <input type = 'radio' name = 'frame' value = 'Framed' checked> Framed<br>
                                        <input type = 'radio' name = 'frame' value = 'Not Framed'> Not Framed<br>
                                    </td>
                                </tr>
                                <tr class = 'new'>
                                    <td>Dimensions*</td>
                                    <td>
                                        <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height'>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Lot Description*</td>
                                    <td>
                                        <textarea name="description" id="desc" class="form-control" rows="10"></textarea>
                                    </td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td>Reserved Price*</td>
                                    <td>
                                        <div class="input-group">
                                            <input type="number" name="price" step="any" id="price" class="form-control" value="" required="required" placeholder = "$" title="">
                                            <div class="input-group-addon">
                                                <span class="input-group-text"><span class = "fa fa-dollar-sign"></span></span>
                                            </div>
                                        </div>

                                    </td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td>Image*</td>
                                    <td>
                                        <input type="file" name="image" class="form-control" value="" required="required" title="">
                                    </td>
                                    <td></td>
                                <tr>

                                </tbody>
                            </table>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </div>
            </form>
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
                <th><h4>Action</h4></th>
                <th></th>
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
                out.println("<td>");
            %>

            <button data-toggle='tooltip' data-placement = 'right' title = 'Delete' onclick = 'var a = confirm("Are you sure?"); if(a) window.location = "functions.jsp?delete&token=<%=rs.getString(2)%>";' class = 'btn btn-danger btn-sm'><span class = 'glyphicon glyphicon-remove'></span></button>
            <br>
            <!-- Button trigger modal -->
            <a data-toggle="modal" data-target="#modelId<%=b%>">
                <button class = "btn btn-success btn-sm" data-toggle="tooltip" data-placement = "right" title="Publish to catalog"><i class="fa fa-check-circle" aria-hidden="true"></i></button>
            </a>

            <!-- Modal -->
            <div class="modal fade" id="modelId<%=b%>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="modelTitleId">Publishing (<%out.println(rs.getString(4));%>)</h4>
                        </div>
                        <div class="modal-body">
                            <h4>Select the auction to publish to:</h4>
                            <br>
                            <form action="functions.jsp" method="POST">
                                <div class = 'input-group'>


                                <%
                                Connect connection = new Connect();
                                try{

                                   Statement s = connection.getStatement();
                                   ResultSet pl = s.executeQuery("SELECT * FROM auction");
                                   out.println("<select name='auction' class = 'form-control'>");
                                   while(pl.next()){
                                       %>

                                            <option value="<%=pl.getString(2)%>"><%out.println(pl.getString(3) + " based on the theme " + pl.getString(4) + " to be held on " + pl.getString(5));%></option>


                                        <%

                                   }
                                   out.println("</select>");
                                   connection.closeConnection();
                                }
                                catch (Exception e){
                                    connection.closeConnection();
                                    out.println(e.getMessage());
                                }

                                %>
                                    <input type="hidden" name = 'id' value="<%=item_lot_number%>">
                                </div>
                                <br><br>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" name = "publishItem" class="btn btn-primary">Publish</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>

            <br>
            <!-- Button trigger modal -->
            <a data-toggle="modal" data-target="#modelId<%=a%>">
                <button data-toggle="tooltip" data-placement="right" title="Edit"
                        class="btn btn-primary btn-sm editModal"><i class="glyphicon glyphicon-edit"
                                                                    aria-hidden="true"></i></button>
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
                            <!-- Form -->
                            <form action="update.jsp" method="POST" class='form-group' enctype="multipart/form-data">

                                <table class="table table-responsive" id='uploadDivModal'>
                                    <thead>

                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Piece title</td>
                                        <td>
                                            <input type="text" name="piece_title" class="form-control"
                                                   required="required" value="<%=piece_title%>">
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Production Year</td>
                                        <td>
                                            <input type="date" name="date" class="form-control" required="required"
                                                   value="<%=production_date%>">
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class='categoryClass'>
                                        <td>Category</td>
                                        <td>
                                            <select name="category" class="form-control categoryModal">
                                                <%
                                                    if (category.equals("Sculpture")) {
                                                        out.println("<option value = 'Sculpture' selected>Sculptures</option>");
                                                        out.println("<option value = 'Drawing'>Drawing</option>");
                                                        out.println("<option value = 'Painting'>Paintings</option>");
                                                        out.println("<option value = 'Photography'>Photographic Images</option>");
                                                        out.println("<option value = 'Carving'>Carvings</option>");

                                                    } else if (category.equals("Drawing")) {
                                                        out.println("<option value = 'Sculpture'>Sculptures</option>");
                                                        out.println("<option value = 'Drawing' selected>Drawing</option>");
                                                        out.println("<option value = 'Painting'>Paintings</option>");
                                                        out.println("<option value = 'Photography'>Photographic Images</option>");
                                                        out.println("<option value = 'Carving'>Carvings</option>");
                                                    } else if (category.equals("Painting")) {
                                                        out.println("<option value = 'Sculpture'>Sculptures</option>");
                                                        out.println("<option value = 'Drawing'>Drawing</option>");
                                                        out.println("<option value = 'Painting' selected>Paintings</option>");
                                                        out.println("<option value = 'Photography'>Photographic Images</option>");
                                                        out.println("<option value = 'Carving'>Carvings</option>");
                                                    } else if (category.equals("Photography")) {
                                                        out.println("<option value = 'Sculpture'>Sculptures</option>");
                                                        out.println("<option value = 'Drawing'>Drawing</option>");
                                                        out.println("<option value = 'Painting'>Paintings</option>");
                                                        out.println("<option value = 'Photography' selected>Photographic Images</option>");
                                                        out.println("<option value = 'Carving'>Carvings</option>");
                                                    } else if (category.equals("Carving")) {
                                                        out.println("<option value = 'Sculpture'>Sculptures</option>");
                                                        out.println("<option value = 'Drawing'>Drawing</option>");
                                                        out.println("<option value = 'Painting'>Paintings</option>");
                                                        out.println("<option value = 'Photography'>Photographic Images</option>");
                                                        out.println("<option value = 'Carving' selected>Carvings</option>");
                                                    }

                                                %>

                                            </select>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <%
                                        if (category.equals("Sculpture")) {
                                    %>
                                    <tr class='new'>
                                        <td>Medium</td>
                                        <td>
                                            <select name='medium' class='form-control medium'>
                                                <%
                                                    if (medium.equals("Bronze")) {
                                                        out.println("<option value = 'Bronze' selected>Bronze</option>");
                                                        out.println("<option value = 'Marble'>Marble</option>");
                                                        out.println("<option value = 'Pewter'>Pewter</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    } else if (medium.equals("Marble")) {
                                                        out.println("<option value = 'Bronze'>Bronze</option>");
                                                        out.println("<option value = 'Marble' selected>Marble</option>");
                                                        out.println("<option value = 'Pewter'>Pewter</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    } else if (medium.equals("Pewter")) {
                                                        out.println("<option value = 'Bronze'>Bronze</option>");
                                                        out.println("<option value = 'Marble'>Marble</option>");
                                                        out.println("<option value = 'Pewter' selected>Pewter</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    } else if (medium.equals("Other")) {
                                                        out.println("<option value = 'Bronze'>Bronze</option>");
                                                        out.println("<option value = 'Marble'>Marble</option>");
                                                        out.println("<option value = 'Pewter'>Pewter</option>");
                                                        out.println("<option value = 'Other' selected>Other</option>");
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Dimensions</td>
                                        <td>
                                            <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=dimensions%>'>
                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Approx. Weight (kg)</td>
                                        <td>
                                            <input type = 'number' name = 'weight' step = 'any' class = 'form-control' placeholder = 'Weight in KG'  value="<%=weight%>">
                                        </td>
                                    </tr>
                                    <%
                                    }

                                    else if(category.equals("Drawing")){
                                    %>
                                    <tr class = 'new'>
                                        <td>Medium</td>
                                        <td>
                                            <select name = 'medium' class = 'form-control medium'>
                                                <%
                                                    if(medium.equals("Pencil")){
                                                        out.println("<option value = 'Pencil' selected>Pencil</option>");
                                                        out.println("<option value = 'Ink'>Ink</option>");
                                                        out.println("<option value = 'Charcoal'>Charcoal</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Ink")) {
                                                        out.println("<option value = 'Pencil'>Pencil</option>");
                                                        out.println("<option value = 'Ink' selected>Ink</option>");
                                                        out.println("<option value = 'Charcoal'>Charcoal</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Charcoal")) {
                                                        out.println("<option value = 'Pencil'>Pencil</option>");
                                                        out.println("<option value = 'Ink'>Ink</option>");
                                                        out.println("<option value = 'Charcoal' selected>Charcoal</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Other")) {
                                                        out.println("<option value = 'Pencil'>Pencil</option>");
                                                        out.println("<option value = 'Ink'>Ink</option>");
                                                        out.println("<option value = 'Charcoal'>Charcoal</option>");
                                                        out.println("<option value = 'Other' selected>Other</option>");
                                                    }
                                                %>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Type</td>
                                        <td>
                                            <%
                                                if(frame.equals("Framed")){
                                                    out.println("<input type = 'radio' name = 'frame' value = 'Framed' checked> Framed<br>");
                                                    out.println("<input type = 'radio' name = 'frame' value = 'Not Framed'> Not Framed<br>");
                                                }
                                                else if(frame.equals("Not Framed")){
                                                    out.println("<input type = 'radio' name = 'frame' value = 'Framed'> Framed<br>");
                                                    out.println("<input type = 'radio' name = 'frame' value = 'Not Framed' checked> Not Framed<br>");
                                                }
                                            %>

                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Dimensions</td>
                                        <td>
                                            <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=dimensions%>'>
                                        </td>
                                    </tr>
                                    <%
                                    }


                                    else if(category.equals("Painting")){
                                    %>
                                    <tr class = 'new'>
                                        <td>Medium</td>
                                        <td>
                                            <select name = 'medium' class = 'form-control medium'>
                                                <%
                                                    if(medium.equals("Oil")){
                                                        out.println("<option value = 'Oil' selected>Oil</option>");
                                                        out.println("<option value = 'Acrylic'>Acrylic</option>");
                                                        out.println("<option value = 'Water Colour'>Water Colour</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Acrylic")) {
                                                        out.println("<option value = 'Oil'>Oil</option>");
                                                        out.println("<option value = 'Acrylic' selected>Acrylic</option>");
                                                        out.println("<option value = 'Water Colour'>Water Colour</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Water Colour")) {
                                                        out.println("<option value = 'Oil'>Oil</option>");
                                                        out.println("<option value = 'Acrylic'>Acrylic</option>");
                                                        out.println("<option value = 'Water Colour' selected>Water Colour</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Other")) {
                                                        out.println("<option value = 'Oil'>Oil</optionx>");
                                                        out.println("<option value = 'Acrylic'>Acrylic</option>");
                                                        out.println("<option value = 'Water Colour'>Water Colour</option>");
                                                        out.println("<option value = 'Other' selected>Other</option>");
                                                    }
                                                %>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Type</td>
                                        <td>
                                            <%
                                                if(frame.equals("Framed")){
                                                    out.println("<input type = 'radio' name = 'frame' value = 'Framed' checked> Framed<br>");
                                                    out.println("<input type = 'radio' name = 'frame' value = 'Not Framed'> Not Framed<br>");
                                                }
                                                else if(frame.equals("Not Framed")){
                                                    out.println("<input type = 'radio' name = 'frame' value = 'Framed'> Framed<br>");
                                                    out.println("<input type = 'radio' name = 'frame' value = 'Not Framed' checked> Not Framed<br>");
                                                }
                                            %>

                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Dimensions</td>
                                        <td>
                                            <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=dimensions%>'>
                                        </td>
                                    </tr>
                                    <%
                                    }

                                    else if(category.equals("Photography")){
                                    %>
                                    <tr class = 'new'>
                                        <td>Type of Image</td>
                                        <td>
                                            <select name = 'medium' class = 'form-control medium'>
                                                <%
                                                    if(medium.equals("Black and White")){
                                                        out.println("<option value = 'Black and White' selected>Black & White</option>");
                                                        out.println("<option value = 'Colour'>Colour</option>");
                                                    }
                                                    else if(medium.equals("Colour")){
                                                        out.println("<option value = 'Black and White'>Black & White</option>");
                                                        out.println("<option value = 'Colour' selected>Colour</option>");
                                                    }
                                                %>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Dimensions</td>
                                        <td>
                                            <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=dimensions%>'>
                                        </td>
                                    </tr>
                                    <%
                                    }
                                    else if(category.equals("Carving")){
                                    %>
                                    <tr class = 'new'>
                                        <td>Type of Image</td>
                                        <td>
                                            <select name = 'medium' class = 'form-control medium'>
                                                <%
                                                    if(medium.equals("Oak")){
                                                        out.println("<option value = 'Oak' selected>Oak</option>");
                                                        out.println("<option value = 'Beach'>Beach</option>");
                                                        out.println("<option value = 'Pine'>Pine</option>");
                                                        out.println("<option value = 'Willow'>Willow</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Beach")){
                                                        out.println("<option value = 'Oak'>Oak</option>");
                                                        out.println("<option value = 'Beach' selected>Beach</option>");
                                                        out.println("<option value = 'Pine'>Pine</option>");
                                                        out.println("<option value = 'Willow'>Willow</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Pine")){
                                                        out.println("<option value = 'Oak'>Oak</option>");
                                                        out.println("<option value = 'Beach'>Beach</option>");
                                                        out.println("<option value = 'Pine' selected>Pine</option>");
                                                        out.println("<option value = 'Willow'>Willow</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Willow")){
                                                        out.println("<option value = 'Oak'>Oak</option>");
                                                        out.println("<option value = 'Beach'>Beach</option>");
                                                        out.println("<option value = 'Pine'>Pine</option>");
                                                        out.println("<option value = 'Willow' selected>Willow</option>");
                                                        out.println("<option value = 'Other'>Other</option>");
                                                    }
                                                    else if(medium.equals("Other")){
                                                        out.println("<option value = 'Oak'>Oak</option>");
                                                        out.println("<option value = 'Beach'>Beach</option>");
                                                        out.println("<option value = 'Pine'>Pine</option>");
                                                        out.println("<option value = 'Willow'>Willow</option>");
                                                        out.println("<option value = 'Other' selected>Other</option>");
                                                    }
                                                %>

                                            </select>
                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Dimensions</td>
                                        <td>
                                            <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=dimensions%>'>
                                        </td>
                                    </tr>
                                    <tr class = 'new'>
                                        <td>Approx. Weight (kg)</td>
                                        <td>
                                            <input type = 'number' name = 'weight' step = 'any' class = 'form-control' placeholder = 'Weight in KG'  value="<%=weight%>">
                                        </td>
                                    </tr>
                                    <%
                                        }

                                    %>

                                    <tr>
                                        <td>Item Description</td>
                                        <td>
                                            <textarea name="description" id="desc" class="form-control" rows="10" ><%out.println(description);%></textarea>
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td>Price</td>
                                        <td>
                                            <input type="number" name="price" step="any" id="price" class="form-control" value="<%=price%>" required="required" placeholder = "$" title="">
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td>Image</td>
                                        <td>
                                            <input type="file" name="image" class="form-control" value="" required="required" title="">
                                        </td>
                                        <td></td>
                                    <tr>

                                    </tbody>
                                </table>
                                <!-- End of form -->
                        </div>
                        <div class="modal-footer">
                            <input type = "hidden" name = "item_lot_number" value = "<%=rs.getString(2)%>">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button name = "submit" class="btn btn-primary">Save</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <%
                        out.println("</td>");
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