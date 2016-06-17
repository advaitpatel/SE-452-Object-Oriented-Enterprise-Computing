<%@page import="java.util.Map"%>
<%@page import="myBeans.RetialerItem"%>
<%@page import="java.util.HashMap"%>
<%@page import="myBeans.RetailerHashMap"%>
<%@page import="myBeans.Retailer"%>
<%@page import="myBeans.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="myBeans.Helper"%>
<%@page import="java.io.PrintWriter"%>
<%
    PrintWriter pw = response.getWriter();
    Helper helper = new Helper(request, pw);
    if (!helper.isLoggedin()) {
        response.sendRedirect("Login");
        return;
    }

    // System.out.print(helper.usertype());
    String usertype = helper.usertype();
    if (usertype.equals("customer")) {
        displayCustomer(request, response);
    } else if (usertype.equals("retailer")) {
        displayRetailer(request, response);
    } else if (usertype.equals("manager")) {
        displayManager(request, response);
    }
%>
<%@include file="site_header.jsp"%>
<%!
    protected void displayCustomer(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        Helper helper = new Helper(request, pw);
        %>
        <div class='post' style='float: none; width: 100%'>
        <h2 class='title meta'><a style='font-size: 24px;'>Orders</a></h2>"
                + "<div class='entry'>
<%
        ArrayList<Order> orders = new ArrayList<Order>();
        Order order = new Order();
        boolean empty = true;

        orders.add(order);
        %>
        <table class='gridtable'>
        <tr><th>Order#" + order.getOrderid() + " : "
                + " items</th>"
        
            <%session.setAttribute("orderToDelete", order);%>
        <th>
                <form method='post' action='DeleteOrder'>
                <input type='submit' class='btnbuy' value='Delete'></input>
                </form></th></tr>
        
        <tr><td colspan=2>
        <table>
        <%
            int i = 1;
            %>
            <tr><td></td><td>Total:</td><td>" +<%= order.getTotal()%>
                + "</td></tr>

        </table></td></tr>

        </table>
        <%
                empty = false;

        if (empty) {
            %>
            <h4 style='color:red'>No orders are found</h4>
        <%}%>
        </div></div>
        <%
    }
%>

<%
    protected void displayRetailer(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        Helper helper = new Helper(request, pw);
%>        
<div class='post' style='float: none; width: 100%'>
        <h2 class='title meta'><a style='font-size: 24px;'>Account</a></h2>"
                + "<div class='entry'>");
        <a class='btnbuy' href='AddNew' style='width:100px'>Add New Product</a>");

        </div></div>");
        <div class='post' style='float: none; width: 100%'>");
        <h2 class='title meta'><a style='font-size: 24px;'>My Products</a></h2>"
                + "<div class='entry'>
                    <%
        String username = helper.username();
        Retailer retailer = RetailerHashMap.retailers.get(username);
        System.out.println(username);
        System.out.println(retailer);
        if (retailer == null) {
            %>
            <h4 style='color:red'>No products found</h4>
            <%
        } else {
            HashMap<String, RetialerItem> products = retailer
                    .getRetailerItems();
            if (products.isEmpty()) {
%>
                <h4 style='color:red'>No products found</h4>
                <%
            } else {
                int size = products.size();
                int i = 1;
%>
                <table>
                    <%
                for (Map.Entry<String, RetialerItem> entry : products
                        .entrySet()) {
                    if (i % 3 == 1) {
                        %>
                        <tr>
                            <%
                    }
%>
                    <td>
                        <%
                    RetialerItem product = entry.getValue();
                    helper.displayProduct(product.getItemName(),
                            product.getItemType(), product.getItemMaker(),
                            product.getItemAcc(), false);
                    %>
                    </td>
                    <%
                    if (i % 3 == 0 || i == size) {
                        %>
                        </tr>
                        <%
                    }
                }
%>
                </table>
                <%
            }
        }
%>
        </div></div>
        <%
    }
%>

<%
    protected void displayManager(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        Helper helper = new Helper(request, pw);
%>        
<div class='post' style='float: none; width: 100%'>
        <h2 class='title meta'><a style='font-size: 24px;'>Handle Accounts</a></h2>"
                + "<div class='entry'>
        <form method='post' action='Registration'>
        <table><tr><td>User Name</td><td>Password</td><td>ReEnter Password</td><td></td></tr><tr>
                <td><input type='text' name='username' value='' class='input' required></input></td>
                <td><input type='password' name='password' value='' class='input' required></input></td>
                <td><input type='password' name='repassword' value='' class='input' required></input></td>
                <td><input type='submit' class='btnbuy' value='Create User'></input></td>
                </tr></table></form>
        <table><tr><td>User Name</td><td>Password</td><td></td></tr><tr>
                <td><input type='text' name='username' value='' class='input' required></input></td>
                <td><input type='password' name='password' value='' class='input' required></input></td>
                <td><input type='submit' class='btnbuy' value='Delete User'></input></td>
                </tr></table></form>
       </div></div>
        <div class='post' style='float: none; width: 100%'>
        <h2 class='title meta'><a style='font-size: 24px;'>Handle Customer Orders</a></h2>
                <div class='entry'>
<%
        boolean empty = true;
%>
        <table class='gridtable'>
        <th>
                <form method='post' action='DeleteOrder'>
                <input type='hidden' name='collection_name' value=''></input>
                <input type='submit' class='btnbuy' value='Delete Order'></input>
                </form></th></tr>
        <tr><td colspan=2>
        <table>
            <%
        int i = 1;
%>
        </table></td></tr>

        </table>
        <%
        empty = false;

        if (empty) {
            %>
            <h4 style='color:red'>No orders are found</h4>
            <%
        }
%>
        </div></div>
  <%      
    }
%>
<%@include file="site_footer.jsp"%>