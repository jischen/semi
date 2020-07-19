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
<style>
	.table>tbody>tr>td{
		text-align: left !important;
	}
   a{
    	text-decoration : none;
    	color:black;
    }
</style> 
<%
	int ask_no = Integer.parseInt(request.getParameter("ask_no"));
	int reply_no = Integer.parseInt(request.getParameter("reply_no"));

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
<article class="w-90 cl">
	<div class="row"><h2>게시글 상세보기</h2></div>
	
	<!-- 표 -->
	<div class="row">
	<table class="table table-border">
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
			<%for(ReplyDto rdto : replyList){%>
			<tr>
				<td>
					<table class="table">
						<tbody>
							<tr>
				<%if(reply_no==rdto.getReply_no()){%>
								<td align="right">
									<form action="reply_edit.do" method="post">
									<input type="hidden" name="reply_origin" value="<%=ask_no%>">
									<input type="hidden" name="reply_no" value="<%=reply_no%>">
									<textarea class="cl" name="reply_content" rows="5" cols="160" placeholder="댓글 작성"><%=rdto.getReply_content()%></textarea>
									<input class="form-btn form-inline" type="submit" value="수정">
									</form>
								</td>
								<%}else{%>
								<td>
									<div><%=rdto.getReply_writer()%></div>
									<div><%=rdto.getReply_content()%></div>
									<div><%=rdto.getReply_date()%></div>
								</td>
								<td style="text-align: right !important;">
									<a href="reply_edit.jsp?ask_no=<%=rdto.getReply_origin()%>&reply_no=<%=rdto.getReply_no()%>">
									수정</a> | 
									<a href="reply_delete.do?reply_no=<%=rdto.getReply_no()%>&reply_origin=<%=ask_no%>">
									삭제</a>
								</td>
								<%}%>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<%}%>
			<!-- 댓글 작성 영역 -->
			<%if(isAdmin){%>
			<tr>
				<td align="right">
					<form action="reply_insert.do" method="post">
						<input type="hidden" name="reply_origin" value="<%=ask_no%>">
						<textarea class="cl" name="reply_content" rows="5" cols="165" placeholder="댓글 작성"></textarea>
						<input class="form-btn form-inline" type="submit" value="등록">
					</form>
				</td>
			</tr>
			<%}%>
		</tbody>
	</table>
	</div>
	
	<!-- 버튼 -->
	<%if(user!=null){ 
		if(isAdmin || isMine){ %>
	<div class="row right">
		<a href="write.jsp"><input class="form-btn form-inline" type="button" value="글쓰기"></a>
		<a href="edit.jsp?ask_no=<%=ask_no%>"><input class="form-btn form-inline" type="button" value="수정"></a>
		<a href="<%=request.getContextPath()%>/member/check.jsp?go=<%=request.getContextPath()%>/ask/delete.do?ask_no=<%=ask_no%>">
			<input class="form-btn form-inline" type="button" value="삭제"></a>
	</div>
		<%} 
	} %>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>