
<%@page import="java.util.HashMap"%>
<%@include file="site_header.jsp"%>


<% 

String un = (String) session.getAttribute("username");
if(un == null) {
	session.setAttribute("login_msg", "Please Login to Add Reviews");
	response.sendRedirect("Login.jsp");
	return;
}



if (request.getParameterMap().containsKey("name")) { 
	
	String type = request.getParameter("type");
	String name = request.getParameter("name");
	Double price = Double.parseDouble(request.getParameter("price"));
	String image =  request.getParameter("image");
	String retailer =  request.getParameter("retailer");
	String condition =  request.getParameter("condition");
	Double discount =  Double.parseDouble(request.getParameter("discount"));


	if(type.equals("console")) {
		myBeans.Console c = new myBeans.Console(name, price, image, retailer, condition, discount, null);
		if (ProductCatalog.consoles.get(retailer).isEmpty()) {
			HashMap<String, myBeans.Console> toAdd = new HashMap<String,myBeans.Console>();
			toAdd.put(name, c);
			ProductCatalog.consoles.put(retailer, toAdd);
		} else {
			
			ProductCatalog.consoles.get(retailer).put(name,c);
		}
	} else if (type.equals("tablet")) {
		myBeans.Tablet t = new myBeans.Tablet(name, price, image, retailer, condition, discount);
		if (ProductCatalog.tablets.get(retailer).isEmpty()) {
			HashMap<String, myBeans.Tablet> toAdd = new HashMap<String, myBeans.Tablet>();
			toAdd.put(name, t);
			ProductCatalog.tablets.put(retailer, toAdd);
		} else {
			
			ProductCatalog.tablets.get(retailer).put(name,t);
		}
	} else if (type.equals("game")) {
		myBeans.Game g = new myBeans.Game(name, price, image, retailer, condition, discount);
		if (ProductCatalog.games.get(retailer).isEmpty()) {
			HashMap<String, myBeans.Game> toAdd = new HashMap<String, myBeans.Game>();
			toAdd.put(name, g);
			ProductCatalog.games.put(retailer, toAdd);
		} else {
			
			ProductCatalog.games.get(retailer).put(name,g);
		}
	} 
	
	ProductCatalog.writeProductCatalog();
	response.sendRedirect("index.jsp");
	
}
	





%>


<div id='content'>
	<div class='post'>
		<h2 class='title meta'>
			<a style='font-size: 24px;'>New Product</a>
		</h2>
		<div class='entry'>
			
			<form method='post' action='AddProduct.jsp'>
				<select name='type'>
					<option value='game'>Game</option>
					<option value='console'>Console</option>
					<option value='tablet'>Tablet</option>
				</select><br/>								
				<input type='text' name='name' placeholder='Product Name'><br/>
				<input type='text' name='price' placeholder='Product Price'><br/>
				<input type='text' name='image' placeholder='Image File Name'><br/>
				<input type='text' name='retailer' placeholder='Retailer'><br/>												
				<input type='text' name='condition' placeholder='Condition'><br/>
				<input type='text' name='discount' placeholder='Discount'><br/>																		
				<input type='submit' style='margin-left:0px;' class='btnbuy' value='Add' href='AddProduct.jsp'></input>
			</form>		
		</div>
	</div>
</div>


<%@include file="includes/site_sidebar.jsp"%>
<%@include file="includes/site_footer.jsp"%>