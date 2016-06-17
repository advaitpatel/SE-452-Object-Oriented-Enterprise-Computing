
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="includes/site_header.jsp"%>

<%! String name = null;  %>
<%! String makerName = null;  %>
<%! HashMap<String, myBeans.Tablet> tabletMap = new HashMap<String, utils.Tablet>();  %>
<%! HashMap<String, HashMap> hm = new HashMap<String, HashMap>();		%>


<%
makerName = request.getParameter("maker");


if(makerName==null) {
	hm = ProductCatalog.tablets;
	name = "All";
} else {
	tabletMap = ProductCatalog.tablets.get(makerName);
	name = makerName;
} 

%>

<div id='content'>
	<div class='post'>
		<h2 class='title meta'>
			<a style='font-size: 24px;'><%= name %> Tablets</a>
		</h2>
	<div class='entry'>
		<table id='bestseller'>
			<%
			if (name != "All") { 
				int i = 1; 
				int size = tabletMap.size();
				for(Map.Entry<String, utils.Tablet> entry : tabletMap.entrySet()) {
					utils.Tablet tablet = entry.getValue();
					if(i%3==1) { %>
						<tr>
					<% }%>
					<td>
						<div id='shop_item'>
							<h3><%= tablet.getName() %></h3>
							<strong>$<%= tablet.getPrice()%></strong>
							<ul>
								<li id='item'>
									<img src='assets/images/tablets/<%=tablet.getImage()%>' alt='' />
								</li>
								<li>
									<form method='post' action='Cart.jsp'>
										<input type='hidden' name='name' value='<%= tablet.getName() %>'>
										<input type='hidden' name='price' value='<%= tablet.getPrice() %>'>
										<input type='hidden' name='add' value='true'>
										<input type='hidden' name='retailer' value='<%= tablet.getRetailer() %>'>
										<input type='submit' class='btnbuy' value='Buy Now' href='Cart.jsp'></input>
									</form>
								</li>
								<li>
									<a class='btnreview' href='Reviews.jsp?product=<%= entry.getKey() %>&type=tablet&maker=<%= tablet.getRetailer() %>'>Reviews</a>
								</li>
							</ul>
						</div>
					</td>
					
			<%
					if(i%3==0 || i == size){
						%> </tr> <%
					 }
					i++;
					}
		
			} else {
		        for(Map.Entry<String,HashMap> c : hm.entrySet()) {
					HashMap<String, myBeans.Tablet> tabletMaker = c.getValue();
					int i = 1; 
					int size = tabletMaker.size();
					for(Map.Entry<String, utils.Tablet> entry : tabletMaker.entrySet()){
						utils.Tablet tablet = entry.getValue();
						if(i%3==1) { %>
							<tr>
						<% }%>
						<td>
							<div id='shop_item'>
								<h3><%= tablet.getName() %></h3>
								<strong>$<%= tablet.getPrice()%></strong>
								<ul>
									<li id='item'>
										<img src='assets/images/tablets/<%=tablet.getImage()%>' alt='' />
									</li>
									<li>
										<form method='post' action='Cart.jsp'>
											<input type='hidden' name='name' value='<%= tablet.getName() %>'>
											<input type='hidden' name='price' value='<%= tablet.getPrice() %>'>
											<input type='hidden' name='add' value='true'>
											<input type='hidden' name='retailer' value='<%= tablet.getRetailer() %>'>
											<input type='submit' class='btnbuy' value='Buy Now' href='Cart.jsp'></input>
										</form>
									</li>
									<li>
										<a class='btnreview' href='Reviews.jsp?product=<%= entry.getKey() %>&type=tablet&maker=<%= tablet.getRetailer() %>'>Reviews</a>
									</li>
								</ul>
							</div>
						</td>
					
				<%
						if(i%3==0 || i == size){
							%> </tr> <%
						 }
						i++;
					}

		        }
			}
			%>
							
			</table>
		</div>
	</div>
</div>
<%@include file="includes/site_sidebar.jsp"%>
<%@include file="includes/site_footer.jsp"%>