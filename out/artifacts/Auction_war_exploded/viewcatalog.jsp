<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Help.Connect" %>
<%
    Connect con = new Connect();
    Statement stm = con.getStatement();
    try {
        String query = "SELECT *  FROM all_auction_items WHERE auction_id = " + request.getParameter("id");
        ResultSet rs = stm.executeQuery(query);

%>

<jsp:include page="index.jsp"></jsp:include>

<section class = "homeRight pull-right">
    <ul class="breadcrumb">
        <li><a href="home.jsp">Home</a></li>
        <li class="active"><a href="viewcatalog.jsp">View Catalog</a></li>
    </ul>
    <br>
    <ul class = 'auctionItems'>
        <%
            int i = 0;
            while(rs.next()){
                i++;
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
        %>



                <li>
                    <!-- Button trigger modal -->
                    <a data-toggle="modal" data-target="#modelId<%=i%>">
                        <img src="Images/<%=item_image%>" alt="">
                    </a>

                    <!-- Modal -->
                    <div class="modal fade" id="modelId<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title" id="modelTitleId"><%out.println(piece_title);%></h4>
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
                                            <td>Price (&pound)</td>
                                            <td><%=price%></td>
                                        </tr>
                                        <tr>
                                            <td>Weight (kg)</td>
                                            <td><%=weight%></td>
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



                    <p class="text-center"><%out.println(piece_title);%></p>
                    <p class="text-info text-center">Price (&pound): <%out.println(price);%></p>
                </li>


        <%
                }
                con.closeConnection();
            } catch (Exception e1) {
                con.closeConnection();
            }

        %>
    </ul>
</section>