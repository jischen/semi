package semi.servlet.theater;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.TheaterDao;
import beans.dto.TheaterDto;

@WebServlet(urlPatterns = "/theater/theater_register.do")
public class TheaterRegisterServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		resp.setCharacterEncoding("UTF-8");
		
		TheaterDto tdto = new TheaterDto();
		tdto.setTheater_no(Integer.parseInt((req.getParameter("theater_no"))));
		tdto.setTheater_name(req.getParameter("theater_name"));
		tdto.setTheater_type(req.getParameter("theater_type"));
		tdto.setTheater_row(Integer.parseInt((req.getParameter("theater_row"))));
		tdto.setTheater_col(Integer.parseInt((req.getParameter("theater_col"))));
		
		TheaterDao tdao = new TheaterDao();
		tdao.register(tdto);
		
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
