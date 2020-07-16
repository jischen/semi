<%@page import="java.util.List"%>
<%@page import="beans.dao.ReplyDao"%>
<%@page import="beans.dto.ReplyDto"%>
<%@page import="beans.dto.AskDto"%>
<%@page import="beans.dao.AskDao"%>
<%@page import="beans.dao.MemberDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int ask_no = Integer.parseInt(request.getParameter("ask_no"));

	MemberDto user = (MemberDto)session.getAttribute("userinfo");
	
	AskDao adao = new AskDao();
	AskDto adto = adao.get(ask_no);
	
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(adto.getAsk_writer());
	
	ReplyDao rdao = new ReplyDao();
	List<ReplyDto> replyList = rdao.getList(ask_no); 
	
	boolean isAdmin = user.getGrade().equals("관리자");
	boolean isMine = user.getMember_id().equals(adto.getAsk_writer());
%>    

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>게시글 상세보기</h2>
	
	<table border="1" width="60%">
		<tbody>
			<tr>
				<td><%=adto.getAsk_title()%></td>
			</tr>
			<tr>
				<td><%=adto.getAsk_writer()%>
					<font color="gray"><%=mdto.getGrade()%></font>
				</td>
			</tr>
			<tr height="300">
				<td valign="top"><%=adto.getAsk_content()%></td>
			</tr>
			
			<!-- 댓글 목록 영역 -->
			<%for(ReplyDto rdto : replyList){ 
			if(replyList != null){%>
			<tr>
				<td>
					<table width="99%">
						<tbody>
							<tr>
								<td>
									<div><%=rdto.getReply_writer()%></div>
									<div><%=rdto.getReply_content()%></div>
									<div><%=rdto.getReply_date()%></div>
								</td>
								<%if(isAdmin){%>
								<td width="15%">
									<a href="reply_content.jsp?ask_no=<%=rdto.getReply_origin()%>&reply_no=<%=rdto.getReply_no()%>">
									수정</a> | 
									<a href="reply_delete.do?reply_no=<%=rdto.getReply_no()%>&reply_origin=<%=ask_no%>">
									삭제</a>
								</td>
								<%} %>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<%} 
			}%>
			<!-- 댓글 작성 영역 -->
			<%if(isAdmin){%>
			<tr>
				<td align="right">
					<form action="reply_insert.do" method="post">
						<input type="hidden" name="reply_origin" value="<%=ask_no%>">
						<textarea name="reply_content" rows="4" cols="120" placeholder="댓글 작성"></textarea>
						<input type="submit" value="등록">
					</form>
				</td>
			</tr>
			<%}%>
		</tbody>
		<tfoot>
			<tr>
				<td align="right">
					<%if(user!=null){ 
						if(isAdmin || isMine){ %>
					<a href="write.jsp"><input type="button" value="글쓰기"></a>
					<a href="edit.jsp?ask_no=<%=ask_no%>"><input type="button" value="수정"></a>
					<a href="<%=request.getContextPath()%>/member/check.jsp?go=<%=request.getContextPath()%>/ask/delete.do?ask_no=<%=ask_no%>">
					<input type="button" value="삭제">
					</a>
					<%} 
					} %>
					
					<a href="list.jsp"><input type="button" value="목록"></a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>