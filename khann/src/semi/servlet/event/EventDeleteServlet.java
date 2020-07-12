package semi.servlet.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.EventDao;

@WebServlet(urlPatterns = "/event/delete.do")
public class EventDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			int event_no = Integer.parseInt(req.getParameter("event_no"));
			
			//처리 : 삭제
			EventDao edao = new EventDao();
			edao.delete(event_no);
			
			//출력
			resp.sendRedirect("list.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
