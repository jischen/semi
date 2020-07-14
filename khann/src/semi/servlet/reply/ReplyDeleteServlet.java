package semi.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.AskDao;
import beans.dao.ReplyDao;

@WebServlet(urlPatterns = "/ask/reply_delete.do")
public class ReplyDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int reply_no = Integer.parseInt(req.getParameter("reply_no"));
			int reply_origin = Integer.parseInt(req.getParameter("reply_origin"));
			
			ReplyDao rdao = new ReplyDao();
			rdao.delete(reply_no);
			
			AskDao adao = new AskDao();
			adao.editReplycount(reply_origin);
			
			resp.sendRedirect("content.jsp?ask_no="+reply_origin);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
