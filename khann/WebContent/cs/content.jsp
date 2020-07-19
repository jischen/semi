<%@page import="beans.dao.MemberDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="beans.dto.CsDto"%>
<%@page import="beans.dao.CsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.table>tbody>tr>td{
		text-align: left !important;
	}
</style>    
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
	
	if(user != null){
		if(isFirst){
		cdao.plusReadcount(cs_no, user.getMember_id());
		}
	}
	
	CsDto cdto = cdao.get(cs_no);
	
	MemberDao mdao = new MemberDao();
	MemberDto mdto = mdao.get(cdto.getCs_writer());
	

%>    

<jsp:include page="/template/header.jsp"></jsp:include>
<article class="w-90 cl">
	<!-- 제목 -->
	<div class="row"><h2>게시글 상세보기</h2></div>
	<!-- 표 -->	
	<div class="row">
		<table class="table table-border">
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
		</table>
	</div>
	<!-- 하단 버튼 -->
	<div class="row right">
		<%if(user!=null){ 
						boolean isAdmin = user.getGrade().equals("관리자");
						if(isAdmin){ %>
					<a href="write.jsp"><input class="form-btn form-inline" type="button" value="글쓰기"></a>
					<a href="edit.jsp?cs_no=<%=cs_no%>"><input class="form-btn form-inline" type="button" value="수정"></a>
					<a href="<%=request.getContextPath()%>/member/check.jsp?go=<%=request.getContextPath()%>/cs/delete.do?cs_no=<%=cs_no%>">
					<input class="form-btn form-inline" type="button" value="삭제">
					</a>
					<%} 
					} %>
					
		<a href="list.jsp"><input class="form-btn form-inline" type="button" value="목록"></a>
	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>