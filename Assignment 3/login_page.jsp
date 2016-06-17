<%@page import="java.util.HashMap"%>
<%@include file="includes/site_header.jsp"%>

<%! String username; %> 
<%! String password; %> 
<%! String usertype; %>

<% 

if (request.getParameterMap().containsKey("LogIn")) {
	username = request.getParameter("username");
	password = request.getParameter("password");
	usertype = request.getParameter("usertype");


	HashMap<String, myBeans.User> hm = new HashMap<String, myBeans.User>();
	if (usertype.equals("customer")) {
		hm.putAll(UserList.customer);
	} else if (usertype.equals("retailer")) {
		hm.putAll(UserList.retailer);
	} else if (usertype.equals("manager")) {
		hm.putAll(UserList.manager);
	}
	myBeans.User user = hm.get(username);
	if(user!=null){
	String user_password = user.getPassword();
	if (password.equals(user_password)) {
	
		session.setAttribute("username", user.getName());
		session.setAttribute("usertype", user.getUsertype());

		response.sendRedirect("index.jsp");
		return;
		}
	}
	
	response.sendRedirect("Login.jsp?error=true");
	
}


%>


<div class='post' style='float: none; width: 100%'>
	<h2 class='title meta'><a style='font-size: 24px;'>Login</a></h2>
	<div class='entry'>
		<div style='width:400px; margin:25px; margin-left: auto;margin-right: auto;'>
<%
if (request.getParameterMap().containsKey("error")) {
		%> <h4 style='color:red'>Username/Password combination is invalid.</h4> <%
}

if(session.getAttribute("login_msg")!=null){			
	%><h4 style='color:red'><%= session.getAttribute("login_msg") %></h4><%
	session.removeAttribute("login_msg");
}
%>


			<form method='post' action='Login.jsp'>
				<table style='width:100%'>
					<tr>
						<td>
							<h3>Username</h3>
						</td>
						<td>
							<input type='text' name='username' value='' class='input' required></input>
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
							<h3>User Type</h3>
						</td>
						<td>
							<select name='usertype' class='input'>
								<option value='customer' selected>Customer</option>
								<option value='manager'>Store Manager</option><option value='retailer'>Salesman</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<input type='hidden' name='LogIn' value='true'></input>
						</td>
						<td>
							<input type='submit' class='btnbuy' value='Login' style='float: right;height: 20px ;margin: 20px; margin-right: 10px;'></input>
						</td>
					</tr>
					<tr>
						<td>
							
						</td>
						<td>
							<strong><a class='' href='Register.jsp' style='float: right;height: 20px; margin: 20px;'>Sign Up</a></strong>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>


 
<%@include file="includes/site_footer.jsp"%>