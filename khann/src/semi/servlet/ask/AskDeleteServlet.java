package semi.servlet.ask;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.AskDao;

@WebServlet(urlPatterns = "/ask/delete.do")
public class AskDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int ask_no = Integer.parseInt(req.getParameter("ask_no"));
			
			AskDao adao = new AskDao();
			adao.delete(ask_no);
			
			resp.sendRedirect("list.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
