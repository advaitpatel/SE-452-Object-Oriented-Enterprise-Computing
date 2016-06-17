<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Johnny.Beans.Payment"%>
<%@page import="Johnny.Common.Constants"%>
<%@page import="Johnny.Common.Helper"%>
<jsp:include page="layout_top.jsp" />
<jsp:include page="layout_header.jsp" />
<%
    String errmsg = "";
    Helper helper = new Helper(request);
    helper.setCurrentPage(Constants.CURRENT_PAGE_CART);

    Payment payment = new Payment(helper.username(), "420 Huber Lane, Chicago,IL", "0123456789");
    if ("GET".equalsIgnoreCase(request.getMethod())) {

    } else {
        String address = request.getParameter("address");
        String creditcard = request.getParameter("creditcard");
        payment.setAddress(address);
        payment.setCreditCard(creditcard);
        if (address == null || address.isEmpty()) {
            errmsg = "Address can't be empty!";
        } else if (creditcard == null || creditcard.isEmpty()) {
            errmsg = "Credit card can't be empty and must be 16 numbers length!";
        }

        if (errmsg.isEmpty()) {
            request.setAttribute("address", address);
            request.setAttribute("creditcard", creditcard);
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/orderplace.jsp");
            dispatcher.forward(request, response);
        }
    }
    pageContext.setAttribute("errmsg", errmsg);
    pageContext.setAttribute("payment", payment);
%>

<%
    String cust_name = request.getParameter("full_name");
    String cust_email = request.getParameter("email_id");
    String cust_address = request.getParameter("address");
    String cust_contact = request.getParameter("contact");
    String cust_card = request.getParameter("creditcard");
    
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/test",
            "root", "haresh");
    Statement st = con.createStatement();
    ResultSet rs;

    int i = st.executeUpdate("insert into CUSTOMER_INFO values (0,'" + cust_name + "','" + cust_email + "','" + cust_address + "','" + cust_contact + "'  ,'" + cust_card + "'  )");

%>

<jsp:include page="layout_menu.jsp" />
<section id="content">
    <div class="post">
        <h3>Please fill your shipping details here.</h3>
        <h3 style='color:red'>${errmsg}</h3>
        <form action="checkout.jsp" method="Post">
            <table style='width:55%'>
                <tr><td>Full Name :</td><td><input type='text' size= '20' name='full_name' value='${payment.name}' required/></td></tr>
                <tr><td>Email Address :</td><td><input type='text' size= '20' name='email_id' value='james.bond@007.com' required/></td></tr>
                <tr><td>Full Address :</td><td><input type='text' size= '40' name='address' value='117 Huber Lane, Chicago, IL, USA 52525' required/></td></tr>
                <tr><td>Contact Number :</td><td><input type='text' size='10' name='contact' value='9876543210' required /></td></tr>
                <tr><td>Credit Card Number :</td><td><input type='text' size='10' name='creditcard' value='${payment.creditCard}' required /></td></tr>
                <tr><td><a href='mycart.jsp' class='button2'>Back to cart</a></td><td><input name="create" value="Place Order" type="submit" class="formbutton" /></td></tr>
            </table>	  
        </form>
    </div>
</section>
<jsp:include page="layout_sidebar.jsp" />
<jsp:include page="layout_footer.jsp" />