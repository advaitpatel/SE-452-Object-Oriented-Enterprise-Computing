/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Advait
 */
public class MakeBill extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        Helper helper = new Helper(request, pw);

        helper.printHtml("site_header.html");
        helper.printHtml("site_sidebar.html");
        pw.print("<div id='content'><div class='post'><h2 class='title'>");
        pw.print("<a style='font-size: 24px;'>Payment Received.....</a>");
        pw.println("<a href='Home'>Go to Home</a>");
        pw.print("</h2><div class='entry'>");
        pw.print("</div></div></div>");
        helper.printHtml("site_footer.html");

    }

}
