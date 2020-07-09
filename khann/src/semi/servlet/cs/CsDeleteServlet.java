package semi.servlet.cs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.CsDao;
import beans.dto.CsDto;

@WebServlet(urlPatterns = "/cs/delete.do")
public class CsDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int cs_no = Integer.parseInt(req.getParameter("cs_no"));
			
			CsDao cdao = new CsDao();
			cdao.delete(cs_no);
			
			resp.sendRedirect("list.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
