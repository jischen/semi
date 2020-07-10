<%@page import="beans.dto.TheaterDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	

	TheaterDao tdao = new TheaterDao();
	List<TheaterDto> list = tdao.getList();

%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div>
	<table border="1">
		<tbody>
			<tr>
				<td>상영관 이름</td>
				<td>상영관 타입</td>
				<td>상영관 줄</td>
				<td>상영관 칸</td>
			</tr>
			
			
			<%for(TheaterDto tdto : list){ %>
				<tr>
					<td>
					<%=tdto.getTheater_name() %>
					</td>
					
					<td>
					<%=tdto.getTheater_type() %>
					</td>
					
					<td>
					<%=tdto.getTheater_row() %>
					</td>
					
					<td>
					<%=tdto.getTheater_col() %>
					</td>
					
					<td>
					<a href="theater_modified.jsp?theater_no=<%=tdto.getTheater_no()%>">
					<input type="button" value="수정">
					</a>
					</td>
					
					<td>
					<a href="theater_delete.jsp?theater_no=<%=tdto.getTheater_no()%>">
					<input type="button" value="삭제">
					</a>
					</td>
					
				</tr>
			<%} %>
		</tbody>
	
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>