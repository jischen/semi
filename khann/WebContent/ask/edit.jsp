<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.AskDto"%>
<%@page import="beans.dao.AskDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int ask_no = Integer.parseInt(request.getParameter("ask_no"));
	AskDao adao = new AskDao();
	AskDto adto = adao.get(ask_no);
	
	MemberDto user = (MemberDto)session.getAttribute("userinfo");
	boolean isAdmin = user.getGrade().equals("관리자");
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>게시글 수정</h2>
	
	<form action="edit.do" method="post">
	
		<input type="hidden" name="ask_no" value="<%=ask_no%>">
		<%if(!isAdmin){ %>
		<input type="hidden" name="ask_head" value="미답변">
		<%} %>
		<table border="1">
			<tbody>
				<%if(isAdmin){ %>
				<tr>
					<th>말머리</th>
					<td>
						<select name="ask_head">
							<option value="">말머리 선택</option>
							<option value="미답변">미답변</option>
							<option value="답변완료">답변완료</option>
						</select>
					</td>
				</tr>
				<%}%>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="ask_title" size="75" required value="<%=adto.getAsk_title()%>">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="ask_content" required rows="15" cols="77"><%=adto.getAsk_content()%></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정"></td>
				</tr>
			</tfoot>
		</table>
	
	</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>