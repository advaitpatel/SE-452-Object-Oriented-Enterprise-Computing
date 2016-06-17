<%@include file="site_header.jsp"%>

<% 

session.removeAttribute("username");
session.removeAttribute("usertype");
response.sendRedirect("index.jsp");

%>