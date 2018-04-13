<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
	String url = request.getRequestURI();
%>

<!DOCTYPE html>
<html>
<head>

	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>
		<%
			if(url.equals("/admin/dashboard.jsp")){
				out.print("Admin | Dashboard"); 	
			}
			else if(url.equals("/admin/addItem.jsp")){
				out.print("Admin | Add Item"); 	
			}
		%>
	</title>
	<link rel = 'stylesheet' media="screen" href = '../bs/css/bootstrap.css'>
	<script src="../bs/js/jquery.js"></script>
	<script type="text/javascript" src = '../bs/js/bootstrap.js'></script>
	<script type="text/javascript" src = '../bs/js/fontawesome-all.js'></script>
	<script type="text/javascript" src = '../bs/js/notify.js'></script>
    <script>
//        function confirm(){
//            var a = confirm("Are you sure?");
//            if(a){
//                window.location
//            }
//        }
    </script>
</head>
<body>		

	<div id = 'left-container'>
		<ul class="myNav">
			<a class = 'myLink' disabled><li style = "background-color: #363635; color: white;"><i class="fa fa-user-circle" aria-hidden="true"></i></li></a>
			<%
				if(url.equals("/admin/dashboard.jsp")){
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Dashboard' class = 'myLink' href='dashboard.jsp'><li class = 'active'><i class = 'fas fa-home'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Auctions' class = 'myLink' href='auction.jsp'><li><i class = 'fas fa-building'></i></li></a>");
                    out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Pending Lot' class = 'myLink' href='pendinglot.jsp'><li><i class='fas fa-book'></i></li></a>");
				}
				else if(url.equals("/admin/addItem.jsp")){
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Dashboard' class = 'myLink' href='dashboard.jsp'><li><i class = 'fas fa-home'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Auctions' class = 'myLink' href='auction.jsp'><li><i class = 'fas fa-building'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Pending Lot' class = 'myLink' href='pendinglot.jsp'><li><i class='fas fa-book'></i></li></a>");
				}
				else if(url.equals("/admin/pendinglot.jsp")){
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Dashboard' class = 'myLink' href='dashboard.jsp'><li><i class = 'fas fa-home'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Auctions' class = 'myLink' href='auction.jsp'><li><i class = 'fas fa-building'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Pending Lot' class = 'myLink' href='pendinglot.jsp'><li class = 'active'><i class='fas fa-book'></i></li></a>");
				}
				else if(url.equals("/admin/auction.jsp")){
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Dashboard' class = 'myLink' href='dashboard.jsp'><li><i class = 'fas fa-home'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Auctions' class = 'myLink' href='auction.jsp'><li class = 'active'><i class = 'fas fa-building'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Pending Lot' class = 'myLink' href='pendinglot.jsp'><li><i class='fas fa-book'></i></li></a>");
				}
				else if(url.equals("/admin/displayItems.jsp")){
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Dashboard' class = 'myLink' href='dashboard.jsp'><li><i class = 'fas fa-home'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Auctions' class = 'myLink' href='auction.jsp'><li class = 'active'><i class = 'fas fa-building'></i></li></a>");
					out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Pending Lot' class = 'myLink' href='pendinglot.jsp'><li><i class='fas fa-book'></i></li></a>");
				}

			%>
            <!-- Button trigger modal -->
            <a class = 'myLink' data-toggle="modal" data-target="#modelId"><li data-toggle = 'tooltip' data-placement = 'right' title = 'Logout'><span class='glyphicon glyphicon-log-out'></span></li></a>

            <!-- Modal -->
            <div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="modelTitleId"><span class = 'glyphicon glyphicon-log-out'></span> Log out </h4>
                        </div>
                        <div class="modal-body">
                            Are you sure?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" onclick = "window.location = 'functions.jsp?logout=logout'" class="btn btn-primary">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
		</ul>
	</div>




