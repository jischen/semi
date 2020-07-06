package semi.servlet.seat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.SeatDao;
import beans.dao.TheaterDao;
import beans.dto.SeatDto;
import beans.dto.TheaterDto;

@WebServlet(urlPatterns = "/seat/seat_register.do")
public class SeatRegisterServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		resp.setCharacterEncoding("UTF-8");
		
		SeatDto sdto = new SeatDto();
		sdto.setSeat_no(Integer.parseInt(req.getParameter("seat_no")));
		sdto.setSeat_type(req.getParameter("seat_type"));
		sdto.setSeat_row(req.getParameter("seat_row"));
		sdto.setSeat_col(Integer.parseInt(req.getParameter("seat_col")));
		
		SeatDao sdao = new SeatDao();
		sdao.register(sdto);
		
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
