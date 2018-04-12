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


<jsp:include page="index.jsp"></jsp:include>



<section class = "homeRight pull-right">
    <div class="jumbotron">
        <div class="container" style="
        width: 45%;
        background-color: #ffffff;
        color: #363635;
        padding: 5em;

">
            <%
                if(session.getAttribute("client") == null || session.getAttribute("client") == ""){
                    // out.println(session.getAttribute("user"));


            %>
                <h1 class="text-center"><i class="fa fa-user-circle" aria-hidden="true"></i></h1>
                <br>
                <div class = 'errorDiv'></div>

                <div class="form-group">
                    <div class="input-group">

                        <input type="text" class="form-control" placeholder="Username" id = 'username' name = 'username' required>
                        <div class="input-group-addon">
                            <span class = 'glyphicon glyphicon-user' style = 'cursor: pointer;'></span>
                        </div>
                    </div>
                </div>
                <div class = 'form-group'>
                    <div class="input-group">

                        <input type="password" class="form-control" placeholder="Password" id = 'password' name = 'password' required>
                        <div class="input-group-addon">
                            <i class="fas fa-key"></i>
                        </div>
                    </div>
                </div>

                <div class = 'form-group'>
                    <button id = "clientLogin" class="btn btn-primary">Login</button>
                </div>


    <%
        }
        else{
                    response.sendRedirect("clients/index.jsp");
        }
    %>

        </div>
    </div>
</section>