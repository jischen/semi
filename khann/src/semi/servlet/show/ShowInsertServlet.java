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

@WebServlet(urlPatterns = "/show/show_insert.do")
public class ShowInsertServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			req.setCharacterEncoding("UTF-8");
			
			
			
			String movie_name = req.getParameter("movie_name");
			String theater_name = req.getParameter("theater_name");
			
			MovieDao mdao = new MovieDao();
			MovieDto mdto = mdao.getMovieno(movie_name);
			
			
			TheaterDao tdao = new TheaterDao();
			TheaterDto tdto = tdao.getTheaterNo(theater_name);
			
			
			ShowDto sdto = new ShowDto();
			// 나중에추가;
			sdto.setMovie_no(mdto.getMovie_no());
			sdto.setTheater_no(tdto.getTheater_no());
			sdto.setShow_start(req.getParameter("show_start"));
			ShowDao sdao = new ShowDao();

			sdao.insert(sdto);

			resp.sendRedirect("show_content.jsp?show_no=" + (sdao.Sequen() - 1)); // 나중에추가

		} catch (Exception e) {

			e.printStackTrace();
			resp.sendError(500);

		}

	}

}
