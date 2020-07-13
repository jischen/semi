<%@page import="beans.dto.TheaterDto"%>
<%@page import="beans.dao.TheaterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int theater_no = Integer.parseInt(request.getParameter("theater_no"));

	TheaterDao tdao = new TheaterDao();
	
	TheaterDto tdto = tdao.get(theater_no);
%>
    
    
    
<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	
	
	<form action="insert2.jsp" method="post">
	<table border="1">
	
		<tr>
			<td> 상영관 이름 </td>
			<td>
			<input name="theater_name" type="text" value="<%=tdto.getTheater_name() %>" >
			</td>
		</tr>
		<tr>
			<td> 상영관 유형 </td>
			<td>
			<input name="theater_type" type="text" value="<%=tdto.getTheater_type()%>">
			</td>
		</tr>
		<tr>
			<td> 상영관 줄 </td>
			<td>
			<input name="theater_row" type="text" value="<%=tdto.getTheater_row()%>">
			</td>
		</tr>
		<tr>
			<td> 상영관 열 </td>
			<td>
			<input name="theater_col" type="text" value="<%=tdto.getTheater_col()%>">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input  type="submit" value="전송">
			</td>
		</tr>
	
	</table>
	</form>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>clude>