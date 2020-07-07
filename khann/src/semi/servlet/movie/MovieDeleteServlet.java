package semi.servlet.movie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MovieDao;
@WebServlet(urlPatterns = "/movie/delete.do")
public class MovieDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String movie_name = req.getParameter("movie_name");
			
			
			MovieDao mdao = new MovieDao();
			mdao.delete(movie_name);
			
			resp.sendRedirect("movie_chart.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		
		}
	
	
	}
}
