package semi.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/member/logout.do")
public class MemberLogoutServlet extends HttpServlet{

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//할 일 : 세션의 "userinfo"삭제 및 index.jsp로 redirect
		req.getSession().removeAttribute("userinfo");//항목삭제
	
		resp.sendRedirect(req.getContextPath());
	}
}
