package semi.servlet.movie;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(urlPatterns = "/movie/upload2.do")
public class MovieFileUploadServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//파일 저장될 위치
			File baseDir = new File("D:/upload/movie");
			baseDir.mkdirs(); 
			
			int limit = 10 * 1024 * 1024 ; //10MB
			
			//생성을 도와주는 도구 생성(factory)
			DiskFileItemFactory factory = new DiskFileItemFactory(limit, baseDir);
			ServletFileUpload utility = new ServletFileUpload(factory);
			
			List<FileItem> list = utility.parseRequest(req);
	
			//list에 있는 데이터 분석
			for(FileItem item : list) {
				System.out.println(item.getFieldName());//파라미터 이름
				System.out.println(item.isFormField());//폼 입력항목인가 ?(파일인가 ?)
				if(item.isFormField()) {//파일이 아닌 경우 - 값만 출력)
					System.out.println("파일이 아닙니다.");
					System.out.println(item.getString());//값 추출
				}
				else {//파일인 경우 - 정부 출력
					System.out.println("파일입니다.");
					System.out.println(item.getName());
					System.out.println(item.getSize());
					System.out.println(item.getContentType());
				
					//저장 코드 : item.write(대상파일객체)
					File target = new File(baseDir, item.getName());
					item.write(target);
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
