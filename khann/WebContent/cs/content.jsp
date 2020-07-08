<%@page import="beans.dto.CsDto"%>
<%@page import="beans.dao.CsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int cs_no = Integer.parseInt(request.getParameter("cs_no"));
	CsDao cdao = new CsDao();
	CsDto cdto = cdao.get(cs_no);
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
				<td><%=cdto.getCs_content()%></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td align="right">
					<a href="write.jsp"><input type="button" value="글쓰기"></a>
					<a href="edit.jsp"><input type="button" value="수정"></a>
					<a href="delete.jsp"><input type="button" value="삭제"></a>
					<a href="list.jsp"><input type="button" value="목록"></a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>