package semi.servlet.show;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MovieDao;
import beans.dao.ShowDao;
import beans.dao.TheaterDao;
import beans.dto.MovieDto;
import beans.dto.ShowDto;
import beans.dto.TheaterDto;

@WebServlet(urlPatterns = "/show/show_edit.do")
public class ShowEditServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setCharacterEncoding("UTF-8");

			String movie_name = req.getParameter("movie_name");
			String theater_name = req.getParameter("theater_name");
			
			MovieDao mdao = new MovieDao();
			MovieDto mdto = mdao.getMovieno(movie_name);
			
			
			TheaterDao tdao = new TheaterDao();
			TheaterDto tdto = tdao.getTheaterNo(theater_name);
			
			
			
			ShowDto sdto = new ShowDto();
			sdto.setShow_no(Integer.parseInt(req.getParameter("show_no")));
			sdto.setMovie_no(mdto.getMovie_no());
			sdto.setTheater_no(tdto.getTheater_no());
			sdto.setShow_start(req.getParameter("show_start"));

			ShowDao sdao = new ShowDao();
			sdao.showedit(sdto);

			resp.sendRedirect("show_list.jsp");

		}

		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
