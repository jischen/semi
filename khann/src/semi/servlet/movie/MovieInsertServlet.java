package semi.servlet.movie;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MovieDao;
import beans.dto.MovieDto;

@WebServlet(urlPatterns = "/movie/insert.do")
public class MovieInsertServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		req.setCharacterEncoding("UTF-8");
		MovieDto mdto = new MovieDto();
		
		mdto.setMovie_name(req.getParameter("movie_name"));
		mdto.setMovie_type(req.getParameter("movie_type"));
		mdto.setMovie_age(req.getParameter("movie_age"));
		mdto.setMovie_runtime(req.getParameter("movie_runtime"));
		mdto.setMovie_open(req.getParameter("movie_open"));
		mdto.setMovie_director(req.getParameter("movie_director"));
		mdto.setMovie_ac(req.getParameter("movie_ac"));
		mdto.setMovie_content(req.getParameter("movie_content"));
		
		
		MovieDao mdao = new MovieDao();
	
		
		mdao.insert(mdto);
		
		resp.sendRedirect("movie_chart.jsp");
	
		
	} catch (Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
	}
}
