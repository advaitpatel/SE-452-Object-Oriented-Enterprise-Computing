<%-- 
    Document   : trial
    Created on : 31 May, 2016, 3:58:12 PM
    Author     : Advait
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%ResultSet resultset = null;%>

<HTML>
    <HEAD>
        <TITLE>Select element drop down box</TITLE>
    </HEAD>

    <BODY>

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

</BODY>
</HTML>