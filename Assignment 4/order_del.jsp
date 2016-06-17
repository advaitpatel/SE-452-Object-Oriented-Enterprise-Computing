<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Johnny.Dao.OrderDao"%>
<%@page import="Johnny.Common.Constants"%>
<%@page import="Johnny.Common.Helper"%>
<jsp:include page="layout_top.jsp" />
<jsp:include page="layout_header.jsp" />
<%
    Helper helper = new Helper(request);
    helper.setCurrentPage(Constants.CURRENT_PAGE_USERMNG);
    if(!helper.isLoggedin()){
        session.setAttribute(Constants.SESSION_LOGIN_MSG, "Please login first!");
        response.sendRedirect("account_login.jsp");
        return;
    }
    String usertype = helper.usertype();
    String errmsg = "";
    if (usertype==null || !usertype.equals(Constants.CONST_TYPE_SALESMAN_LOWER)) {
        errmsg = "You have no authorization to manage user!";
    }
    
    if (errmsg.isEmpty()) {
        String orderid = request.getParameter("orderid");

        OrderDao dao = OrderDao.createInstance();
        if (dao.isExisted(orderid)) {
            dao.deleteOrder(orderid);
            response.sendRedirect("admin_orderlist.jsp");
        } else {
            errmsg = "No Order found!";
        }
    }
    pageContext.setAttribute("errmsg", errmsg);
%>

<%
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3308/test",
                        "root", "haresh");

                String data_delete = request.getParameter("product_name");
                out.print(data_delete);

                String query = "delete from se452db where p_name = ?";
                PreparedStatement preparedStmt = connection.prepareStatement(query);
                preparedStmt.setString(1, "WiiU");

                // execute the preparedstatement
                preparedStmt.execute();

            } catch (Exception e) {
                out.println("wrong entry" + e);
            }
        %>

<jsp:include page="layout_menu.jsp" />
<section id="content">
  <div>
    <h3>Delete User</h3>
    <h3 style='color:red'>${errmsg}</h3>    
  </div>
</section>
<jsp:include page="layout_sidebar.jsp" />
<jsp:include page="layout_footer.jsp" />
