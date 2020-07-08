<%@page import="beans.dto.CsDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.CsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword");

	boolean isSearch = keyword != null;
	
	CsDao cdao = new CsDao();
	List<CsDto> list;
	if(isSearch){
		list = cdao.search(keyword); 
	}
	else{
		list = cdao.getList(); 
	}
	
%>    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>고객 센터</h2>
	
	<form action="list.jsp" method="get">
		<!-- 검색어 -->
		<input type="text" name="keyword" required>
		<!-- 전송버튼 -->
		<input type="submit" value="검색">
	</form>
	
	<table border="1">
		<thead>
			<tr>
				<td colspan="3">영화예매 관련 FAQ</td>
			</tr>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody align="center">
			<%for(CsDto cdto : list){ %>
			<tr>
				<td><%=cdto.getCs_no()%></td>
				<td>
					<a href="content.jsp?cs_no=<%=cdto.getCs_no()%>"><%=cdto.getCs_title()%></a>
				</td>
				<td><%=cdto.getCs_read()%></td>
			</tr>
			<%} %>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" align="right">
					<a href="write.jsp"><input type="button" value="글쓰기"></a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>