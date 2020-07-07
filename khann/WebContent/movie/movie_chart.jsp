<%@page import="beans.dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- 이 페이지 준비
    	1. 준비물 : 
    	2. 처리 : 
    	3. 출력 :   
    	 -->
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
			<a href ="movie_content.jsp?movie_no=<%=mdto.getMovie_no() %>">
				<img src="/khann/image/<%=mdto.getMovie_no()%>.jpg" width="170" height="200">
			</a>
		</td> 
		
		<%} %>
		</tr>
		
	
	</tbody>


	<tfoot>
		<tr>
			<td align="center"  colspan="9">
				<a href="/khann/movie/movie_insert.jsp">영화 등록</a>
				<a href="/khann/movie/movie_delete.jsp">영화 삭제</a>
			</td>
		</tr>
	</tfoot>	
	
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

    