<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	<form action="insert.do" method="post">
	<table border="1">
	
	<tr>
		<td>제목</td>
		<td>
		<input name="movie_name" type="text">
		</td>
	</tr>
	
	<tr>
		<td>장르</td>
		<td>
		<input name="movie_type" type="text">
		</td>
	</tr>
	
	<tr>
		<td>상영등급</td>
		<td>
		<input name="movie_age" type="text">
		</td>
	</tr>
	
	<tr>
		<td>상영시간</td>
		<td>
		<input name="movie_runtime" type="text">
		</td>
	</tr>
	
	<tr>
		<td>개봉일</td>
		<td>
		<input name="movie_open" type="text">
		</td>	
	</tr>
	
	<tr>
		<td>감독</td>
		<td>
		<input name="movie_director" type="text">
		</td>
	</tr>
	
	<tr>
		<td>배우</td>
		<td>
		<input name="movie_ac" type="text">
		</td>
	</tr>
	
	<tr>
	<td>줄거리</td>
		<td>
			<textarea name="movie_content"  rows="7" cols="70"></textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="등록">
		</td>
	</tr>
	
	
		
	
		
		
		
		
		
	</table>
	</form>	
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>




    