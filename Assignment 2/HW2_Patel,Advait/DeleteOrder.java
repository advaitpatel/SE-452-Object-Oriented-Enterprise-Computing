
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteOrder")
public class DeleteOrder extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        Helper helper = new Helper(request, pw);

        helper.printHtml("site_header.html");
        helper.printHtml("site_sidebar.html");

        pw.print("<div id='content'><div class='post'><h2 class='title meta'>");
        pw.print("<a style='font-size: 24px;'>Delete Order</a>");
        
        pw.print("</h2><div class='entry'>");
        pw.print("<div id='content'><div class='post'><h2 class='title meta'>");
        pw.println("<h2>We are sorry for that !!");
        pw.println("<h3><a href='Home'>Go to Home Page</a></h3>");
        helper.printHtml("site_footer.html");

        String errmsg = "";
        String orderid = request.getParameter("orderid");
        if (orderid == null || orderid.isEmpty()) {
            errmsg = "Order id is empty!";
        }

        if (errmsg.isEmpty()) {
            HttpSession session = request.getSession();
            OrderItem orderitems = null;

            if (orderitems == null) {
                errmsg = "Sorry !! You have no order!";
            } else {
                Order order = null;

                Calendar c = Calendar.getInstance();

                c.add(Calendar.DATE, -5);
                Date now = new Date();
                int checkOrderValid = now.compareTo(c.getTime());
                if (checkOrderValid > 0) {
                    errmsg = "You can not cancel your order between 5 days " + "<br><h2 style=\"color:red;\"></h2>";
                } else {
                    pw.print("<a style='font-size: 24px;'>Cart("+0+")</a>");
                }
            }

        }

    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
