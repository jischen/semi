package semi.servlet.theater;

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
@WebServlet(urlPatterns = "/theater/insert.do")
public class seatInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			//상영관 정보
			String theater_name = req.getParameter("theater_name");
			String theater_type = req.getParameter("theater_type");
			int theater_row = Integer.parseInt(req.getParameter("theater_row"));
			int theater_col = Integer.parseInt(req.getParameter("theater_col"));
			
			System.out.println("이름"+theater_name);
			System.out.println("타입"+theater_type);
			System.out.println("row"+theater_row);
			System.out.println("col"+theater_col);
			
			
			TheaterDto tdto = new TheaterDto();
			
			tdto.setTheater_name(req.getParameter("theater_name"));
			tdto.setTheater_type(req.getParameter("theater_type"));
			tdto.setTheater_row(Integer.parseInt(req.getParameter("theater_row")));
			tdto.setTheater_col(Integer.parseInt(req.getParameter("theater_col")));
			
			TheaterDao tdao = new TheaterDao();
			tdao.register(tdto);
			
			
			
			
			int theater_no = tdto.getTheater_no();
			
			
			//좌석 정보
			SeatDto sdto = new SeatDto();
			
			String[] seat = req.getParameterValues("seat");
			for(String s : seat) {
				String[] array = s.split("-");
				
//				s에서 row,col번호 얻어온다 
				int row = Integer.parseInt(array[0]) + 1;
				int col = Integer.parseInt(array[1]) + 1;
//				상영관 번호
				int thea_no = theater_no;
				
				System.out.println(thea_no);
				System.out.println(row);
				System.out.println(col);
				
				sdto.setTheater_no(theater_no);
				sdto.setSeat_row(row);
				sdto.setSeat_col(col);
				
				SeatDao sdao = new SeatDao();
				sdao.register(sdto);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
