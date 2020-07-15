package semi.servlet.ticketing;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MemberDao;
import beans.dao.MovieDao;
import beans.dao.SeatDao;
import beans.dao.TicketingDao;
import beans.dto.MemberDto;
import beans.dto.MovieDto;
import beans.dto.TicketingDto;
@WebServlet(urlPatterns = "/ticketing/ticketing.do")
public class ticketingServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			int theater_no = Integer.parseInt(req.getParameter("theater_no"));
			int show_no = Integer.parseInt(req.getParameter("show_no"));
			
			//좌석 번호
			String[] seat = req.getParameterValues("seat");
			// 좌석 번호 저장 배열
			
			SeatDao sdao = new SeatDao();
			List<Integer> seat_no = new ArrayList<>();
			
			for(String s : seat) {
				String[] array = s.split("-");
			
				int row = Integer.parseInt(array[0]);
				int col = Integer.parseInt(array[1]);
			
				seat_no.add(sdao.seatChoice(theater_no, row, col));
			}
			
			
			System.out.println(seat_no);
			
			
			
			
			MemberDto user = (MemberDto)req.getSession().getAttribute("userinfo");
			
//			System.out.println(user);
//			System.out.println("member_no : " + user.getMember_no());
//			System.out.println("show_no : " + show_no);
			
			
			TicketingDto tdto; 
			for(int i =0; i < seat_no.size(); i++){
			tdto  = new TicketingDto();
			tdto.setMember_no(user.getMember_no());
			tdto.setShow_no(show_no);
			tdto.setSeat_no(seat_no.get(i));
			tdto.setTicketing_peoplenum(seat_no.size());
			
			TicketingDao tdao = new TicketingDao();
			tdao.register(tdto);
			
			}
			
			
			resp.sendRedirect("finishTicketing.jsp");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
				
		}
	}
	
}
