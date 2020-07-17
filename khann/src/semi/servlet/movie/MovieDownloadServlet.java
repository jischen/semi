package semi.servlet.movie;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import beans.dao.MovieFileDao;
import beans.dto.MovieFileDto;

@WebServlet(urlPatterns = "/movie/download.do")
public class MovieDownloadServlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int movie_file_no = Integer.parseInt(req.getParameter("movie_file_no"));
		
		MovieFileDao mfdao = new MovieFileDao();
		MovieFileDto mfdto = mfdao.get(movie_file_no);
		
		if(mfdto == null) {
			resp.sendError(404);
			return;
		}
		
		File target = new File("D:/upload/movie", String.valueOf(mfdto.getMovie_file_no()));
		byte[] data = FileUtils.readFileToByteArray(target); //파일 데이터 로드
		resp.getOutputStream().write(data);
	}
	catch(Exception e) {
		
	}
}
}
