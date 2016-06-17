
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckOut")
public class GoToBill extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        Helper helper = new Helper(request, pw);
        helper.printHtml("site_header.html");
        helper.printHtml("site_sidebar.html");
        pw.print("<div id='content'><div class='post'><h2 class='title meta'>");
        pw.print("<a style='font-size: 24px;'>Order Details</a>");
        pw.print("</h2><div class='entry'>");

        pw.print("<form action='CheckOut' method='post'><table>"
                + "<tr><td>Total Amount</td><td><input type='number' name='total' readonly='readonly' value='" + helper.getCatTotal() + "'/></td></tr>"
                + "<tr><td>Full Name</td><td><input type='text' name='fullname' required='required'/></td></tr>"
                + "<tr><td>Credit Card Number</td><td><input type='text' name='creditcard' required=required'/></td></tr>"
                + "<tr><td>CVV</td><td><input type='text' name='cvv' required='required'/></td></tr>"
                + "<tr><td>Address Line 1</td><td><input type='text' name='address1' required='required'/></td></tr>"
                + "<tr><td>Address Line 1</td><td><input type='text' name='address2' required='required'/></td></tr>"
                + "<tr><td>Zipcode</td><td><input type='text' name='zipcode' required='required'/></td></tr>"
                + "<tr><td></td><td><input type='submit' name='login' class='buybtn' value='Place Order'></td></tr>"
                + "</table></form>");

        pw.print("</div></div></div>");
        helper.printHtml("site_footer.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        Helper helper = new Helper(request, pw);

        double total = Double.parseDouble(request.getParameter("total"));
        String fullname = request.getParameter("fullname");
        String creditcard = request.getParameter("creditcard");
        String cvv = request.getParameter("cvv");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String zipcode = request.getParameter("zipcode");

        Random r = new Random(System.currentTimeMillis());
        int orderid = 10000 + r.nextInt(20000);

        Calendar now = Calendar.getInstance();
        
        
        OrdersHashMap.orders.get(helper.username()).clear();

        helper.printHtml("site_header.html");
        helper.printHtml("site_sidebar.html");
        pw.print("<div id='content'><div class='post'><h2 class='title'>");
        pw.print("<a style='font-size: 24px;'>Please Confirm your details</a>");

        pw.print("<table>");
        pw.print("<tr>");
        pw.print("<td>Your Order ID is : " + orderid + "</td>");
        pw.print("</tr>");

        pw.print("<tr>");
        pw.print("<td>Your Order Date is : " + (now.get(Calendar.MONTH) + 1)
                        + "-"
                        + now.get(Calendar.DATE)
                        + "-"
                        + now.get(Calendar.YEAR) + "</td>");
        pw.print("</tr>");

        pw.print("<tr>");
        now.add(Calendar.WEEK_OF_YEAR,2);
        pw.print("<td>Your Delivery Date is : " + (now.get(Calendar.MONTH) + 1)
                        + "-"
                        + now.get(Calendar.DATE)
                        + "-"
                        + now.get(Calendar.YEAR) + "</td>");
        pw.print("</tr>");

        pw.print("<tr>");
        pw.print("<td>Your Full Name : " + fullname + "</td>");
        pw.print("</tr>");

        pw.print("<tr>");
        pw.print("<td>Your Credit Card Number : " + creditcard + "</td>");
        pw.print("</tr>");

        pw.print("<tr>");
        pw.print("<td>Your Address : " + address1 + "</br>" + address2 + "</td>");
        pw.print("</tr>");

        pw.print("<tr>");
        pw.print("<td>Your Zipcode : " + zipcode + "</td>");
        pw.print("</tr>");

        pw.print("<tr>");
        pw.print("<td>Your Grand Total is : " + "<h1>" + total + "</td>");
        pw.print("</tr>");
        pw.print("</table>");

        pw.print("</h2><div class='entry'>");
        pw.print("</div></div></div>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");
        pw.print("<br>");

        pw.println("<form action='MakeBill' method='POST'>");
        pw.println("<input type='SUBMIT' value='Make My Bill'>");
        pw.println("</form>");

        pw.print("</div></div></div>");
        helper.printHtml("site_footer.html");
    }

}
