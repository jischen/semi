package semi.servlet.theater;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.TheaterDao;
import beans.dto.TheaterDto;
@WebServlet(urlPatterns = "/theater/theater_insert.do")
public class ThearterInsertServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			TheaterDto tdto = new TheaterDto();
			
			tdto.setTheater_name(req.getParameter("theater_name"));
			tdto.setTheater_type(req.getParameter("theater_type"));
			tdto.setTheater_row(Integer.parseInt(req.getParameter("theater_row")));
			tdto.setTheater_col(Integer.parseInt(req.getParameter("theater_col")));
			
			TheaterDao tdao = new TheaterDao();
			
			tdao.register(tdto);
			
			req.getSession().setAttribute("theater", tdto);
			
			resp.sendRedirect(req.getContextPath());
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		
		}
	}
}
