<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.ReviewDao"%>
<%@page import="beans.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 리뷰 목록 페이지 -->
<%
	ReviewDao rdao = new ReviewDao();

List<ReviewDto> list = rdao.getList();


MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
boolean isLogin = mdto != null;
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="../base.css">
<style>
  .list_num{
        border:2px solid black;
        background-color: lightgray;
        
    }


</style>

</head>
<body>

	<div id="dh-content" style="margin-left:320px">
		<form action="review_list.do" method="post">
			<div class="review_title">
				<strong>REVIEW LIST | 리뷰 리스트</strong>
			</div>
			<hr>

			<%
				for (ReviewDto rdto : list) {
			%>



			<div class="list_num">
				글번호:[<%=rdto.getReview_no()%>]
				작성일:<%=rdto.getReview_date()%>
			</div>

				<%if (isLogin) {%>
				<%-- <%if (mdto.getGrade().equals("관리자")) {%> --%>
			<div class="review_list" >

			<div>
				작성자
				<%=rdto.getReview_writer()%>
			</div>
			<div>
				관람영화
				<%=rdto.getReview_movie()%>
			</div>
			
			<div>
				리뷰점수
				<%=rdto.getReview_score()%>
			</div>
				
			<div>
				리뷰내용:
				<br>
				<%=rdto.getReview_content()%>
			</div>
		
		
		</div>

			<%} } %>
			<%-- <%} %> --%>
		</form>
	</div>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>