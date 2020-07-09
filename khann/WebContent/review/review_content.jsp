<%@page import="beans.dao.ReviewDao"%>
<%@page import="beans.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 리뷰 목록 페이지 -->
<%

	ReviewDao rdao = new ReviewDao();

	List<ReviewDto> list = rdao.getList();
	

%>



<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>리뷰보기</h2>
	<form action="review.content.do" method="post">
		<table border="1">
		
			<tbody>
			
			<%for(ReviewDto rdto : list) { %>
<thead>
<tr>
<td align="left" colspan="6">
글번호:[<%=rdto.getReview_no() %>]
</td>
</tr>
</thead>
				<tr>
					<th>작성자</th>
					<td width="300"><%=rdto.getReview_writer() %></td>
					<th colspan="3">리뷰점수:</th>
					<td><%=rdto.getReview_score()%>
					</td>
				<tr>
					<th height="100">내용:</th>
					<td width="300" valign="top">
					<%=rdto.getReview_content() %></td>

					<th colspan="3">날짜:</th>
					<td><%=rdto.getReview_date() %></td>
				</tr>
				
		
		
		
			<tr>
				<td align="right" colspan="6">
				<a href="/khann/review/review_edit.jsp?review_no=<%=rdto.getReview_no()%>">[수정]
				
				</a>
				 <a href="#">[삭제]</a>
				 </td>
			</tr>
	</tbody>
	<%}%>
	
	
		</table>
		<td align="right" colspan="6"><a href="#">[이전]</a> <a href="#">[다음]</a></td>
	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
