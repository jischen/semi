<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieFileDao"%>
<%@page import="beans.dto.MovieFileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

MovieDao mdao = new MovieDao();
MovieDto mdto = new MovieDto();



//첨부파일 목록을 구해오는 코드
MovieFileDao mfdao = new MovieFileDao();
//getSequence 
//글따로 파일따로 servlet
 
%>
<jsp:include page="/template/header.jsp"></jsp:include>





<div id="dh-content" >							
	<form action="insert.do" method="post" enctype="multipart/form-data">
	 <input type="hidden" name="movie_no" value="<%=request.getParameter("movie_no")%>">

	<div>제목
	<input type="text" name="movie_name" required>
	</div>
	<br>
	
	<div>장르
	<input name="movie_type" type="text" required>
	</div>	
	<br>
		
	<div>상영등급
	<input name="movie_age" type="text" required>
	</div>
	<br>
	
	<div>상영시간
	<input name="movie_runtime" type="text" required>
	</div>
	<br>
	
	<div>개봉일
	<input name="movie_open" type="text" required>
	</div>
	<br>
	
	<div>감독
	<input name="movie_director" type="text">
	</div>
	<br>
	
	<div>배우
	<input name="movie_ac" type="text">
	</div>
	<br>
	
	<!-- 영화사진 넣는부분 -->
	<%-- <div >
	<textarea name="movie_img" >
				<!-- 다운로드 주소를 img 태그로 지정하면 미리보가 가능 -->
				<%MovieFileDto mfdto = new MovieFileDto(); %>
	</textarea>
	</div> --%>
	
	<div>줄거리
		<textarea name="movie_content"  rows="7" cols="70"></textarea>
	</div>	
	
	<div>첨부파일
	<input type="file" name="movie_file" multiple accept=".jpg, .png, .gif"> 
	
				
				
	</div>
	
	<div colspan="2" align="center">
			<input type="submit" value="등록">
	</div>
	

	
	</form>	
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>




    