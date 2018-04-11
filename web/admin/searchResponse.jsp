<%--
  Created by IntelliJ IDEA.
  User: Cryzenn
  Date: 4/10/2018
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import =" java.sql.*, Help.Connect, java.lang.String"%>

<%

    Connect c = new Connect();
    ResultSet rs = null;
    try {
        String searchText = request.getParameter("search");
        String filterBy = request.getParameter("filter");
        String query = "";

        Statement stm = c.getStatement();
        if (filterBy.equals("Artist")) {
            query = "SELECT *  from auction_items where LOWER(artist_name) like LOWER('" + searchText + "%')";
        } else if (filterBy.equals("Category")) {
            query = "SELECT *  from auction_items where LOWER(category) like LOWER('" + searchText + "%')";
        } else {
            query = "SELECT *  from auction_items where LOWER(artist_name) like LOWER('" + searchText + "%')";
        }

        rs = stm.executeQuery(query);
    }
    catch(Exception e1){
        c.closeConnection();
    }
        %>
<table class="table table-hover">
    <thead>
    <tr>
        <!-- <th>S.N</th> -->
        <th><h4>Item Lot Number</h4></th>
        <th><h4>Artist</h4></th>
        <th><h4>Category</h4></th>
        <th><h4>Estimated Price ($)</h4></th>
        <th><h4>Action</h4></th>
        <th></th>
    </tr>
    </thead>



    <tbody>
    <%
    int a = 0;
    while(rs.next()){
        a++;
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
                    <td>Artist's Name</td>
                    <td><%=rs.getString(3)%></td>
                </tr>
                <tr>
                    <td>Production Year</td>
                    <td><%=rs.getString(4)%></td>
                </tr>
                <tr>
                    <td>Category</td>
                    <td><%=rs.getString(5)%></td>
                </tr>
                <tr>
                    <td>Medium</td>
                    <td><%=rs.getString(6)%></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td><%=rs.getString(7)%></td>
                </tr>
                <tr>
                    <td>Dimensions (Width x Height)</td>
                    <td><%=rs.getString(8)%></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><%=rs.getString(9)%></td>
                </tr>
                <tr>
                    <td>Price ($)</td>
                    <td><%=rs.getString(10)%></td>
                </tr>
                <tr>
                    <td>Weight (kg)</td>
                    <td><%=rs.getString(12)%></td>
                </tr>
                <tr>
                    <td></td>
                    <td><img src = "../Images/<%=rs.getString(11)%>" style="width: 80%;"></td>
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
    // Price
    out.println("<td>"+rs.getString(3)+"</td>");
    out.println("<td>"+rs.getString(5)+"</td>");
    out.println("<td>"+rs.getString(10)+"</td>");

    out.println("<td>");
%>

<button data-toggle='tooltip' data-placement = 'right' title = 'Delete' onclick = 'var a = confirm("Are you sure?"); if(a) window.location = "functions.jsp?delete&token=<%=rs.getString(2)%>";' class = 'btn btn-danger btn-sm'><span class = 'glyphicon glyphicon-remove'></span></button>
<br>
<!-- Button trigger modal -->
<a data-toggle="modal" data-target="#modelId<%=a%>">
    <button data-toggle="tooltip" data-placement = "right" title="Edit" class = "btn btn-primary btn-sm editModal"><i class="glyphicon glyphicon-edit" aria-hidden="true"></i></button>
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
                <form action="update.jsp" method="POST" class = 'form-group updateForm' enctype = "multipart/form-data">

                    <table class="table table-responsive" id = 'uploadDivModal'>
                        <thead>

                        </thead>
                        <tbody>
                        <tr>
                            <td>Name of the artist</td>
                            <td>
                                <input type="text" name="name" class="form-control" required="required" value = "<%=rs.getString(3)%>">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Production Year</td>
                            <td>
                                <input type="date" name="date" class="form-control" required="required" value = "<%=rs.getString(4)%>">
                            </td>
                            <td></td>
                        </tr>
                        <tr class = 'categoryClass'>
                            <td>Category</td>
                            <td>
                                <select name = "category" class = "form-control categoryModal">
                                    <%
                                        if (rs.getString(5).equals("Sculpture")){
                                            out.println("<option value = 'Sculpture' selected>Sculptures</option>");
                                            out.println("<option value = 'Drawing'>Drawing</option>");
                                            out.println("<option value = 'Painting'>Paintings</option>");
                                            out.println("<option value = 'Photography'>Photographic Images</option>");
                                            out.println("<option value = 'Carving'>Carvings</option>");

                                        }
                                        else if (rs.getString(5).equals("Drawing")){
                                            out.println("<option value = 'Sculpture'>Sculptures</option>");
                                            out.println("<option value = 'Drawing' selected>Drawing</option>");
                                            out.println("<option value = 'Painting'>Paintings</option>");
                                            out.println("<option value = 'Photography'>Photographic Images</option>");
                                            out.println("<option value = 'Carving'>Carvings</option>");
                                        }
                                        else if (rs.getString(5).equals("Painting")){
                                            out.println("<option value = 'Sculpture'>Sculptures</option>");
                                            out.println("<option value = 'Drawing'>Drawing</option>");
                                            out.println("<option value = 'Painting' selected>Paintings</option>");
                                            out.println("<option value = 'Photography'>Photographic Images</option>");
                                            out.println("<option value = 'Carving'>Carvings</option>");
                                        }
                                        else if (rs.getString(5).equals("Photography")){
                                            out.println("<option value = 'Sculpture'>Sculptures</option>");
                                            out.println("<option value = 'Drawing'>Drawing</option>");
                                            out.println("<option value = 'Painting'>Paintings</option>");
                                            out.println("<option value = 'Photography' selected>Photographic Images</option>");
                                            out.println("<option value = 'Carving'>Carvings</option>");
                                        }
                                        else if (rs.getString(5).equals("Carving")){
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
                            if(rs.getString(5).equals("Sculpture")){
                        %>
                        <tr class = 'new'>
                            <td>Medium</td>
                            <td>
                                <select name = 'medium' class = 'form-control medium'>
                                    <%
                                        if(rs.getString(6).equals("Bronze")){
                                            out.println("<option value = 'Bronze' selected>Bronze</option>");
                                            out.println("<option value = 'Marble'>Marble</option>");
                                            out.println("<option value = 'Pewter'>Pewter</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Marble")) {
                                            out.println("<option value = 'Bronze'>Bronze</option>");
                                            out.println("<option value = 'Marble' selected>Marble</option>");
                                            out.println("<option value = 'Pewter'>Pewter</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Pewter")) {
                                            out.println("<option value = 'Bronze'>Bronze</option>");
                                            out.println("<option value = 'Marble'>Marble</option>");
                                            out.println("<option value = 'Pewter' selected>Pewter</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Other")) {
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
                                <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=rs.getString(8)%>'>
                            </td>
                        </tr>
                        <tr class = 'new'>
                            <td>Approx. Weight (kg)</td>
                            <td>
                                <input type = 'number' name = 'weight' step = 'any' class = 'form-control' placeholder = 'Weight in KG'  value="<%=rs.getString(12)%>">
                            </td>
                        </tr>
                        <%
                        }

                        else if(rs.getString(5).equals("Drawing")){
                        %>
                        <tr class = 'new'>
                            <td>Medium</td>
                            <td>
                                <select name = 'medium' class = 'form-control medium'>
                                    <%
                                        if(rs.getString(6).equals("Pencil")){
                                            out.println("<option value = 'Pencil' selected>Pencil</option>");
                                            out.println("<option value = 'Ink'>Ink</option>");
                                            out.println("<option value = 'Charcoal'>Charcoal</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Ink")) {
                                            out.println("<option value = 'Pencil'>Pencil</option>");
                                            out.println("<option value = 'Ink' selected>Ink</option>");
                                            out.println("<option value = 'Charcoal'>Charcoal</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Charcoal")) {
                                            out.println("<option value = 'Pencil'>Pencil</option>");
                                            out.println("<option value = 'Ink'>Ink</option>");
                                            out.println("<option value = 'Charcoal' selected>Charcoal</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Other")) {
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
                                    if(rs.getString(7).equals("Framed")){
                                        out.println("<input type = 'radio' name = 'frame' value = 'Framed' checked> Framed<br>");
                                        out.println("<input type = 'radio' name = 'frame' value = 'Not Framed'> Not Framed<br>");
                                    }
                                    else if(rs.getString(7).equals("Not Framed")){
                                        out.println("<input type = 'radio' name = 'frame' value = 'Framed'> Framed<br>");
                                        out.println("<input type = 'radio' name = 'frame' value = 'Not Framed' checked> Not Framed<br>");
                                    }
                                %>

                            </td>
                        </tr>
                        <tr class = 'new'>
                            <td>Dimensions</td>
                            <td>
                                <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=rs.getString(8)%>'>
                            </td>
                        </tr>
                        <%
                        }


                        else if(rs.getString(5).equals("Painting")){
                        %>
                        <tr class = 'new'>
                            <td>Medium</td>
                            <td>
                                <select name = 'medium' class = 'form-control medium'>
                                    <%
                                        if(rs.getString(6).equals("Oil")){
                                            out.println("<option value = 'Oil' selected>Oil</option>");
                                            out.println("<option value = 'Acrylic'>Acrylic</option>");
                                            out.println("<option value = 'Water Colour'>Water Colour</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Acrylic")) {
                                            out.println("<option value = 'Oil'>Oil</option>");
                                            out.println("<option value = 'Acrylic' selected>Acrylic</option>");
                                            out.println("<option value = 'Water Colour'>Water Colour</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Water Colour")) {
                                            out.println("<option value = 'Oil'>Oil</option>");
                                            out.println("<option value = 'Acrylic'>Acrylic</option>");
                                            out.println("<option value = 'Water Colour' selected>Water Colour</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Other")) {
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
                                    if(rs.getString(7).equals("Framed")){
                                        out.println("<input type = 'radio' name = 'frame' value = 'Framed' checked> Framed<br>");
                                        out.println("<input type = 'radio' name = 'frame' value = 'Not Framed'> Not Framed<br>");
                                    }
                                    else if(rs.getString(7).equals("Not Framed")){
                                        out.println("<input type = 'radio' name = 'frame' value = 'Framed'> Framed<br>");
                                        out.println("<input type = 'radio' name = 'frame' value = 'Not Framed' checked> Not Framed<br>");
                                    }
                                %>

                            </td>
                        </tr>
                        <tr class = 'new'>
                            <td>Dimensions</td>
                            <td>
                                <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=rs.getString(8)%>'>
                            </td>
                        </tr>
                        <%
                        }

                        else if(rs.getString(5).equals("Photography")){
                        %>
                        <tr class = 'new'>
                            <td>Type of Image</td>
                            <td>
                                <select name = 'medium' class = 'form-control medium'>
                                    <%
                                        if(rs.getString(6).equals("Black and White")){
                                            out.println("<option value = 'Black and White' selected>Black & White</option>");
                                            out.println("<option value = 'Colour'>Colour</option>");
                                        }
                                        else if(rs.getString(6).equals("Colour")){
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
                                <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=rs.getString(8)%>'>
                            </td>
                        </tr>
                        <%
                        }
                        else if(rs.getString(5).equals("Carving")){
                        %>
                        <tr class = 'new'>
                            <td>Type of Image</td>
                            <td>
                                <select name = 'medium' class = 'form-control medium'>
                                    <%
                                        if(rs.getString(6).equals("Oak")){
                                            out.println("<option value = 'Oak' selected>Oak</option>");
                                            out.println("<option value = 'Beach'>Beach</option>");
                                            out.println("<option value = 'Pine'>Pine</option>");
                                            out.println("<option value = 'Willow'>Willow</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Beach")){
                                            out.println("<option value = 'Oak'>Oak</option>");
                                            out.println("<option value = 'Beach' selected>Beach</option>");
                                            out.println("<option value = 'Pine'>Pine</option>");
                                            out.println("<option value = 'Willow'>Willow</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Pine")){
                                            out.println("<option value = 'Oak'>Oak</option>");
                                            out.println("<option value = 'Beach'>Beach</option>");
                                            out.println("<option value = 'Pine' selected>Pine</option>");
                                            out.println("<option value = 'Willow'>Willow</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Willow")){
                                            out.println("<option value = 'Oak'>Oak</option>");
                                            out.println("<option value = 'Beach'>Beach</option>");
                                            out.println("<option value = 'Pine'>Pine</option>");
                                            out.println("<option value = 'Willow' selected>Willow</option>");
                                            out.println("<option value = 'Other'>Other</option>");
                                        }
                                        else if(rs.getString(6).equals("Other")){
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
                                <input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height' value = '<%=rs.getString(8)%>'>
                            </td>
                        </tr>
                        <tr class = 'new'>
                            <td>Approx. Weight (kg)</td>
                            <td>
                                <input type = 'number' name = 'weight' step = 'any' class = 'form-control' placeholder = 'Weight in KG'  value="<%=rs.getString(12)%>">
                            </td>
                        </tr>
                        <%
                            }

                        %>

                        <tr>
                            <td>Item Description</td>
                            <td>
                                <textarea name="description" id="desc" class="form-control" rows="10" ><%out.println(rs.getString(9));%></textarea>
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>Price</td>
                            <td>
                                <input type="number" name="price" step="any" id="price" class="form-control" value="<%=rs.getString(10)%>" required="required" placeholder = "$" title="">
                            </td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>Image</td>
                            <td>
                                <input type="file" name="image" class="form-control" value="" required="required" title="">
                                <input type = "text" name = "item_lot_number" value = "<%=rs.getString(2)%>">
                            </td>
                            <td></td>
                        <tr>

                        </tbody>
                    </table>
                    <!-- End of form -->
            </div>
            <div class="modal-footer">

                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button  type="submit" name = "submit" class="btn btn-primary submit">Save</button>
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

<%
c.closeConnection();
%>


