<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- 무비정보 필요 -->
 
   
   <%
   
  
   int movie_no= Integer.parseInt(request.getParameter("movie_no"));
   
   MovieDao mdao=new MovieDao();
   MovieDto mdto=mdao.get(movie_no);
   
   %>
<jsp:include page="/template/header.jsp"></jsp:include> 
<div align="center">



	<form action="movie_change.do" method="post">

 	<table border="1">
 	<thead>
	<h2>영화 정보 수정</h2>
	</thead>
	<tbody>

	<tr>
		<th>영화번호</th>
		<td>
		<input type="text" name="movie_no" value="<%=mdto.getMovie_no() %>" >
		</td> 
	</tr>

	<tr>
		<th>제목</th>
		<td>
		<input type="text" name="movie_name" value="<%=mdto.getMovie_name() %>" >
		</td> 
	</tr>


	<tr>
		<th>감독</th>
		<td>
		<input type="text" name="movie_director" value="<%=mdto.getMovie_director() %>">
		</td>
	</tr>


	<tr>
		<th>배우</th>
		<td>
		<input type="text" name="movie_ac" value="<%=mdto.getMovie_ac() %>">
		</td>
	</tr>


	<tr>
		<th>장르</th>
		<td>
		<input type="text" name="movie_type" value="<%=mdto.getMovie_type()%>" >
		</td>
	</tr>

	<tr>
		<th>상영등급</th>
		<td>
		<input type="text" name="movie_age" value="<%=mdto.getMovie_age() %>" >
		</td>
	</tr>

	<tr>
		<th>상영시간</th>
		<td>
		<input type="text" name="movie_runtime" value="<%=mdto.getMovie_runtime() %>" >
		</td>
	</tr>

	<tr>
		<th>개봉일</th>
		<td> 
		<input type="text" name="movie_open" value="<%=mdto.getMovie_open() %>">
		</td>
	</tr>

	<tr>	
		<th>줄거리</th>
		<td colspan="2">
		<textarea name="movie_content" rows="3" cols="70"><%=mdto.getMovie_content() %></textarea>	
		</td>		
		</tr>
	</tbody>

	<tfoot>
		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="수정하기">
			</td>
		</tr>
	</tfoot>
	</table>

	</form>   
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>