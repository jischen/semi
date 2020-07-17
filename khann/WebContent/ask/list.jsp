<%@page import="beans.dto.AskDto"%>
<%@page import="beans.dao.AskDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String keyword = request.getParameter("keyword");
	String head = request.getParameter("head");

	boolean isSearch = keyword != null;
	boolean searchHead = head != null; 
	AskDao adao = new AskDao();

	List<AskDto> list;
	if(searchHead){
		list = adao.searchHead(head);
	}
	else{
		list = adao.getList(); 
	}
	String rootPath = request.getContextPath();
	
	MemberDto user = (MemberDto)session.getAttribute("userinfo");
	boolean isAdmin = user.getGrade().equals("관리자");
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>
<article class="w-90">
	<div class="row"><a href="<%=rootPath%>/ask/list.jsp"><h2>문의하기</h2></a></div>
	<!-- 답변 종류 버튼 -->
	<%if(user != null) {
		if(isAdmin){ %>
	<div class="menu-list float-box float-right">
		<div class="menu-item"><form action="list.jsp" method="get">
					<input type="hidden" name="head" value="답변완료"><input class="form-btn form-inline" type="submit" value="답변완료"></form></div>			
		<div class="menu-item" style="margin-right:10px"><form action="list.jsp" method="get">
					<input type="hidden" name="head" value="미답변"><input class="form-btn form-inline" type="submit" value="미답변"></form></div>
	</div>
		<%} 
	} %>
	<!-- 테이블 -->
	<div class="row">
	<table class="table table-border">
		<thead align="center">
			<tr bgcolor="#f5f5f5">
				<th>번호</th>
				<th width="600">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>진행상황</th>
			</tr>
		</thead>
		<tbody align="center">
			<%for(AskDto adto : list){ %>
		<%boolean isMine = user.getMember_id().equals(adto.getAsk_writer()); 
		if(isMine || isAdmin){%>
			<tr>
				<td><%=adto.getAsk_no()%></td>
				<td align="left">
					<a href="content.jsp?ask_no=<%=adto.getAsk_no()%>"><%=adto.getAsk_title()%></a>
					<%if(adto.getAsk_replycount() > 0){ %>
						[<%=adto.getAsk_replycount()%>]
					<%} %>
				</td>
				<td><%=adto.getAsk_writer()%></td>
				<td><%=adto.getAsk_autotime()%></td>
				<td><%=adto.getAsk_head()%></td>
			</tr>
			<%}else if(list == null){ %>
				<tr>
					<td colspan="5">작성하신 문의글이 없습니다.</td>	
				</tr>
				<% break; 
				}
			}%>
			
			
		</tbody>
	</table>
	</div>
	
	<!-- 하단 버튼 -->
	<div class="row right"><a href="write.jsp"><input class="form-btn form-inline" type="button" value="글쓰기"></a></div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>