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

@WebServlet(urlPatterns="/event/write.do")
public class EventWriteServlet extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		//준비 : 글번호, 제목 , 내용
		
		EventDto edto=new EventDto();
		edto.setEvent_condition(req.getParameter("event_condition"));
		edto.setEvent_title(req.getParameter("event_title"));
		edto.setEvent_content(req.getParameter("event_content"));

		EventDao edao=new EventDao();
		int event_no=edao.getSequence();//번호 먼저 추출
		edto.setEvent_no(event_no);//번호를 설정한 뒤 
		edao.write(edto);//등록-게시글 번호 
		
		resp.sendRedirect("content.jsp?event_no="+event_no);
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
