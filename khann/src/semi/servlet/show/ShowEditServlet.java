package semi.servlet.show;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.ShowDao;
import beans.dto.ShowDto;

@WebServlet(urlPatterns = "/show/show_edit.do")
public class ShowEditServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setCharacterEncoding("UTF-8");

			ShowDto sdto = new ShowDto();

			sdto.setShow_no(Integer.parseInt(req.getParameter("show_no")));
			sdto.setMovie_no(Integer.parseInt(req.getParameter("movie_no")));
			sdto.setTheater_no(Integer.parseInt(req.getParameter("theater_no")));
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
