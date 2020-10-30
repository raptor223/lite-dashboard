package ai.ementalist;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ai.ementalist.queries.Covid19;


@WebServlet("/api")
public class Api extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Api() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		
		String action = request.getParameter("action");

		switch (action.toLowerCase()) {
			case "get_bundeslands_list":
				out.print(new Covid19(out, request).get_bundeslands_list());			
				break;
	
			default:
				out.print("Unknown Request");
				break;	
		}		
	}

}
