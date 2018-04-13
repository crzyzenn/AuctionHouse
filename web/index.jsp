<%--
  Created by IntelliJ IDEA.
  User: Cryzenn
  Date: 4/8/2018
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Help.Connect" %>
<%

//  Get request URL
  String url = request.getRequestURI();
%>
<html>
  <head>
    <title>Fotheby's Auction House | Home</title>
    <link rel = 'stylesheet' media="screen" href = 'bs/css/bootstrap.css'>
    <script src="bs/js/jquery.js"></script>
    <script type="text/javascript" src = 'bs/js/bootstrap.js'></script>
    <script type="text/javascript" src = 'bs/js/fontawesome-all.js'></script>
    <script type="text/javascript" src = 'bs/js/notify.js'></script>
  </head>
  <body>


    <!--<nav class="navbar navbar-default navbar-fixed-top" role="navigation">-->
      <!--<a class="navbar-brand" href="#"><img src="Images/logo.jpg" alt=""></a>-->
      <!--<div id = 'logStatus'>-->
        <!--<a href = "loginResponse.php?logout" data-toggle = 'tooltip' data-placement = 'bottom' title = 'Login'><span class = 'glyphicon glyphicon-log-in'></span></a>-->
        <!--<a href = "loginResponse.php?logout" data-toggle = 'tooltip' data-placement = 'bottom' title = 'Register'><span class = 'fa fa-user-plus'></span></a>-->
      <!--</div>-->
    <!--</nav>-->

  <section class="homeLeftBar pull-left">
    <a class="navbar-brand" href="home.jsp"><img src="Images/logo.jpg" alt=""></a>

    <div id = 'logStatus'>
      <%
        if (url.equals("/register.jsp")){
      %>
          <a href = "login.jsp" data-toggle = 'tooltip' data-placement = 'bottom' title = 'Login'><span class = 'glyphicon glyphicon-log-in'></span></a>
          <a href = "register.jsp" class = 'active' data-toggle = 'tooltip' data-placement = 'bottom' title = 'Register'><span class = 'fa fa-user-plus'></span></a>
      <%
        }

        else{
      %>
        <a href = "login.jsp" data-toggle = 'tooltip' data-placement = 'bottom' title = 'Login'><span class = 'glyphicon glyphicon-log-in'></span></a>
        <a href = "register.jsp" data-toggle = 'tooltip' data-placement = 'bottom' title = 'Register'><span class = 'fa fa-user-plus'></span></a>
      <%
        }
      %>
    </div>

</section>
