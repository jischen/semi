package semi.servlet.ticketing;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MemberDao;
import beans.dao.ShowDao;
import beans.dto.MemberDto;
import beans.dto.ShowDto;
@WebServlet(urlPatterns = "/ticketing/tiecket.do")
public class ticketServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			resp.setCharacterEncoding("UTF-8");
			
			
			
			MemberDto user = (MemberDto)req.getSession().getAttribute("userinfo");
			int point = user.getMember_point() - 8000;
			
			MemberDto user1 = new MemberDto();
			
			user1.setMember_id(user.getMember_id());
			user1.setMember_point(point);
			
			MemberDao mdao = new MemberDao();
			mdao.changePoint(user1);
			

			resp.sendRedirect(req.getContextPath());
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		
		}
		
		
	}
	
	
}
