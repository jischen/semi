package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MemberDao;
import beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/id_overlap_check.do")

public class MemberOverlapCheckServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : member_nick , member_phone , member_birth  -----> MemberDto
			req.setCharacterEncoding("UTF-8");
			String request_id = req.getParameter("request_id");
			//처리
			MemberDao mdao = new MemberDao();
			MemberDto member_id = mdao.checkOverlap(request_id);
			
			//출력
			if(member_id != null) {//결과가 있으면(사용이 불가능)
				
				req.setAttribute("request_id",request_id);
				req.getRequestDispatcher("id_overlap_check.jsp?no").forward(req, resp); 
				
				
			}
			else {//결과가 없으면(사용이가능하다)
				req.setAttribute("request_id",request_id);
				req.getRequestDispatcher("id_overlap_check.jsp?ok").forward(req, resp); 
							
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
		
	
	
}
}