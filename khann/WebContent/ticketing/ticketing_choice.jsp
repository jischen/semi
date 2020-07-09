<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.TicketingDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	ShowDao sdao = new ShowDao();
	
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));
	List<TicketingDto> list = sdao.getList(movie_no);

	MovieDao mdao = new MovieDao();
	MovieDto mdto = mdao.get(movie_no);
	
	
	
	   	 
%>


<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">

	
	<table border="1">
	<tr>
		<td> 영화 제목 </td>
		<td> 날짜 선택 </td>
		<td> 상영관 이름 </td>
		
	</tr>
	
		<% for(TicketingDto tdto : list) {%>
	<tr>
		<td> <%=mdto.getMovie_name() %></td>
		<td> <%=tdto.getShow_start() %></td>
		<td> <%=tdto.getTheater_name() %></td>
		
		
		<td>
			<a href="/khann/ticketing/seat_choice.jsp?row=<%=tdto.getTheater_row()%>&col=<%=tdto.getTheater_col()%>">
			<input type="button" value="선택">
			</a>
		</td>
	</tr>
		<%} %>
	
	
	</table>

	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

