import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ViewCountServlet", urlPatterns = "/count")
public class ViewCountServlet extends HttpServlet {
	int count = 0;
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String reset = req.getParameter("reset");

			count++;
			out.println("<h1>View Count: " + count + "</h1>");

			if (reset.equals("reset")){
			count = 0;
			res.sendRedirect("/count");
		}
	}
}
