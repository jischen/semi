package semi.servlet.show;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.ShowDao;
import beans.dto.ShowDto;

@WebServlet(urlPatterns = "/show/show_insert.do")
public class ShowInsertServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			req.setCharacterEncoding("UTF-8");

			ShowDto sdto = new ShowDto();
			// 나중에추가
			sdto.setMovie_no(Integer.parseInt(req.getParameter("movie_no")));
			sdto.setTheater_no(Integer.parseInt(req.getParameter("theater_no")));
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
