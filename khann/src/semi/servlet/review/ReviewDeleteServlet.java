package semi.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.dao.ReviewDao;
@WebServlet(urlPatterns = "/review/delete.do")
public class ReviewDeleteServlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
try {
	
	int review_no=Integer.parseInt(req.getParameter("review_no"));
	
	ReviewDao rdao=new ReviewDao();
	rdao.delete(review_no);
	
	resp.sendRedirect("review.content.jsp");
	
	
} catch (Exception e) {
	
	e.printStackTrace();
	resp.sendError(500);
	
	
}
	
}


}
