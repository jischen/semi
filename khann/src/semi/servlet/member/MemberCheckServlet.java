package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MemberDao;
import beans.dto.MemberDto;


@WebServlet(urlPatterns = "/member/check.do")
public class MemberCheckServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 비밀번호를 검사하는 서블릿
			// 입력 : 비밀번호(member_pw), 아이디(member_id) , 목적지 주소(go)
			// - 비밀번호는 사용자가 입력했으므로 "파라미터"에서 찾는다
			// - 아이디는 로그인한 사용자의 정보가 들어있는 "세션" 데이터에서 찾는다
			// - 목적지 주소는 "인증이 성공한 경우" 보낼 페이지의 정보를 가지고 있다
			// - 인증이 실패할 경우는 "check.jsp"로 목적지 정보와 함께 전달해야 한다

			String go = req.getParameter("go");// 목적 페이지 주소
			String member_id2 = req.getParameter("member_id");
			String member_pw = req.getParameter("member_pw");

			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();

			// 기능을 신규로 만들지 말고 기존에 작성해 둔 login을 이용하여 검사
			MemberDao mdao = new MemberDao();
			MemberDto user = new MemberDto();// 새로운 DTO를 만들고
			user.setMember_id(member_id);// 아이디 설정하고
			user.setMember_pw(member_pw);// 비밀번호 설정하고
			MemberDto result = mdao.Login(user);// 로그인 부탁

			if (result == null) {// 인증 실패(로그인 실패)
				resp.sendRedirect("check.jsp?error&go=" + go);
			} else {// 인증 성공(로그인 성공)
			
				resp.sendRedirect(go);// go에 들어있는 주소로 redirect 해라!
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}