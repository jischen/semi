package semi.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.AskDao;
import beans.dao.ReplyDao;
import beans.dto.AskDto;
import beans.dto.MemberDto;
import beans.dto.ReplyDto;

@WebServlet(urlPatterns = "/ask/reply_edit.do")
public class ReplyEditServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			
			ReplyDto rdto = new ReplyDto();
			rdto.setReply_origin(Integer.parseInt(req.getParameter("reply_origin")));
			rdto.setReply_writer(mdto.getMember_id());
			rdto.setReply_content(req.getParameter("reply_content"));
			
			ReplyDao rdao = new ReplyDao();
			rdao.edit(rdto);
			
			AskDao adao = new AskDao();
			adao.editReplycount(rdto.getReply_origin());
		
			resp.sendRedirect("reply_edit.jsp?ask_no="+rdto.getReply_origin());
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
