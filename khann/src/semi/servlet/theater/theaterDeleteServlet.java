package semi.servlet.theater;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.TheaterDao;
@WebServlet(urlPatterns = "/theater/delete.do")
public class theaterDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String theater_name = req.getParameter("theater_name");
			
			
			TheaterDao tdao = new TheaterDao();
			tdao.delete(theater_name);
			
			resp.sendRedirect("theater_list.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		
		}
	
	
	}
}
