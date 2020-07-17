package semi.servlet.movie;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import beans.dao.MovieDao;
import beans.dao.MovieFileDao;
import beans.dto.MovieDto;
import beans.dto.MovieFileDto;

@WebServlet(urlPatterns = "/movie/insert.do")
public class MovieInsertWithFileServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 try {
			 String charset = "UTF-8";
			 int limit = 10*1024*1024; //최대 용량
			 File baseDir = new File("D:/upload/movie");
		 
			 DiskFileItemFactory factory = new DiskFileItemFactory();//공장
			 factory.setDefaultCharset(charset);
			 factory.setSizeThreshold(limit);
			 factory.setRepository(baseDir);
		 
			 ServletFileUpload utility = new ServletFileUpload(factory);
			 
			 Map<String, List<FileItem>> map = utility.parseParameterMap(req);
			 
			 MovieDto mdto = new MovieDto();
			 mdto.setMovie_name(map.get("movie_name").get(0).getString());
			 mdto.setMovie_type(map.get("movie_type").get(0).getString());
			 mdto.setMovie_age(map.get("movie_age").get(0).getString());
			 mdto.setMovie_runtime(map.get("movie_runtime").get(0).getString());
			 mdto.setMovie_open(map.get("movie_open").get(0).getString());
			 mdto.setMovie_director(map.get("movie_director").get(0).getString());
			 mdto.setMovie_ac(map.get("movie_ac").get(0).getString());
			 mdto.setMovie_content(map.get("movie_content").get(0).getString());
			 
			 //이거 의미를 모르겠당
//			 if(map.containsKey("movie_no")) {
//				 Integer.parseInt(map.get("movie_no").get(0).getString());
//			 }
			 
			 MovieDao mdao = new MovieDao();
			 int movie_no = mdao.getSequence();
			 System.out.println(movie_no);
			 
			 mdto.setMovie_no(movie_no);
			 
			 mdao.insert(mdto);
			 
			 List<FileItem> fileList = map.get("movie_file");//insert에서 보낼 name
			 MovieFileDao mfdao = new MovieFileDao();
			 for(FileItem item : fileList) {
				 if(item.getSize()>0) {
					 int movie_file_no = mfdao.getSequence();
					 
					 MovieFileDto mfdto = new MovieFileDto();
					 mfdto.setMovie_file_no(movie_file_no);
					 mfdto.setMovie_file_name(item.getName());
					 mfdto.setMovie_file_type(item.getContentType());
					 mfdto.setMovie_file_size(item.getSize());
					 mfdto.setMovie_file_origin(movie_no);
					 mfdao.save(mfdto);
					 
				File target = new File(baseDir,String.valueOf(movie_file_no));
				item.write(target); //item class에 있는 write
				 }
			 }
			 resp.sendRedirect("movie_content.jsp?movie_no="+movie_no);
		 }
		 	 
		 catch(Exception e) {
			 e.printStackTrace();
			 resp.sendError(500);
		 }
	}

}
