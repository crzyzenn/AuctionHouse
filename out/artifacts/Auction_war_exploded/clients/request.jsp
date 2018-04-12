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

<jsp:include page="layout.jsp"></jsp:include>

    <h3>Tell us about your piece and we'll get back to you!</h3>
    <br>

    <form action="formcontrol.jsp" method="POST">
        <table class="formTable" id = "registerForm">
            <tbody>
            <tr>
                <td>Name</td>
                <td>
                    <input type="text" name="name" class="form-control" placeholder="Name of the piece" required="required" title="">
                </td>

            </tr>
            <tr>
                <td>Description</td>
                <td>
                    <textarea name="description" class="form-control" rows="20" placeholder="Description of the piece" required></textarea>
                </td>
            </tr>
            </tbody>
        </table>
        <br>
        <button type="submit" name = "requestPiece" class="btn btn-primary form-control">Submit Request <span class = "glyphicon glyphicon-chevron-right"></span></button>
    </form>

</div>