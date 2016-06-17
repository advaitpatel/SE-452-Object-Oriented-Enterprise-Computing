<%@page import="myBeans.RetailerHashMap"%>
<%@page import="myBeans.Helper"%>
<%
  Helper helper = new Helper(request, null);
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String maker = request.getParameter("maker");
		String access = request.getParameter("access");
		helper.displayProduct(name,type,maker,access,true);		
		
		response.sendRedirect("Account");
		RetailerHashMap.retailers.get(helper.username()).getRetailerItems().remove(name);
		
		return;
		  
%>