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

<div align="center">
	<a href="<%=rootPath%>/ask/list.jsp"><h2>문의하기</h2></a>
	
		<%if(user != null) {
		if(isAdmin){ %>
	<table>
		<tbody>
			<tr>
				<td>
					<form action="list.jsp" method="get">
					<input type="hidden" name="head" value="미답변"><input type="submit" value="미답변"></form>
				</td>
				<td>
					<form action="list.jsp" method="get">
					<input type="hidden" name="head" value="답변완료"><input type="submit" value="답변완료"></form>
				</td>
			</tr>
		</tbody>
	</table>
				<%} 
			} %>
	<table border="1">
		<thead align="center">
			<tr>
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

		<tfoot>
			<tr>
				<td colspan="5" align="right">
					<a href="write.jsp"><input type="button" value="글쓰기"></a>
				</td>
			</tr>
		</tfoot>
		

	</table>

			
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>