package semi.servlet.ask;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.AskDao;
import beans.dto.AskDto;
import beans.dto.MemberDto;

@WebServlet(urlPatterns = "/ask/write.do")
public class AskWriteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			MemberDto mdto = (MemberDto)req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id(); 

			AskDto adto = new AskDto();
			adto.setAsk_title(req.getParameter("ask_title"));
			adto.setAsk_head(req.getParameter("ask_head"));
			adto.setAsk_writer(member_id);
			adto.setAsk_content(req.getParameter("ask_content"));
			
			AskDao adao = new AskDao();
			int ask_no = adao.getSeqeunce();
			adto.setAsk_no(ask_no);
			adao.write(adto);
		
			resp.sendRedirect("content.jsp?ask_no="+ask_no);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
