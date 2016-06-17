import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/** Very simplistic servlet that generates plain text.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2000 Marty Hall; may be freely used or adapted.
 */

public class MakeTable extends HttpServlet 
{

	private PrintWriter out;
	private int repeats = 1;

	public void init(ServletConfig config)
      throws ServletException 
    {
	    // Always call super.init
	    super.init(config);
	    
	    try {
	      String repeatString = config.getInitParameter("repeats");
	      repeats = Integer.parseInt(repeatString);
	    } 
	    catch(NumberFormatException nfe) 
	    {
	      
	    }
  	}

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();

		ServletConfig config1=getServletConfig();  
    	String row=config1.getInitParameter("row");

    	ServletConfig config2=getServletConfig();  
    	String column=config2.getInitParameter("column");

    	out.println("<HTML><BODY>");

		out.print("<h2>Make Table</h2>");
		out.print("<table border = '1px solid' style = 'border-collapse:collapse'>");
		for(int i=1; i<=repeats; i++) 
		{
			out.print("<tr>");
			for(int p=1; p<4;p++) 
			{
				out.print("<td> Row  "+i+", Column  "+p+"</td>");
			}
			out.print("</tr>");
		}
		out.print("</table>");

		out.println("</BODY></HTML>");      
    	out.close(); 
	}

	
}
