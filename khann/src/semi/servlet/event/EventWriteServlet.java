package semi.servlet.event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.EventDao;
import beans.dto.EventDto;
import beans.dto.MemberDto;

//@WebServlet(urlPatterns="/event/write.do")
public class EventWriteServlet extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		
		req.setCharacterEncoding("UTF-8");
		//준비 : 글번호, 제목 , 내용
		
		
		String event_condition = req.getParameter("event_condition");		
		String event_title = req.getParameter("event_title");
		String event_content = req.getParameter("event_content");
		
		EventDto edto = new EventDto();
		EventDao edao = new EventDao();
		
		int event_no = edao.getSequence();
		
		edto.setEvent_no(event_no);
		edto.setEvent_condition(event_condition);
		edto.setEvent_title(event_title);
		edto.setEvent_content(event_content);
		
		edao.write(edto);
		
		resp.sendRedirect(req.getContextPath() + "/event/content.jsp?event_no=" + event_no);
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
