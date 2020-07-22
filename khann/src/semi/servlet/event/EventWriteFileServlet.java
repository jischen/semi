package semi.servlet.event;

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

import beans.dao.EventDao;
import beans.dao.EventFileDao;
import beans.dto.EventDto;
import beans.dto.EventFileDto;
import beans.dto.MemberDto;


@WebServlet(urlPatterns="/event/write.do")
public class EventWriteFileServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {//게시글 + 파일 해석 및 저장
			
			//1. 해석을 위한 도구를 생성할 옵션을 설정
			String charset="UTF-8"; //해석할 인코딩 방식
			int limit=10*1024*1024;//최대 허용 용량
			File baseDir=new File("D:/upload/kh31");
			baseDir.mkdirs();
		
			//2. 도구 생성을 위한 factory 객체를 생성-생성만 전담하는 클래스
			DiskFileItemFactory factory=new DiskFileItemFactory();//공장
			factory.setDefaultCharset(charset);//생성 옵션으로 charset 지정
			factory.setSizeThreshold(limit); //맥시멈 용량 설정
			factory.setRepository(baseDir); //기본 저장폴더 설정
			
			//3. 실제 사용할 도구 생성
			ServletFileUpload utility=new ServletFileUpload(factory);
			//factory 설정에 기반해서 utility를 만들어라 
			
			//4. 전송된 데이터를 해석하도록 지시<보낸이름, 실제data>
			Map<String, List<FileItem>> map=utility.parseParameterMap(req);
		
			//5. 해석한 데이터에서 필요한 정보 1개씩을 추출
			 EventDto edto=new EventDto();
			 edto.setEvent_condition(map.get("event_condition").get(0).getString());
			 edto.setEvent_title(map.get("event_title").get(0).getString());
			 edto.setEvent_content(map.get("event_content").get(0).getString());
			
			 //event_no의 전송 유무 파악
			 if(map.containsKey("event_no")) {
				 Integer.parseInt(map.get("event_no").get(0).getString());
			 }
			 
			//6.세션에서 작성자 정보를 가져오는 코드는 동일
//			 MemberDto mdto = new MemberDto();
//			 MemberDto user=(MemberDto)req.getSession().getAttribute("userinfo");
//			 mdto.setGrade(user.getGrade());
		
			 //7.작성할 게시글의 번호를 미리 가져온다
			 EventDao edao=new EventDao();
			 int event_no=edao.getSequence();
			 System.out.println(event_no);
			 
			 //8.게시글 정보에 7번에서 가져온 번호를 첨부
			 edto.setEvent_no(event_no);
			 
			 //9.게시글 등록
			 edao.write(edto);
			 
			 //10.파일 정보를 불러와서 저장(하드디스크+데이터베이스)
			 //-전송되는 이름은 Event_file
			 //-(주의)파일이 없어도 개수가 1개가 나오므로 개수로 처리하는 것은 무리!
			 //-파일이 있는지 없는지는 파일의 크기를 이용해서 확인
			 List<FileItem> fileList=map.get("event_file");
			 EventFileDao efdao=new EventFileDao();
			 for(FileItem item : fileList) {
				 //item에 있는 정보를 뽑아내서 DB에 저장
				 //item의 파일 데이터를 하드디스크에 저장
				 //총 2 번 저장
				 if(item.getSize()>0) { //파일 유무 확인
					 
					 //데이터베이스에 저장
					  int event_file_no=efdao.getSequence();
					 
					 //물리적 데이터 저장
					 EventFileDto efdto=new EventFileDto();
					 efdto.setEvent_file_no(event_file_no); //파일번호
					 efdto.setEvent_file_name(item.getName());//파일명
					 efdto.setEvent_file_type(item.getContentType());//파일유형
					 efdto.setEvent_file_size(item.getSize());
					 efdto.setEvent_file_origin(event_no);//게시글 번호
					 efdao.save(efdto);

					 //하드디스크에 저장-메타데이터 저장
					 File target=new File(baseDir,String.valueOf(event_file_no));//파일 이름은 시퀀스라 getName으로 받으면 충돌생김 - 먼저 db에서 처리가 있어야함(번호뽑기)
					item.write(target);
				 }
			 
			 }
			 
			 
			 //11.상세보기 페이지로 리다이렉트
			 resp.sendRedirect("content.jsp?event_no="+event_no);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
