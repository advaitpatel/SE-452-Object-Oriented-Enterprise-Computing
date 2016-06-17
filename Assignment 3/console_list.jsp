
<%@page import="myBeans.ConsoleHashMap"%>
<%@page import="myBeans.Console"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@include file="site_header.jsp"%>
<%@include file="site_sidebar.jsp"%>

<%
    String name = null;
    String CategoryName = request.getParameter("maker");
    HashMap<String, Console> hm = new HashMap<String, Console>();
    if (CategoryName == null) {
        hm.putAll(ConsoleHashMap.microsoft);
        hm.putAll(ConsoleHashMap.sony);
        hm.putAll(ConsoleHashMap.nintendo);
        name = "";
    } else if (CategoryName.equals("microsoft")) {
        hm.putAll(ConsoleHashMap.microsoft);
        name = ConsoleHashMap.string_microsoft;
    } else if (CategoryName.equals("sony")) {
        hm.putAll(ConsoleHashMap.sony);
        name = ConsoleHashMap.string_sony;
    } else if (CategoryName.equals("nintendo")) {
        hm.putAll(ConsoleHashMap.nintendo);
        name = ConsoleHashMap.string_nintendo;
    }
%>

<%@include file="site_header.jsp"%>
<%@include file="site_sidebar.jsp"%>



<div id='content'><div class='post'><h2 class='title meta'>
            <a style='font-size: 24px;'>"+name+" Consoles</a>
        </h2><div class='entry'><table id='bestseller'>
                <%
                    int i = 1;
                    int size = hm.size();
                    for (Map.Entry<String, Console> entry : hm.entrySet()) 
                    {
                        Console console = entry.getValue();
                        if (i % 3 == 1) 
                        {
                %>
                <tr>
                    <td><div id='shop_item'>
                            <h3>"<% console.getName();%>"</h3>
                            <strong>"<% console.getPrice();%>"$</strong><ul>
                                <li id='item'><img src='images/consoles/"+console.getImage()+"' alt='' /></li>
                                <li><form method='post' action='Cart'>
                                        <input type='hidden' name='name' value='"+entry.getKey()+"'>
                                        <input type='hidden' name='type' value='consoles'>
                                        <input type='hidden' name='maker' value='"+CategoryName+"'>
                                        <input type='hidden' name='access' value=''>
                                        <input type='submit' class='btnbuy' value='Buy Now'/></form></li>
                                <li><a class='btnbuy' href='accessory_list.jsp?maker="+CategoryName+"&console="+entry.getKey().toString()+"'>View Accessories</a></li>
                                <li><a class='btnreview' href='Review?name="+entry.getKey()+"&type=consoles&maker="+CategoryName+"&access='>Reviews</a></li>
                            </ul></div></td>
                            <%
                            }
                                if (i % 3 == 0 || i == size) {

                                }%>
                </tr>
                <% i++;%>
                }		
            </table></div></div></div>
            <%@include file="site_footer.jsp"%>
%>