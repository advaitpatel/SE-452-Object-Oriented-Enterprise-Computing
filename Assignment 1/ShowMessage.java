import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ShowMessage extends HttpServlet 
{
  private String message;
  private String defaultMessage = "No message.";
  private int repeats = 1;
  public String title,name;

  public void init(ServletConfig config)
      throws ServletException 
      {
    // Always call super.init
    super.init(config);

    //ServletConfig name=getServletConfig();  
    name=config.getInitParameter("name");

    //ServletConfig title=getServletConfig();  
    title=config.getInitParameter("title");

    message = config.getInitParameter("message");
    if (message == null) {
      message = defaultMessage;
    }
    try {
      String repeatString = config.getInitParameter("repeats");
      repeats = Integer.parseInt(repeatString);
    } 
    catch(NumberFormatException nfe) 
    {
      
    }
  }
  
  public void doGet(HttpServletRequest request, HttpServletResponse response)  
    throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
      
      
    

    out.println("<HTML><BODY>");
    
    out.println("<center><h2><b>The Show Message Servlet</b></h2></center>");

    for(int i=0; i<repeats; i++) 
    {
        out.print(title + " " + name + "<BR>");
    }  
     
    out.println("</BODY></HTML>");      
    out.close();  
    }  

    
}
