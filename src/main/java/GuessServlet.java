import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GuessServlet", urlPatterns = "/guess")
public class GuessServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("guess.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String number = request.getParameter("number");
		request.setAttribute(number, number);

		int min = 1;
		int max = 3;
		int random = (int)(Math.random()*(max-min+1)+min);

		if (number.equals(String.valueOf(random))){
			response.sendRedirect("/correct");
		} else {
			response.sendRedirect("/incorrect");
		}

		System.out.println(random);
//		response.getWriter().println("Your number is: " + number);
	}
}
