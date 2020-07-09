<%@page import="beans.dto.EventDto"%>
<%@page import="beans.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
정보 표시하기 위한 PK(event_no)필요
 -->
 <%
 
int event_no=Integer.parseInt(request.getParameter("event_no"));
EventDao edao=new EventDao();
EventDto edto=edao.get(event_no);
 
 %>
 
 
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	
	<h2>이벤트 수정</h2>
	
	<!-- 게시글 전송 폼 -->
	<form action="edit.do" method="post" >
	<input type="hidden" name="event_no" value="<%=event_no%>" name="event_no">
		
		<table border="1">
			<tbody>
				<tr>
					<th>상황</th>
					<td>
						<select name="event_condition" >
							<option value="<%=edto.getEvent_condition()%>">상황 선택</option>
							<option value="정보">예정</option>
							<option value="공지">진행</option>
							<option value="유머">마감</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="event_title" size="70" required
							value="<%=edto.getEvent_title()%>">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="event_content" required rows="20" cols="80">
						<%=edto.getEvent_content()%>						
						</textarea>
					</td>  
				</tr>
				
				<!-- 첨부파일 -->
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="event_file" multiple accept=".jpg, .png, .gif">
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="작성">
					</td>
				</tr>
			</tfoot>
		</table>
		
	</form>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

