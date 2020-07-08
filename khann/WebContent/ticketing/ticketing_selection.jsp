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
						
<div align="center">
	
	<table border="1">
		<tbody>
		
		<tr>
		<%for(MovieDto mdto : list) {%>
		<td>
			<a href ="ticketing_choice.jsp?movie_no=<%=mdto.getMovie_no() %>">
				<img src="/khann/image/<%=mdto.getMovie_no()%>.jpg" width="170" height="200">
			</a>
		</td> 
		
		<%} %>
		</tr>
		
	
	</tbody>

	
	
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

    

