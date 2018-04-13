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
            if(url.equals("/clients/index.jsp")){
                out.print("Client | Home");
            }
            else if(url.equals("/clients/index.jsp")){
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
    </script>
</head>
<body>
<div id = 'left-container'>
    <ul class="myNav">
        <a class = 'myLink' disabled>
            <li style = "background-color: #363635; color: white;">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
                <p style=" position: relative;
                                 right: 30%;
                                font-size: 80%;
                                margin-top: -15px;"><%out.println(session.getAttribute("support"));%></p>
            </li>

        </a>
        <%

            // Menu layout for support users
            String type = session.getAttribute("type").toString();
            if(type.equals("EVALUATOR")){
                if (url.equals("/support/dashboard.jsp")) {
                    out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Dashboard' class = 'myLink' href='dashboard.jsp'><li class = 'active'><i class = 'fas fa-industry'></i></li></a>");
                }
            }
            else {
                if (url.equals("/support/dashboard.jsp")) {
                    out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Dashboard' class = 'myLink' href='dashboard.jsp'><li class = 'active'><i class = 'fas fa-home'></i></li></a>");
                    out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Sales Requests' class = 'myLink' href='sales_request.jsp'><li><i class='fas fa-envelope'></i></li></a>");
                } else if (url.equals("/support/sales_request.jsp")) {
                    out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Dashboard' class = 'myLink' href='index.jsp'><li><i class = 'fas fa-home'></i></li></a>");
                    out.println("<a data-toggle = 'tooltip' data-placement = 'right' title = 'Sales Requests' class = 'myLink' href='sales_request.jsp'><li class = 'active'><i class='fas fa-envelope'></i></li></a>");
                }
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
                        <button type="button" onclick = "window.location = 'logout.jsp?logout=logout'" class="btn btn-primary">Yes</button>
                    </div>
                </div>
            </div>
        </div>
    </ul>
</div>

<div id = "right-container" style = "overflow-y: scroll;">


