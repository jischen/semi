package semi.servlet.event;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
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

import beans.dao.EventDao;
import beans.dao.EventFileDao;
import beans.dto.EventDto;
import beans.dto.EventFileDto;

@WebServlet(urlPatterns = "/event/edit.do")
public class EventEditServlet extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String charset = "UTF-8";
			int limit = 10 * 1024 * 1024;
			File baseDir = new File("D:/upload/event");

			DiskFileItemFactory factory = new DiskFileItemFactory(limit, baseDir);
			factory.setDefaultCharset(charset);

			ServletFileUpload utility = new ServletFileUpload(factory);

			Map<String, List<FileItem>> map = utility.parseParameterMap(req);

			EventDto edto = new EventDto();

			edto.setEvent_title(map.get("event_title").get(0).getString());
			edto.setEvent_content(map.get("event_content").get(0).getString());

			EventDao edao = new EventDao();
			int event_no = Integer.parseInt(map.get("event_no").get(0).getString());
			edto.setEvent_no(event_no);

			edao.edit(edto);

			List<FileItem> fileList = map.get("event_file_no");

			for (FileItem item : fileList) {

				if (item.getSize() > 0) {

					EventFileDao efdao = new EventFileDao();
					EventFileDto efdto = new EventFileDto();

					int event_file_no = efdao.getSequence();
					efdto.setEvent_file_no(event_file_no);
					efdto.setEvent_file_name(item.getName());
					efdto.setEvent_file_size(item.getSize());
					efdto.setEvent_file_type(item.getContentType());
					efdao.save(efdto);

					EventFileDto fdto = new EventFileDto();
					// efdto.setEvent_file_origin(event_file_origin);
					fdto.setEvent_file_no(event_file_no);

					EventFileDao fdao = new EventFileDao();
					fdao.save(efdto);

					File target = new File(baseDir, String.valueOf(event_file_no));
					item.write(target);

					resp.sendRedirect("Eventcontent.jsp?event_no=" + event_no);

				}
			}
		}

		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}