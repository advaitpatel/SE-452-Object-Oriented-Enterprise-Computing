<%@include import="java.util.HashMap"%>
<%@include file="site_header.jsp"%>

<%! String username; %> 
<%! String password; %>
<%! String repassword; %> 
<%! String usertype; %>
<%! String errorMessage; %>


<% if (request.getParameterMap().containsKey("Register")) {

	username = request.getParameter("username");
	password = request.getParameter("password");
	repassword = request.getParameter("repassword");
	usertype = request.getParameter("usertype");
	
	
	if(!password.equals(repassword)){
		errorMessage = "Passwords Do not Match!";
		response.sendRedirect("Register.jsp?errorMessage="+errorMessage); 
	} else {
		HashMap<String, utils.User> hm = new HashMap<String, utils.User>();
		if (usertype.equals("customer")) {
			hm.putAll(UserList.customer);
		} else if (usertype.equals("retailer")) {
			hm.putAll(UserList.retailer);
		} else if (usertype.equals("manager")) {
			hm.putAll(UserList.manager);
		}
		
		if(hm.containsKey(username)){ 
			errorMessage = "Username already exist as " + usertype;
			response.sendRedirect("Register.jsp?errorMessage="+errorMessage); 
		} else{
			utils.User user = new utils.User(username,password,usertype);
			if (usertype.equals("customer")) {
				UserList.addCustomer(username, user);
			} else if (usertype.equals("retailer")) {
				UserList.addRetailer(username, user);
			} else if (usertype.equals("manager")) {
				 UserList.addManager(username, user);
			}

			UserList.writeUserList();			
			session.setAttribute("login_msg", "Your "+usertype+" account has been created. Please login");
			response.sendRedirect("Login.jsp"); 
			return;
			
		}
	}	

}
%>
<div class='post' style='float: none; width: 100%'>
	<h2 class='title meta'><a style='font-size: 24px;'>Login</a></h2>
	<div class='entry'>
		<div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
		<% if (request.getParameterMap().containsKey("errorMessage")) { %>
			<h4 style='color:red'><%= request.getParameter("errorMessage") %></h4>
			
		<%  } %>	
			
		<form method='post' action='Register.jsp'>
			<table style='width:100%'><tr><td>
				<h3>Username</h3>
			</td>
			<td>
				<input type='text' name='username' value='' class='input' required></input>
				<input type='hidden' name='Register' value='true'></input>
			</td>
		</tr>
		<tr>
			<td>
				<h3>Password</h3>
			</td>
			<td>
				<input type='password' name='password' value='' class='input' required></input>
			</td>
		</tr>
		<tr>
			<td>
				<h3>Re-Password</h3>
			</td>
			<td>
				<input type='password' name='repassword' value='' class='input' required></input>
			</td>
		</tr>
		<tr>
			<td>
				<h3>User Type</h3>
			</td>
			<td>
				<select name='usertype' class='input'>
					<option value='customer' selected>Customer</option>
					<option value='manager'>Store Manager</option>
					<option value='retailer'>Salesman</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<input type='submit' class='btnbuy' name='ByUser' value='Create User' style='float: right;height: 20px ;margin: 20px; margin-right: 10px;'></input>
			</td>
		</tr>
		</table>
		</form>
	</div>
</div>
</div>


<%@include file="includes/site_footer.jsp"%>