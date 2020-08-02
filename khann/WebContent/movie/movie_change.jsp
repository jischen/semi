<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 무비정보 필요 -->


<%
	int movie_no = Integer.parseInt(request.getParameter("movie_no"));

MovieDao mdao = new MovieDao();
MovieDto mdto = mdao.get(movie_no);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="../css/base.css">




</head>
<body>

	<div id="dh-content" style="margin-left: 320px">

		<form action="movie_chart.do" method="post">

			<div class="mvcontent-form">



				<div class="movie_content">
					<label id="movielabel"> 제목</label> <br> <input type="text"
						name="movie_name" required>
				</div>


				<div class="movie_content">
					<label id="movielabel"> 장르</label> <br> <input
						name="movie_type" type="text" required>
				</div>


				<div class="movie_content">
					<label id="movielabel"> 상영등급</label> <br> <input
						name="movie_age" type="text" required>
				</div>

				<div class="movie_content">
					<label id="movielabel"> 상영시간</label> <br> <input
						name="movie_runtime" type="text" required>
				</div>




				<div class="movie_content">
					<label id="movielabel"> 개봉일 </label> <br> <input
						name="movie_open" type="text" required>
				</div>

				<div class="movie_content">
					<label id="movielabel"> 감독</label> <br> <input
						name="movie_director" type="text">
				</div>

				<div class="movie_content">
					<label id="movielabel"> 배우</label> <br> <input name="movie_ac"
						type="text">
				</div>

				<div class="movie_content">
					<label id="movielabel"> 줄거리</label> <br>
					<textarea name="movie_content" rows="7" cols="70"></textarea>
				</div>


				<div class="movie_content">
					<label>첨부파일</label> 첨부파일 <input type="file" name="movie_file"
						multiple accept=".jpg, .png, .gif">

				</div>
				<div class="mvbutton">
					<input type="submit" value="등록">



				</div>
			</div>
		</form>
	</div>


</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>