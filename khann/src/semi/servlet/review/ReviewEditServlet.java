package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.MovieDao;
import beans.dao.ReviewDao;
import beans.dto.MovieDto;
import beans.dto.ReviewDto;
@WebServlet(urlPatterns = "/review/review_edit.do")
public class ReviewEditServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
	
			req.setCharacterEncoding("UTF-8");
			
			int review_no = Integer.parseInt(req.getParameter("review_no"));
			
			String movie_name = req.getParameter("movie_name");
			MovieDao mdao = new MovieDao();
			MovieDto mdto = mdao.getMovieno(movie_name);
			int movie_no = mdto.getMovie_no();
			
			
			
			
			
			ReviewDto rdto= new ReviewDto();
			
			rdto.setReview_no(review_no);
			rdto.setReview_movie(movie_no);
			rdto.setReview_writer(req.getParameter("review_writer"));
			rdto.setReview_content(req.getParameter("review_content"));
			rdto.setReview_score(req.getParameter("review_score"));
		
			
			
			ReviewDao rdao=new ReviewDao();
			rdao.reviewedit(rdto);

		resp.sendRedirect("review_content.jsp?review_no="+(rdto.getReview_no()));
		
	} catch (Exception e) {
		
		e.printStackTrace();
		resp.sendError(500);
		
	}
	}
	

		
		
		
	}
	
	
