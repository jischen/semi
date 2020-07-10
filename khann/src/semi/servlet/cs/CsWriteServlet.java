package semi.servlet.cs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.CsDao;
import beans.dao.MovieDao;
import beans.dto.CsDto;
import beans.dto.MemberDto;

@WebServlet(urlPatterns = "/cs/write.do")
public class CsWriteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			MemberDto mdto = (MemberDto)req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id(); 
			
			CsDto cdto = new CsDto();
			cdto.setCs_title(req.getParameter("cs_title"));
			cdto.setCs_writer(member_id);
			cdto.setCs_content(req.getParameter("cs_content"));

			
			CsDao cdao = new CsDao();
			int cs_no = cdao.getSeqeunce();
			cdto.setCs_no(cs_no);
			cdao.write(cdto);
		
			resp.sendRedirect("content.jsp?cs_no="+cs_no);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
