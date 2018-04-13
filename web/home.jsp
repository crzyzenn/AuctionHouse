<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, Help.Connect" %>
<%
    Connect con = new Connect();
    Statement stm = con.getStatement();
    try {
        String query = "SELECT *  FROM auction";
        ResultSet rs = stm.executeQuery(query);

%>

<jsp:include page="index.jsp"></jsp:include>


<%
    while(rs.next()){


        %>
        <section class = "homeRight pull-right">
            <ul class="breadcrumb">
                <li class="active"><a href="home.jsp">Home</a></li>
            </ul>
            <div class="jumbotron lift">
                <div class="container">
                    <h1><%out.println(rs.getString(3));%></h1>
                    <h3>Featuring, <%out.println(rs.getString(4));%></h3>
                    <h4><%out.println(rs.getString(5) + " | " + rs.getString(6) + " " + rs.getString(7));%></h4>
                    <br>
                    <p>
                        <a href = "viewcatalog.jsp?id=<%out.println(rs.getString(2));%>&name=<%out.println(rs.getString(3));%>" class="btn btn-primary btn-lg">View Catalog</a>
                    </p>
                </div>
            </div>
        </section>


        <%
        }
        con.closeConnection();
    }

    catch (Exception e1){
        con.closeConnection();
    }

%>