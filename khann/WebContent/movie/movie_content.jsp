<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.MovieDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));

	MovieDao mdao = new MovieDao();
	MovieDto mdto = mdao.get(movie_no);
%>

	
	
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<table border="1" >
		<tbody>
		<tr>
			<td rowspan="4">
				<img src="http://placehold.it/250x250?text=movie" />
			</td>
			<td>
				제목
				: <%=mdto.getMovie_name()%>
			</td>
			
		</tr>
		
		<tr>
			<td>
				감독/배우
				: <%=mdto.getMovie_director()%>/<%=mdto.getMovie_ac()%>
			</td>
		</tr>
		
		<tr>
			<td>
				장르/상영등급
				: <%=mdto.getMovie_type()%>/<%=mdto.getMovie_age() %>
			</td>
		</tr>
		
		<tr>
			<td>
				개봉일
				: <%=mdto.getMovie_open() %>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				줄거리
				
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea rows="3" cols="70"><%=mdto.getMovie_content() %></textarea>	
			</td>
			
		</tr>
		
		<tr>
			<td rowspan="2">
				리뷰
			</td>
			<td>
				리뷰1
			</td>
		</tr>
		
		<tr>
			<td>
				리뷰2
			</td>
		</tr>
		</tbody>
		<tfoot>
			<tr>
			<td>[이전]  [다음]</td>
			<td align="right" >
			<a href="/khann/movie/movie_change.jsp?movie_no=<%=mdto.getMovie_no()%>"><input type="submit" value="영화수정"></a>
			<a href="#"><input type="submit" value="리뷰 더보기"></a>
			</td>
			</tr>
		</tfoot>
			
		
	</table>


</div>

<jsp:include page="/template/footer.jsp"></jsp:include>




