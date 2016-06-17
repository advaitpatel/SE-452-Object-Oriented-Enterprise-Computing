
<%@page import="myBeans.OrdersHashMap"%>
<%@page import="myBeans.RetailerHashMap"%>
<%@page import="myBeans.TabletHashMap"%>
<%@page import="myBeans.UserHashMap"%>
<%@page import="myBeans.GameHashMap"%>
<%@page import="myBeans.Accessory"%>
<%@page import="myBeans.ConsoleHashMap"%>
<%@page import="myBeans.Console"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>

<%
    String CategoryName = request.getParameter("maker");
    String ConsoleName = request.getParameter("console");
    HashMap<String, Console> hm = new HashMap<String, Console>();
    if (CategoryName.equals("microsoft")) {
        hm.putAll(ConsoleHashMap.microsoft);
    } else if (CategoryName.equals("sony")) {
        hm.putAll(ConsoleHashMap.sony);
    } else if (CategoryName.equals("nintendo")) {
        hm.putAll(ConsoleHashMap.nintendo);
    }

   Console console = hm.get(ConsoleName);
   if(console==null)
   {
       System.out.println("its null");
   }
System.out.println(console.toString());
%>
<%@include file="site_header.jsp"%>
<%@include file="site_sidebar.jsp"%>

<div id='content'><div class='post'><h2 class='title meta'>
            <a style='font-size: 24px;'>
                "<% console.getName(); %>": Accessories</a>
        </h2><div class='entry'><table id='bestseller'>

                <%
                    int i = 1;
                    int size = hm.size();
                    for (Map.Entry<String, Accessory> entry : console.getAccessories().entrySet()) {
                        Accessory accessory = entry.getValue();
                        if (i % 3 == 1) {
                %> 
                <tr>
                    <%
                        }
                    %>
                    <td><div id='shop_item'>
                            <h3>"<%=accessory.getName()%>"</h3>
                            <strong>"<%=accessory.getPrice()%>"$</strong><ul>
                                <li id='item'><img src='images/accessories/"<%=accessory.getImage()%>"' alt='' /></li>
                                <li><form method='post' action='Cart'>
                                        <input type='hidden' name='name' value='"<%=entry.getKey()%>"'>
                                        <input type='hidden' name='type' value='accessories'>
                                        <input type='hidden' name='maker' value='"<%=CategoryName%>"'>
                                        <input type='hidden' name='access' value='"<%=ConsoleName%>"'>
                                        <input type='submit' class='btnbuy' value='Buy Now'/>  
                                    </form>
                                </li>
                                <li><a class='btnreview' href='Review?name=<%=entry.getKey()%>&type=accessories&maker=<%=CategoryName%>
                                       &access=<%=ConsoleName%>'>Reviews</a></li>
                            </ul></div></td>
                          
                            <% if(i%3==0 || i == size) %> </tr>
			<%i++;%>
                <%}%>
            </table></div></div></div>

<%@include file="site_footer.jsp"%>

