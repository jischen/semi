package semi.servlet.event;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import beans.dao.EventFileDao;
import beans.dto.EventFileDto;

@WebServlet(urlPatterns = "/event/download.do")
public class EventFileDownloadServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int event_file_no = Integer.parseInt(req.getParameter("event_file_no"));
			
			EventFileDao efdao = new EventFileDao();
			EventFileDto efdto = efdao.get(event_file_no);
			
			if(efdto == null) {
				resp.sendError(404);
				return;
			}
			
		      resp.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
		      resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(efdto.getEvent_file_name(), "UTF-8")+"\"");
		      resp.setHeader("Content-Length", String.valueOf(efdto.getEvent_file_size()));

			
			File target = new File("D:/upload/kh31", String.valueOf(efdto.getEvent_file_no()));
			byte[] data = FileUtils.readFileToByteArray(target);//파일 데이터 로드
			resp.getOutputStream().write(data);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
