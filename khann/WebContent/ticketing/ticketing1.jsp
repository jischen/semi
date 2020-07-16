<%@page import="beans.dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	MovieDao mdao = new MovieDao();
	List<MovieDto> list = mdao.getList();
	
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div>
	
	<form action="ticketing2.jsp" method="post">
	<select name="movie_no" >
	<%for(MovieDto mdto : list){ %>
		<option value="<%=mdto.getMovie_no()%>">
		<%=mdto.getMovie_name() %>
		
		</option>
	<%} %>

	</select>
	<input type="submit" value="전송">
	</form>
	
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>