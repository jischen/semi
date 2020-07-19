package semi.servlet.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.EventDao;
import beans.dto.EventDto;

@WebServlet(urlPatterns="/event/edit.do")
public class EventEditServlet extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
				
			EventDto edto=new EventDto();
			edto.setEvent_no(Integer.parseInt(req.getParameter("event_no")));
			edto.setEvent_title(req.getParameter("event_title"));
			edto.setEvent_date(req.getParameter("event_date"));
			edto.setEvent_content(req.getParameter("event_content"));
			edto.setEvent_condition(req.getParameter("event_condition"));
			
			EventDao edao=new EventDao();
			edao.edit(edto);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}