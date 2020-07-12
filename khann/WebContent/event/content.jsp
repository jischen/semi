<%@page import="beans.dao.EventDao"%>
<%@page import="beans.dto.EventFileDto"%>
<%@page import="beans.dao.EventFileDao"%>
<%@page import="beans.dto.EventDto"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/template/header.jsp"></jsp:include>

<%

EventDto edto=new EventDto();
EventDao edao = new EventDao();

int event_no=Integer.parseInt(request.getParameter("event_no"));

//첨부파일 목록을 구해오는 코드
/* EventFileDao efdao = new EventFileDao();
List<EventFileDto> fileList = efdao.getList(event_no); */

// 게시글 번호로 글 조회
edto = edao.get(event_no);

//관리자만 글 작성,삭제 가능
MemberDto user=(MemberDto) session.getAttribute("userinfo");
%>


<div align="center">
	<h2>이벤트 상세보기</h2>

	<!-- 테이블에 글 정보를 출력 -->
	<table border="1" width="60%">

			<tr>
				<td>
					상황<%=edto.getEvent_condition()%>
				</td>
			</tr>
			
			<tr>
				<td>
					제목<%=edto.getEvent_title() %>
				</td>
			</tr>
			
			<!-- 게시글 내용 영역 -->
			<tr height="300">
				<td valign="top">
					<%=edto.getEvent_content()%>
				</td>  
			</tr>
			
			<!-- 첨부파일 출력 영역 : 첨부파일이 있는 경우만 출력 -->
			<%-- <%if(!fileList.isEmpty()){ %>
			<tr>
				<td>
					첨부파일 목록
					<ul>
						<%for(EventFileDto efdto : fileList){ %>
						<li>
						<%=efdto.getEvent_file_name()%>
						(<%=efdto.getEvent_file_size()%> bytes)
						<!-- 다운로드 버튼을 누른다면 해당 파일을 다운로드 할 수 있도록 링크 -->
						<a href="download.do?event_file_no=<%=efdto.getEvent_file_no()%>">다운로드</a>
						
						<!-- 다운로드 주소를 img 태그로 지정하면 미리보가 가능 -->
						<img src="download.do?event_file_no=<%=efdto.getEvent_file_no()%>" width="50" height="50">
						
						</li>
						<%} %>
					</ul>
				</td>
			</tr>
			<%} %> --%>
			
			</tbody>
					</table>
		
	
		<!-- 각종 버튼들 구현 -->
		<table>
		<tfoot>
			<tr>
				<td colspan="2" align="right">
							
					
					<%if (user != null) {
						if(user.getGrade().equals("관리자")){%>
					
					<a href="edit.jsp?event_no=<%=event_no%>">
					<input type="button" value="수정">
					</a>
					
					<a href="/khann/member/check.jsp?go=/khann/event/delete.do?event_no=<%=event_no%>">
					<input type="button" value="삭제">
					</a>
						<%} %>
					<%} %>
					
					<a href="list.jsp">
					<input type="button" value="목록" >
					</a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

