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
public class ReviewRegistServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

		
		req.setCharacterEncoding("UTF-8");
			ReviewDto rdto=new ReviewDto();
			//처리ReviewDto rdto = new ReviewDto();

			
			rdto.setReview_writer(req.getParameter("review_writer"));
			rdto.setReview_movie(req.getParameter("review_movie"));
			rdto.setReview_content(req.getParameter("review_content"));
			rdto.setReview_score(req.getParameter("review_score"));
			
	
			
			ReviewDao rdao = new ReviewDao();
			rdao.register(rdto);
	
			
			
			// 출력
			resp.sendRedirect("review_content.jsp?review_no="+ (rdao.getSeq() -1));
		

		}

		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);

		}

	}

}
