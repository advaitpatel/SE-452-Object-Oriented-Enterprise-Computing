
<%@page import="java.util.Map"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="myBeans.Helper"%>
<%@page import="myBeans.GameHashMap"%>
<%@page import="myBeans.Game"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashMap"%>
<%
    String name = null;
    PrintWriter pw = response.getWriter();
    String CategoryName = request.getParameter("maker");
    HashMap<String, Game> hm = new HashMap<String, Game>();

    if (CategoryName == null) {
        hm.putAll(GameHashMap.electronicArts);
        hm.putAll(GameHashMap.activision);
        hm.putAll(GameHashMap.takeTwoInteractive);
        name = "";
    } else if (CategoryName.equals("electronicArts")) {
        hm.putAll(GameHashMap.electronicArts);
        name = GameHashMap.string_electronicArts;
    } else if (CategoryName.equals("activision")) {
        hm.putAll(GameHashMap.activision);
        name = GameHashMap.string_activision;
    } else if (CategoryName.equals("takeTwoInteractive")) {
        hm.putAll(GameHashMap.takeTwoInteractive);
        name = GameHashMap.string_takeTwoInteractive;
    }
    Helper helper = new Helper(request, pw);
%>

<%@include file="site_header.jsp"%>
<%@include file="site_sidebar.jsp"%>

<div id='content'>
	<div class='post'>
		<h2 class='title meta'>
			<a style='font-size: 24px;'><%= name %> Games</a>
		</h2>
	<div class='entry'>
		<table id='bestseller'>
			<%
			if (name != "All") { 
				int i = 1; 
				int size = gameMap.size();
				for(Map.Entry<String, utils.Game> entry : gameMap.entrySet()) {
					utils.Game game = entry.getValue();
					if(i%3==1) { %>
						<tr>
					<% }%>
					<td>
						<div id='shop_item'>
							<h3><%= game.getName() %></h3>
							<strong>$<%= game.getPrice()%></strong>
							<ul>
								<li id='item'>
									<img src='assets/images/games/<%=game.getImage()%>' alt='' />
								</li>
								<li>
									<form method='post' action='Cart.jsp'>
										<input type='hidden' name='name' value='<%= game.getName() %>'>
										<input type='hidden' name='price' value='<%= game.getPrice() %>'>
										<input type='hidden' name='add' value='true'>
										<input type='hidden' name='retailer' value='<%= game.getRetailer() %>'>
										<input type='submit' class='btnbuy' value='Buy Now' href='Cart.jsp'></input>
									</form>
								</li>
								<li>
									<a class='btnreview' href='Reviews.jsp?product=<%= entry.getKey() %>&type=game&maker=<%= game.getRetailer() %>'>Reviews</a>
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
					HashMap<String, utils.Game> gameMaker = c.getValue();
					int i = 1; 
					int size = gameMaker.size();
					for(Map.Entry<String, utils.Game> entry : gameMaker.entrySet()){
						utils.Game game = entry.getValue();
						if(i%3==1) { %>
							<tr>
						<% }%>
						<td>
							<div id='shop_item'>
								<h3><%= game.getName() %></h3>
								<strong>$<%= game.getPrice()%></strong>
								<ul>
									<li id='item'>
										<img src='assets/images/games/<%=game.getImage()%>' alt='' />
									</li>
									<li>
										<form method='post' action='Cart.jsp'>
											<input type='hidden' name='name' value='<%= game.getName() %>'>
											<input type='hidden' name='add' value='true'>
											<input type='hidden' name='price' value='<%= game.getPrice() %>'>
											<input type='hidden' name='retailer' value='<%= game.getRetailer() %>'>
											<input type='submit' class='btnbuy' value='Buy Now' href='Cart.jsp'></input>
										</form>
									</li>
									<li>
										<a class='btnreview' href='Reviews.jsp?product=<%= entry.getKey() %>&type=game&maker=<%= game.getRetailer() %>'>Reviews</a>
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

<%@include file="includes/site_footer.jsp"%>