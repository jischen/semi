<%@page import="beans.dto.ReviewDto"%>
<%@page import="beans.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <% 
     int review_no=Integer.parseInt(request.getParameter("review_no"));
    
    ReviewDao rdao= new ReviewDao();
    ReviewDto rdto=rdao.get(review_no);
    
    %>

      <jsp:include page="/template/header.jsp"></jsp:include>
    <div align="center">
    
     <form action=review_edit.do method="post">
    
 
   
   	<table border="1">
   	   <h2>리뷰 수정</h2>
   	<thead>

</thead>
			<tr>
		<th>리뷰 번호</th>
		<td>
		<input type="text" name="review_no" value="<%=rdto.getReview_no()%>">
		</td>
			</tr>
			<tr>
				<th>리뷰 작성자</th>
				<td>
				<input type="text" name="review_writer" value="<%=rdto.getReview_writer()%>">
				</td>
			</tr>

			<tr>
				<th>내용</th>
				<td height="100" width="300"><input name="review_content"
						placeholder="수정할 내용을 입력해주세요." 
						value="<%=rdto.getReview_content()%>">
</td>
			</tr>

			<tr>
				<th>리뷰 점수</th>
				<td><select name="review_score" >
						<option value="5점">5점</option>
						<option value="4점">4점</option>
						<option value="3점">3점</option>
						<option value="2점">2점</option>
						<option value="1점">1점</option>
				</select></td>
			</tr>
		
			<tfoot>
				<tr>
					<td align="center" colspan="2">
					<a href="review_content.jsp">
					<input type="button" value="수정완료"></a>
					</td>
				</tr>
			</tfoot>


		</table>

    
    </form>
    
    </div>
    
    <jsp:include page="/template/footer.jsp"></jsp:include>