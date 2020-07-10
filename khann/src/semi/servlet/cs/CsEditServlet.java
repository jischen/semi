package semi.servlet.cs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.CsDao;
import beans.dto.CsDto;
import beans.dto.MemberDto;

@WebServlet(urlPatterns = "/cs/edit.do")
public class CsEditServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
							
			CsDto cdto = new CsDto();
			cdto.setCs_no(Integer.parseInt(req.getParameter("cs_no")));
			cdto.setCs_head(req.getParameter("cs_head"));
			cdto.setCs_title(req.getParameter("cs_title"));
			cdto.setCs_content(req.getParameter("cs_content"));

			CsDao cdao = new CsDao();
			cdao.edit(cdto);
		
			resp.sendRedirect("content.jsp?cs_no="+cdto.getCs_no());
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
