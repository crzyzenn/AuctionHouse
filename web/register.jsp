<%--
  Created by IntelliJ IDEA.
  User: Cryzenn
  Date: 4/11/2018
  Time: 1:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="index.jsp"></jsp:include>

<section class = "homeRight pull-right">
        <h2 class="text-center">REGISTERING</h2>
        <ul class="nav nav-tabs" style="margin: 0 auto; width: fit-content; color: white; font-weight: 1000;">
            <li class="active"><a data-toggle="tab" href="#home">As Buyer</a></li>
            <li><a data-toggle="tab" href="#menu1">As Seller</a></li>
        </ul>

        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
                <h3>Please fill in your buyer details</h3>
                <br>
                <div class = "container-fluid">
                    <form action="registerUser.jsp">
                        <table class="formTable">
                            <thead>
                            </thead>
                            <tbody>
                            <tr>
                                <td>First Name</td>
                                <td>

                                    <input type="text" name="name" class="form-control" required="required" title="">


                                </td>

                            </tr>
                            <tr>
                                <td>Surname</td>
                                <td>
                                    <input type="text" name="surname" class="form-control" required="required" title="">
                                </td>

                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <input type="text" name="address" class="form-control" required="required" title="">
                                </td>

                            </tr>
                            <tr>
                                <td>Telephone Number</td>
                                <td>
                                    <input type="number" name="tel" class="form-control" required="required" title="">
                                </td>

                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <div class="input-group">
                                        <input type="email" name="email" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text">@example.com</span>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>Bank Account Number</td>
                                <td>
                                    <div class="input-group">
                                        <input type="number" name="bankNum" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text"><i class="fa fa-building" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>Sort Code</td>
                                <td>
                                    <div class="input-group">
                                        <input type="text" name="bankSort" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>Username</td>
                                <td>
                                    <div class="input-group">
                                        <input type="text" name="username" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text"><i class="fa fa-user-circle" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>
                                    <div class="input-group">
                                        <input type="password" name="password" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm Password</td>
                                <td>
                                    <div class="input-group">
                                        <input type="password" name="confirm" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <br>
                        <button type="submit" class = "btn btn-primary">Register</button>
                    </form>
                </div>

            </div>
            <div id="menu1" class="tab-pane fade">
                <h3>Please fill in your seller details</h3>
                <br>
                <div class = "container-fluid">
                    <form action="registerUser.jsp" method = "POST">

                    <table class="formTable" id = "registerForm">
                        <thead>
                        </thead>
                        <tbody>
                            <tr>
                                <td>First Name</td>
                                <td>
                                        <input type="text" name="name" class="form-control" required="required" title="">
                                </td>

                            </tr>
                            <tr>
                            <td>Surname</td>
                                <td>
                                    <input type="text" name="surname" class="form-control" required="required" title="">
                                </td>

                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <input type="text" name="address" class="form-control" required="required" title="">
                                </td>

                            </tr>
                            <tr>
                                <td>Telephone Number</td>
                                <td>
                                    <input type="number" name="tel" class="form-control" required="required" title="">
                                </td>

                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <div class="input-group">
                                        <input type="email" name="email" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text">@example.com</span>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>Username</td>
                                <td>
                                    <div class="input-group">
                                        <input type="text" name="username" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text"><i class="fa fa-user-circle" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>Password</td>
                                <td>
                                    <div class="input-group">
                                        <input type="password" id = "password" name="password" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm Password</td>
                                <td>
                                    <div class="input-group">
                                        <input type="password" id = "confirmPass" name="confirm" class="form-control" required="required" title="">
                                        <div class="input-group-addon">
                                            <span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
                    <button type="submit" id = "register" class = "btn btn-primary">Register</button>
                    </form>
                </div>
            </div>
        </div>

</section>
