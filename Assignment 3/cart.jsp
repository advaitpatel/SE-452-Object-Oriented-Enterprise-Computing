
<%@ page import="myBeans.Helper"%>
<%@ page import="myBeans.OrderItem"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>

<%
	PrintWriter pw = response.getWriter();

	Helper helper = new Helper(request, pw);
	String name = request.getParameter("name");
	String type = request.getParameter("type");
	String maker = request.getParameter("maker");
	String access = request.getParameter("access");
	if (name != null && type != null && maker != null) {
		helper.storeProduct(name, type, maker, access);
	}
%>
<%
	if (!helper.isLoggedin()) {
		session = request.getSession(true);
		session.setAttribute("login_msg", "Please Login to add items to cart");
		response.sendRedirect("Login");
		return;
	}
%>

<%@include file="site_header.jsp"%>


<%
	if (session.getAttribute("username") != null) {
		String username = session.getAttribute("username").toString();
		username = Character.toUpperCase(username.charAt(0)) + username.substring(1);
%>

<li><a>Hello, <%=username%></a></li>
<li><a href='Account.jsp'>Account</a></li>
<li><a href='OrderHistory.jsp'>Order History</a></li>
<li><a href='Logout.jsp'>Logout</a></li>

<%
	} else {
%>

<li><a href='Login.jsp'>Login</a></li>
<%
	}
%>

<li class="end"><a href='Cart.jsp'>Cart(<%=helper.CartCount()%>
		)
</a></li>
</ul>
</div>
</nav>
<div id='body' class="width">


	<%@include file="site_sidebar.jsp"%>


	<div id='content'>
		<div class='post'>
			<h2 class='title meta'>
				<a style='font-size: 24px;'>Cart(<%=helper.CartCount()%>)
				</a>
			</h2>
			<div class='entry'>
				<%
					if (helper.CartCount() > 0) {
				%>
				<table class='gridtable'>
					<%
						int i = 1;
							double total = 0;
							for (OrderItem oi : helper.getCustomerOrders()) {
					%>

					<tr>

						<td><%=i%>.</td>
						<td><%=oi.getName()%></td>
						<td>: <%=oi.getPrice()%></td>
						<td>
						<td><a class='btnreview' href='RemoveFromCart.jsp?sno="+i+ "'>Remove</a></td>
					</tr>

					<%
						total = total + oi.getPrice();
								i++;
							}
					%>

					<tr>
						<th></th>
						<th>Total</th>
						<th><%=total%></th>
					<tr>
						<td></td>
						<td></td>
						<td><a href='CheckOut.jsp' class='btnbuy'>Check Out</a></td>
				</table>
				<%
					} else {
				%>
				<h4 style='color: red'>Your Cart is empty</h4>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<%@include file="site_footer.jsp"%>
</html>