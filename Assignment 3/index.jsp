
<%@page import="myBeans.OrdersHashMap"%>
<%@page import="myBeans.RetailerHashMap"%>
<%@page import="myBeans.TabletHashMap"%>
<%@page import="myBeans.UserHashMap"%>
<%@page import="myBeans.GameHashMap"%>
<%@page import="myBeans.ConsoleHashMap"%>
<%@include file="site_header.jsp"%>
<%@include file="site_home.jsp"%>
<%@include file="site_sidebar.jsp"%>
<%@include file="site_footer.jsp"%>
<%
    new ConsoleHashMap();
    new GameHashMap();
    new UserHashMap();
    new TabletHashMap();
    new RetailerHashMap();
    new OrdersHashMap();
%>