<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="myBeans.Order"%>
<%@page import="myBeans.OrderItem"%>
<%@include file="site_header.jsp"%>
<%@include file="site_sidebar.jsp"%>

<div id='content'><div class='post'><h2 class='title meta'>
            <a style='font-size: 24px;'>Delete Order</a>
        </h2><div class='entry'>
            <div id='content'><div class='post'><h2 class='title meta'>
                        <h2>We are sorry for that !!
                            <h3><a href='Home'>Go to Home Page</a></h3>
                            <%@include file="site_footer.jsp"%>

                            <%
                                String errmsg = "";
                                String orderid = request.getParameter("orderid");
                                if (orderid == null || orderid.isEmpty()) {
                                    errmsg = "Order id is empty!";
                                }

                                if (errmsg.isEmpty()) {
                                    //HttpSession session = request.getSession();
                                    OrderItem orderitems = null;

                                    if (orderitems == null) {
                                        errmsg = "Sorry !! You have no order!";
                                    } else {
                                        Order order = null;

                                        Calendar c = Calendar.getInstance();

                                        c.add(Calendar.DATE, -5);
                                        Date now = new Date();
                                        int checkOrderValid = now.compareTo(c.getTime());
                                        if (checkOrderValid > 0) {
                                            errmsg = "You can not cancel your order between 5 days " + "<br><h2 style=\"color:red;\"></h2>";
                                        } else {
                                            %>
                                            <a style='font-size: 24px;'>Cart(" + 0 + ")</a>
                                            <%
                                        }
                                    }

                                }

                            %>