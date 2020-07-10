<%@page import="beans.dao.MemberDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="beans.dto.CsDto"%>
<%@page import="beans.dao.CsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int cs_no = Integer.parseInt(request.getParameter("cs_no"));

	Set<Integer> memory = (Set<Integer>)session.getAttribute("memory");
	
	if(memory == null){
		memory = new HashSet<>();
	}
	
	boolean isFirst = memory.add(cs_no);
	session.setAttribute("memory", memory);
	
	CsDao cdao = new CsDao();
	MemberDto user = (MemberDto)session.getAttribute("userinfo");
	
	if(isFirst){
		cdao.plusReadcount(cs_no, user.getMember_id());
	}
	
	CsDto cdto = cdao.get(cs_no);
	
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(cdto.getCs_writer());
	
	boolean isAdmin = user.getGrade().equals("관리자");
	boolean isMine = user.getMember_id().equals(cdto.getCs_writer());
%>    

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>게시글 상세보기</h2>
	
	<table border="1" width="60%">
		<tbody>
			<tr>
				<td><%=cdto.getCs_title()%></td>
			</tr>
			<tr>
				<td><%=cdto.getCs_writer()%>
					<font color="gray"><%=mdto.getGrade()%></font>
				</td>
			</tr>
			<tr height="300">
				<td valign="top"><%=cdto.getCs_content()%></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td align="right">
					<%if(user!=null){ 
						if(isAdmin || isMine){ %>
					<a href="write.jsp"><input type="button" value="글쓰기"></a>
					<a href="edit.jsp?cs_no=<%=cs_no%>"><input type="button" value="수정"></a>
					<a href="<%=request.getContextPath()%>/member/check.jsp?go=<%=request.getContextPath()%>/cs/delete.do?cs_no=<%=cs_no%>">
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