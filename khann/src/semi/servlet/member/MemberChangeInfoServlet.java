package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MemberDao;
import beans.dto.MemberDto;


@WebServlet(urlPatterns = "/member/change_info.do")
public class MemberChangeInfoServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 :
			// - 세션 : member_id
			// - 파라미터 : member_nick, post, base_addr, extra_addr, member_phone, member_intro
			req.setCharacterEncoding("UTF-8");
			
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();
			
			MemberDto user = new MemberDto();
			user.setMember_id(member_id);
			user.setPost(req.getParameter("post"));
			user.setBase_addr(req.getParameter("base_addr"));
			user.setExtra_addr(req.getParameter("extra_addr"));
			user.setMember_phone(req.getParameter("member_phone"));
			
			//처리
			MemberDao mdao = new MemberDao();
			mdao.changeInfo(user);
			
			//출력
			resp.sendRedirect("info.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}		
}




