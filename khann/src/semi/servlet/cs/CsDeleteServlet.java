package semi.servlet.cs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dto.CsDto;

@WebServlet(urlPatterns = "/cs/delete.do")
public class CsDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			CsDto cdto = new CsDto();
			cdto.setCs_title(req.getParameter("cs_title"));
			cdto.setCs_content(req.getParameter("cs_content"));
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
