package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.ReviewDao;
import beans.dto.MemberDto;
import beans.dto.ReviewDto;

@WebServlet(urlPatterns = "/review/review_write.do")
public class ReviewRegistServlet extends HttpServlet{
	
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		
		MemberDto mdto=(MemberDto)req.getSession().getAttribute("userinto");
	String member_id=mdto.getMember_id();
	
	req.setCharacterEncoding("UTF-8");
//처리
	ReviewDto rdto=new ReviewDto();
	
	rdto.setReview_score(req.getParameter("review_score"));
	rdto.setReview_content(req.getParameter("review_content"));
	rdto.setReview_date(req.getParameter("review_date"));
	rdto.setReview_writer(member_id);
	
	ReviewDao rdao = new ReviewDao();
	

	rdao.register(rdto);
	
	
	
	//리뷰등록 전송 주소 만들기

	//resp.sendRedirect("무비컨텐츠");
	
	//출력
	
}
	
	 catch (Exception e) {
			
	 }
	
	 }
	
}
