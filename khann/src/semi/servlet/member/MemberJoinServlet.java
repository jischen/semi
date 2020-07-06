package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MemberDao;
import beans.dto.MemberDto;



@WebServlet(urlPatterns = "/member/join.do")
public class MemberJoinServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : join.jsp에서 넘어오는 9개의 데이터를 수신 ----> MemberDto 형태로 수신
			//만약 POST 방식으로 전송된다면 유니코드가 깨져서 전달되기 때문에 복구 작업이 필요
			req.setCharacterEncoding("UTF-8");//사용자의 요청을 UTF-8 형태로 복원하라!
			
			MemberDto mdto = new MemberDto();
			mdto.setMember_id(req.getParameter("member_id"));
			mdto.setMember_pw(req.getParameter("member_pw"));
			mdto.setMember_name(req.getParameter("member_name"));
			mdto.setPost(req.getParameter("post"));
			mdto.setBase_addr(req.getParameter("base_addr"));
			mdto.setExtra_addr(req.getParameter("extra_addr"));
			mdto.setMember_birth(req.getParameter("member_birth"));
			mdto.setMember_phone(req.getParameter("member_phone"));
			
			//처리 : MemberDao를 이용한 데이터베이스 등록
			MemberDao mdao = new MemberDao();
			mdao.join(mdto);
			
			//출력 : 이곳에서 하는 것이 아니라 다른 JSP 파일로 강제 이동(redirect)
			resp.sendRedirect("join_result.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}





