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
<%@ page import="javax.swing.plaf.nimbus.State" %>
<%
    Connect con = new Connect();
    Statement stm = con.getStatement();
    try {
        String query = "SELECT *  FROM client_requests where  declined = 'no' AND evaluator_confirmation = false";
        ResultSet rs = stm.executeQuery(query);








%>


<jsp:include page="layout.jsp"></jsp:include>
<%
    if(request.getParameter("added") != null){
        out.println("<script>$.notify('The item has been successfully added to the pending list!.', {className:'success', autoHideDelay:3000, hideAnimation:'fadeOut'})</script>");
    }

%>




<h3>Welcome back, <%out.print(session.getAttribute("support"));%></h3>
<br>

<%
    if(session.getAttribute("type").toString().equals("EVALUATOR")){
        out.println("<h3>Pending Evaluations</h3>");
        int i = 0;
        int j = 0;

            %>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Item</th>
                    <th>Date of Evaluation</th>
                    <th>Seller</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    while(rs.next()){
                        String oid = rs.getString(1);
                        i++;
                        j--;
                %>
                <tr>
                    <!-- Name of piece-->
                    <td scope="row">
                        <%out.println(rs.getString(2));%><br>
                        <%out.println(rs.getString(3));%>
                    </td>

                    <!--Date of evaluation-->
                    <td><%out.println(rs.getString(4));%></td>

                    <!--Seller-->
                    <td>
                        <%
                            Connect help = new Connect();
                            Statement st = help.getStatement();
                            try{
                                ResultSet sellerInfo = st.executeQuery("SELECT *  FROM clients WHERE tel = '" + rs.getString(5) +"'");
                                while (sellerInfo.next()){

                                    %>
                                    <!-- Button trigger modal -->
                                    <p style="cursor: pointer" data-toggle="modal" data-target="#modelId<%=i%>">
                                        <%out.println(sellerInfo.getString(2) + " " + sellerInfo.getString(3));%>
                                    </p>

                                    <!-- Modal -->
                                    <div class="modal fade" id="modelId<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
                                         aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="modelTitleId">Seller Info</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <table class="table">
                                                        <tbody>
                                                        <tr>
                                                            <td>Seller's Name</td>
                                                            <td><%out.println(sellerInfo.getString(2) + " " + sellerInfo.getString(3));%></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Address</td>
                                                            <td><%out.println(sellerInfo.getString(4));%></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Telephone</td>
                                                            <td><%out.println(sellerInfo.getString(5));%></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Email</td>
                                                            <td><%out.println(sellerInfo.getString(6));%></td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    </td>
                                    <td>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modelId<%=j%>">
                                        Set Up Client Agreement Form
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
                                                    <h4 class="modal-title" id="modelTitleId">Client Agreement Form<br> <img src="../Images/logo.jpg" alt=""></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="formcontrol.jsp" method="POST" enctype="multipart/form-data">
                                                        <table class="formTable" style="color: black; font-weight: 500;">
                                                            <tbody>
                                                            <tr>
                                                                <td>Client's Name*</td>
                                                                <td>
                                                                    <!--<input type="text" name = "" value = "">-->
                                                                    <div class="input-group">
                                                                        <input type="text" name="name" class="form-control" required="required" title="" value = "<%=sellerInfo.getString(2) + " " + sellerInfo.getString(3)%>" readonly>
                                                                        <div class="input-group-addon">
                                                                            <span class="input-group-text"><i class="far fa-address-card"></i></span>
                                                                        </div>
                                                                    </div>

                                                                    <input type="hidden" name="oid" class="form-control" value="<%=oid%>">

                                                                </td>

                                                            </tr>

                                                            <tr>
                                                                <td>Client's Telephone Number (Primary)*</td>
                                                                <td>
                                                                    <div class="input-group">
                                                                        <input type="number" name="pNumber" class="form-control" required="required" title="" value = "<%=sellerInfo.getString(5)%>" readonly>
                                                                        <div class="input-group-addon">
                                                                            <span class="input-group-text"><span class = "fa fa-phone-square"></span></span>
                                                                        </div>
                                                                    </div>
                                                                </td>

                                                            </tr>

                                                            <tr>
                                                                <td>Client's Telephone Number (Secondary)</td>
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
                                                                        <input type="text" name="address" class="form-control" required="required" title="" value="<%=sellerInfo.getString(4)%>">
                                                                        <div class="input-group-addon">
                                                                            <span class="input-group-text"><span class = "fa fa-building"></span></span>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <%
                                                                }
                                                            %>
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
                                                                <td>Client Agreed Reserved Price*</td>
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
                                                            <tr>
                                                                <td>Agreement</td>
                                                                <td>
                                                                            <textarea class="form-control" name="" id="" cols="30" rows="20" disabled>
                                                                                By signing the agreement, you are confirming the following to be true:-

                                                                                1)	I am the sole owner of the piece described above.
                                                                                2)To the best of my knowledge the description of the piece is accurate and true.
                                                                                3)I believe the piece to be authentic.
                                                                                4)I authorise Fotherby’s Ltd to act on my behalf to sell the piece for a price not below my agreed reserve price.
                                                                                5)I agree to pay Fotherby’s Ltd 20% of the final sale price as payment for the services provided.
                                                                                6)Should I wish to withdraw the piece from sale, it must be done in writing, a maximum of two weeks after the auction date has been set, otherwise I understand I will be liable to pay Fotherby’s Ltd a fee of (£………….)

                                                                            </textarea>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Client's Signature*</td>
                                                                <td>
                                                                    <input type="file" name="signature" class="form-control" value="" required="required" title="">

                                                                </td>
                                                            <tr>
                                                            </tbody>
                                                        </table>
                                                        <br>
                                                        <p class="text-center">

                                                            <input type="checkbox" name="agreement" value = "ok" required>
                                                            I have read the agreement and accept the terms.
                                                        </p>

                                                </div>
                                                <div class="modal-footer">

                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                                    </button>
                                                    <button type="submit" name = "clientAgreementSubmit" class="btn btn-primary">Submit</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </td>
                                <%
                                        help.closeConnection();
                                    }
                                    catch(Exception e){
                                        help.closeConnection();
                                    }
                                %>


                </tr>
                <%
                    }
                %>
                </tbody>
            </table>

</div>

<%
        }
        con.closeConnection();
    }
    catch (Exception e1){
        out.println(e1.getMessage());
        con.closeConnection();
    }
    con.closeConnection();
%>