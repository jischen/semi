package semi.servlet.show;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.ShowDao;

@WebServlet(urlPatterns = "/show/show_delete.do")
public class ShowDeleteServelt extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			int show_no = Integer.parseInt(req.getParameter("show_no"));

			ShowDao sdao = new ShowDao();
			sdao.delete(show_no);

			resp.sendRedirect("show_list.jsp");

		}

		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);

		}
	}

}
