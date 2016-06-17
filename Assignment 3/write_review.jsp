

<%@include file="site_header.jsp"%>

<%
    String un = (String) session.getAttribute("username");
    if (un == null) {
        session.setAttribute("login_msg", "Please Login to Add Reviews");
        response.sendRedirect("Login.jsp");
        return;
    }

%>

<%! String type; %>
<%! String product; %>
<%! String consoleParam; %>
<%! String maker;%>

<%    type = request.getParameter("type");
    product = request.getParameter("product");
    consoleParam = "none";
    maker = request.getParameter("maker");
    if (request.getParameterMap().containsKey("consoleParam")) {
        consoleParam = request.getParameter("consoleParam");
    }
%>

<div id='content'>
    <div class='post'>
        <h2 class='title meta'>
            <a style='font-size: 24px;'>New Review</a>
        </h2>
        <div class='entry'>
            <form method='post' action='NewReview.jsp'>
                <input type='hidden' name='type' value='<%= type%>'><br/>
                <input type='hidden' name='product' value='<%= product%>'><br/>
                <input type='hidden' name='consoleParam' value='<%= consoleParam%>'><br/>
                <input type='hidden' name='maker' value='<%= maker%>'><br/>											
                <input type='text' name='productModelName' placeholder='Product'><br/>
                <input type='text' name='productCategory' placeholder='Product Category'><br/>
                <input type='text' name='productPrice' placeholder='Price'><br/>	
                <input type='text' name='retailerName' placeholder='Retailer Name'><br/>												
                <input type='text' name='retailerZip' placeholder='Retailer Zip'><br/>
                <input type='text' name='retailerCity' placeholder='Retailer City'><br/>
                <input type='text' name='retailerState' placeholder='Retailer State'><br/>
                <input type='text' name='productOnSale' placeholder='Product On Sale'><br/>
                <input type='text' name='manufacturerName' placeholder='Manufacturer Name'><br/>
                <input type='text' name='manufacturerRebate' placeholder='Manufacturer Rebate'><br/>
                <input type='text' name='userID' placeholder='Your Name'><br/>
                <input type='text' name='userAge' placeholder='Your Age'><br/>
                <input type='text' name='userGender' placeholder='Your Gender'><br/>
                <input type='text' name='userOccupation' placeholder='Your Occupation'><br/>
                <input type='text' name='reviewRating' placeholder='Rating Out of 5'><br/>
                <input type='text' name='reviewDate' placeholder='Date'><br/>															
                <input type='text' name='reviewText' placeholder='Your Review'><br/>																				
                <input type='submit' style='margin-left:0px;' class='btnbuy' value='Add' href='NewReview.jsp'></input></form>
        </div>
    </div>
</div>


<%@include file="site_sidebar.jsp"%>
<%@include file="site_footer.jsp"%>