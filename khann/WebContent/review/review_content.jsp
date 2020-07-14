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


%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">


	<h2>작성한 영화 리뷰 보기</h2>

	<form action="review_content.do" method="post">

		<table border="1">
			<tr>
				<th>리뷰번호</th>
				<td><%=review_no%></td>

			</tr>

			<tr>

				<th>리뷰 작성자</th>


				<td><%=rdto.getReview_writer()%></td>
			</tr>
			<tr>
				<th>영화번호</th>
				<td><%=rdto.getReview_movie()%></td>
			</tr>

			<tr>
				<th>내용</th>
				<td align="left"><textarea rows="7" cols="60">
				<%=rdto.getReview_content()%>
				</textarea></td>
			</tr>
			<tr>
				<th>리뷰 점수</th>
				<td><%=rdto.getReview_score()%></td>
			</tr>


			<tfoot>
				<tr>
					<td align="right" colspan="3">
						<%if (isLogin) {%>
						 <a href="/khann/review/review_edit.jsp?review_no=<%=review_no%>">
						<input type="button" value="수정">
						</a> 
						<a href="/khann/review/review_delete.jsp?review_no=<%=review_no%>">
						<input type="button" value="삭제">
						</a>

					</td>
					<%}%>
				</tr>
				
				<tr>
					<td align="center" colspan="2">
						<a href="/khann/review/review_write.jsp">
						<input type="button" value="다시 작성하기">
						</a> 
					
						<a href="/khann/index.jsp"> 
						<input type="button" value="홈으로">
						</a>
					</td>
				</tr>
				
			</tfoot>
		</table>

	</form>

</div>




<jsp:include page="/template/footer.jsp"></jsp:include>