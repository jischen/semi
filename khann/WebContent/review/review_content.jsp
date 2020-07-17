<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.ReviewDto"%>
<%@page import="beans.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	int review_no = Integer.parseInt(request.getParameter("review_no"));

MemberDto user = (MemberDto) session.getAttribute("userinfo");
boolean isLogin = user != null;

ReviewDao rdao = new ReviewDao();
ReviewDto rdto = rdao.get(review_no);

//리뷰번호에 있는 무비번호를 이용해서
//영화이름을 가져오고 싶다.....

MovieDao mdao=new MovieDao();
MovieDto mdto=mdao.get(Integer.parseInt(rdto.getReview_movie()));

%>

<jsp:include page="/template/header.jsp"></jsp:include>

<head>

<link rel="stylesheet" type="text/css" href="../base.css">
<style>
.review_content_wrap {
	border: 1px solid black;
}

.review_content_2 {
	
}

#review_con {
	border: 1px solid black;
}
</style>

</head>

<body>


	<div id="dh-content" style="margin-left: 320px">
		<form action="review_content.do" method="post">

			<div class="review_title">
				<strong>REVIEW CONTENT | 리뷰 컨텐츠</strong>
			</div>

			<div class="review_content-wrap">
				<hr>
				<div class="rcontent_no" id="review_con">
					리뷰번호:

					<div class="review_content_2">
						<input type="text" value="<%=review_no%>">

					</div>
				</div>

				<div class="rcontent_writer" id="review_con">
					리뷰 작성자:
					<div class="review_content_2">
						<input type="text" value="<%=rdto.getReview_writer()%>">
					</div>
				</div>

				<div class="rcontent_movie" id="review_con">
					영화제목:
					<div class="review_content_2">
						<input type="text" value="<%=mdto.getMovie_name()%>">
					</div>
				</div>
				<div class="rcontent_movie" id="review_con">
					리뷰내용:
					<div class="review_content_2">
						<textarea rows="7" cols="60">
				<%=rdto.getReview_content()%>
				</textarea>
					</div>
				</div>

				<div class="rcontent_movie" id="review_con">
					리뷰점수:
					<div class="review_content_2">
					<input type="text" value="<%=rdto.getReview_score()%>"></div>
				</div>


			</div>
			<!--수정중 -->
			<hr>
			<%
				if (isLogin) {
			%>
			<div class="review_button">
				<a href="/khann/review/review_edit.jsp?review_no=<%=review_no%>">
					<input type="button" value="수정하기">
				</a> <a href="/khann/review/review_delete.jsp?review_no=<%=review_no%>">
					<input type="button" value="삭제하기">
				</a>
			</div>
			<hr>

			<div class="review_button">
				<a href="/khann/review/review_write.jsp"> <input type="button"
					value="다시 작성하기">
				</a> <a href="/khann/index.jsp"> <input type="button" value="홈으로">
				</a>
			</div>
			<%
				}
			%>
		</form>
	</div>
</body>

</html>


<jsp:include page="/template/footer.jsp"></jsp:include>
