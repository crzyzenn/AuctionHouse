<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, Help.Connect" %>




<!-- Get existing auction items -->
<%
	Connect con = new Connect();
	Statement stm = con.getStatement();
	ResultSet rs = stm.executeQuery("SELECT * FROM auction_items");

%>





<!-- Get the page layout -->    
<jsp:include page="essentials.jsp"></jsp:include>

<%--Delete an auction item--%>
<%
    if(request.getParameter("deleted") != null){
        out.println("<script>$.notify('Sucessfully deleted Lot: " + request.getParameter("deleted") + "', {className:'success', autoHideDelay:2000});</script>");
    }
    else if(request.getParameter("error") != null){
        out.println("<script>$.notify('Failed to delete Lot: " + request.getParameter("error") + "', {className:'error', autoHideDelay:2000});</script>");
    }
%>
<%--End of Delete--%>


<%--Adding an auction item--%>
<%
	if(request.getParameter("added") != null && request.getParameter("added") == ""){
		out.println("<script>$.notify('Item has been added sucessfully', {className:'success', autoHideDelay:2000});</script>");
	}
	else if(request.getParameter("error") != null && request.getParameter("error") == ""){
		out.println("<script>$.notify('Item could not be added', {className:'error', autoHideDelay:2000});</script>");
	}
%>
<%--End of add--%>

<div id = 'right-container'>

	
	<!-- <a href="addItem.php?b" data-toggle = 'tooltip' data-placement = 'bottom' title = 'Add Item'><span style = 'color:white' class = 'glyphicon glyphicon-plus-sign glyph'></span></a> -->


	<!-- Adding an item -->
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
					<form action="functions.jsp" method="POST" class = 'form-group' enctype = "multipart/form-data">			
						
						<table class="table table-responsive" id = 'uploadDiv'>
							<thead>
								
							</thead>
							<tbody>
								<tr>
									<td>Name of the artist</td>
									<td>
										<input type="text" name="name" class="form-control" required="required" title="">
									</td>
									<td></td>
								</tr>
								<tr>
									<td>Production Year</td>
									<td>
										<input type="date" name="date" class="form-control" required="required" title="">
									</td>
									<td></td>
								</tr>
								<tr>
									<td>Category</td>
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
						 			<td>Medium</td>
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
					 				<td>Type</td> 
					 				<td> 
					 					<input type = 'radio' name = 'frame' value = 'Framed' checked> Framed<br> 
					 					<input type = 'radio' name = 'frame' value = 'Not Framed'> Not Framed<br> 
					 				</td> 
					 			</tr>
					 			<tr class = 'new'> 
					 				<td>Dimensions</td> 
					 				<td> 
					 					<input type = 'text' name = 'dimensions' class = 'form-control' placeholder = 'Width x Height'> 
					 				</td> 
					 			</tr>
								<tr>
									<td>Item Description</td>
									<td>
										<textarea name="description" id="desc" class="form-control" rows="10"></textarea>					
									</td>					
									<td></td>	
								</tr>
								
								<tr>
									<td>Price</td>
									<td>
										<input type="number" name="price" step="any" id="price" class="form-control" value="" required="required" placeholder = "$" title="">
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
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save changes</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End of adding an item -->

	<hr>

	<!-- View all the auction items available -->
	<div class="pre-scrollable">					
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

							    <button onclick = 'var a = confirm("Are you sure?"); if(a) window.location = "functions.jsp?delete&token=<%=rs.getString(2)%>";' class = 'btn btn-danger btn-sm'><span class = 'glyphicon glyphicon-remove'></span></button>

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
%>