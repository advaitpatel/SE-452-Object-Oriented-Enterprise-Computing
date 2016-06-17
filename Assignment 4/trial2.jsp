<%-- 
    Document   : trial2
    Created on : 31 May, 2016, 4:16:58 PM
    Author     : Advait
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset = null;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/test",
                        "root", "haresh");

                String data_delete = request.getParameter("product_name");
                out.print(data_delete);

                String query = "delete from se452db where p_name = ?";
                PreparedStatement preparedStmt = connection.prepareStatement(query);
                preparedStmt.setString(1, data_delete);

                // execute the preparedstatement
                preparedStmt.execute();

            } catch (Exception e) {
                out.println("wrong entry" + e);
            }
        %>
        <h2>After performing deletion operation</h2>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/test",
                        "root", "haresh");
                Statement statement = connection.createStatement();
                resultset = statement.executeQuery("select * from se452db");
        %>

    <center>
        <h1> Drop down box or select element</h1>
        <form name="trial" action="trial2.jsp" method="GET">
            <select name="product_name">
                <%  while (resultset.next()) {%>
                <option><%= resultset.getString(2)%></option>
                <% } %>
            </select>
            <INPUT type="submit" value="Delete"/>
        </form>


    </center>

    <%
    //**Should I input the codes here?**
        } catch (Exception e) {
            out.println("wrong entry" + e);
        }
    %>

</body>
</html>
