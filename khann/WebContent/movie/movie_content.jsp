<%@page import="beans.dto.MovieFileDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieFileDao"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.MovieDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

	MovieDao mdao = new MovieDao();
	MovieDto mdto = new MovieDto();
	
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));
	System.out.println(movie_no);
	
	mdto = mdao.get(movie_no);
	
	MovieFileDao mfdao = new MovieFileDao();
	List<MovieFileDto> fileList = mfdao.getList(movie_no);
	
	int movie_file_no = mfdao.getMovieImgNo(movie_no);
	System.out.println("영화 파일 번호 : " + movie_file_no);

	
%>

	
	
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<table border="1" >
		<tbody>
		

		
		<tr>
		
			<td rowspan="4">
				<!-- <img src="http://placehold.it/250x250?text=movie" /> -->
				<!-- 다운로드 버튼을 누른다면 해당 파일을 다운로드 할 수 있도록 링크 -->
				<img src="download.do?movie_file_no=<%=movie_file_no%>" width="250" heigh="250">
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
			<td>첨부파일 
			</td>
			<td>
						<%if(!fileList.isEmpty()){%>
						<%for(MovieFileDto mfdto2 : fileList){ %>
						<%=mfdto2.getMovie_file_name()%>
						(<%=mfdto2.getMovie_file_size()%> bytes)
						<!-- 다운로드 버튼을 누른다면 해당 파일을 다운로드 할 수 있도록 링크 -->
						<%-- <a href="download.do?movie_file_no=<%=mfdto.getMovie_file_no()%>">다운로드</a> --%>
						<%} %>
						<%} %>
				
				
			</td>
		</tr>
		
		<tr>
			<td rowspan="2">
				리뷰1
			</td>
			<td>
				<input type="text" name="review_no">

	
		</tbody>
		<tfoot>
			<tr>
			<td>[이전]  [다음]</td>
			<td align="right" >
			<a href="/khann/movie/movie_change.jsp?movie_no=<%=mdto.getMovie_no()%>"><input type="submit" value="영화수정"></a>
			<a href="/khann/review/review_write.jsp"><input type="submit" value="리뷰작성"></a>

			<a href="/khann/review/review_list.jsp"><input type="submit" value="리뷰 더보기"></a>

			</td>
			</tr>
		</tfoot>
			
		
	</table>


</div>

<jsp:include page="/template/footer.jsp"></jsp:include>




