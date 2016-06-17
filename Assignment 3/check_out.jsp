<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="includes/site_header.jsp"%>


<%! String name; %> 
<%! String priceTxt; %> 
<%! String retailer; %>
<%! Double price; %>
<%! Double total; %>
<%! String un; %>
<%! String usertype; %>
<%! myBeans.User currentUser; %>

<%

if (session.getAttribute("usertype")!=null) {
	usertype = session.getAttribute("usertype").toString();
}
	
if (session.getAttribute("username")!=null) {
	un = session.getAttribute("username").toString();
}

if (un != null && usertype != null) {
	HashMap<String, myBeans.User> hm = new HashMap<String, myBeans.User>();
	if (usertype.equals("customer")) {
		hm.putAll(UserList.customer);
	} else if (usertype.equals("retailer")) {
		hm.putAll(UserList.retailer);
	} else if (usertype.equals("manager")) {
		hm.putAll(UserList.manager);
	}
	currentUser = hm.get(un);
}





if(session.getAttribute("username") == null){
	session.setAttribute("login_msg", "Please Login to add items to cart");
	response.sendRedirect("Login.jsp");
	return;
}
%>

<div id='content'>
	<div class='post'>
		<h2 class='title meta'>
			<a style='font-size: 24px;'>Cart(<%= currentUser.cartSize()  %>)</a>
		</h2><div class='entry'>
			
		<%
		if(currentUser.cartSize()>0){
		%><table><%
		int i = 1;
		total = 0.00;
		HashMap<String, utils.CartItem> currentCart = currentUser.getCart();
		for (Map.Entry<String, utils.CartItem> oi : currentCart.entrySet()) {
			utils.CartItem item = oi.getValue();
			%>
			<tr>
				<td><%= oi.getKey()%>

				</td>
				<td>
					<%= item.getName()%>
				</td>
				<td>
					$<%= item.getPrice()%>
				</td>
			</tr>
			<%
			total = total + item.getPrice();
			i++;
		}
		%>
		<tr>
			<th>
				
			</th>
			<th>Total</th>
			<th>$<%= total %></th>
			</table>
			<form method='post' action='Order.jsp'>
				<input type='text' name='name' placeholder='Name'><br/>
				<input type='hidden' name='add' value='true'>
				<input type='text' name='address' placeholder='Address'><br/>
				<input type='text' name='ccnumber' placeholder='Credit Card Number'><br/>
				<input type='hidden' name='total' value='<%= total %>'><br/>											
				<input type='submit' style='margin-left:0px;' class='btnbuy' value='Pay' href='Order.jsp'></input>
			</form>
			<%
		}else{ %>
			<h4 style='color:red'>Your Cart is empty</h4> <%
		}
		%>
		</div>
	</div>
</div>


<%@include file="includes/site_sidebar.jsp"%>
<%@include file="includes/site_footer.jsp"%>