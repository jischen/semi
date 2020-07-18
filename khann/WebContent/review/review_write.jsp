<%@page import="org.apache.catalina.User"%>
<%@page import="beans.dao.ReviewDao"%>
<%@page import="beans.dto.ReviewDto"%>
<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberDto mem = (MemberDto) session.getAttribute("userinfo");

%>


<jsp:include page="/template/header.jsp"></jsp:include>

<head>


<title>리뷰 작성</title>
 <link rel="stylesheet" type="text/css" href="../css/base.css">
<style>
main {

	width: 600px;
}

.review_title {
	position: relative;
	top: 2px;
	font-size: 26px;
	font-weight: 600;
	padding: 1rem;
	letter-spacing: -2px;
}

.review_amount {
	border: 0px solid gray;
	font-size: 16px;
}

.review_button {
	position: relative;
	text-align: center;
	font-size: 15px;
	color: black;
}

.review_submit {
	width: 170px;
	height: 40px;
	font-size: 14px;
	background-color: black;
	color: white;
}

.review_cancle {
	width: 170px;
	height: 40px;
	font-size: 14px;
	background-color: black;
	color: white;
}

.review_score {
	height: 20px;
	line-height: 27px
}
</style>


</head>

<body>


	<div id="dh-content" style="margin-left:320px ">
		<form action="review_write.do" method="post">
			<hr>


			<div class="review_wrap">

				<div class="review_title">
					리뷰작성
				</div>
				<hr>

				<div class="review_amount">
					리뷰 작성자 <br> <input type="text" id="rw" name="review_writer">
				</div>
				
				<div class="review_amount">
					영화 제목 <br> <input type="text" id="rw" name="movie_name">
				</div>

				<div class="review_amount">
					리뷰 내용 <br>
					<textarea name="review_content" id="rw" rows="10" cols="70"
					placeholder="운영원칙에 어긋나는 게시물로 판단되는 글은 제재 조치를 받을 수 있습니다.">
					</textarea>
				</div>

				<div class="review_select">
						리뷰 점수
						<select name="review_score">
						<option value="5점" >5점</option>
						<option value="4점">4점</option>
						<option value="3점">3점</option>
						<option value="2점">2점</option>
						<option value="1점">1점</option>
						</select>
				</div>
				<hr>
				
				<div class="review_button">
					<input type="submit" class="review_submit" value="작성완료">
				</div>

			</div>
		</form>
	</div>



</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>











