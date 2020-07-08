<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 리뷰 목록 페이지 -->


<%



	
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>상세리뷰</h2>
	<table border="1">

		<tbody>
			<tr>
				<td>영화이름: <input type="text" name="review_name">
				
				</td>
			</tr>
			<tr>
				<td>작성자:<input type="text" name="member_id">
				<select name="review_score">
<option value="5">5점</option>
<option value="4">4점</option>
<option value="3">3점</option>
<option value="2">2점</option>
<option value="1">1점</option>
</select>
</td>
				</tr>
			<tr>
				<td><textarea name="review_content" width="60" height="60">
내용</textarea></td>
			</tr>
			<tr>
				<td>날짜 <input type="text" name="review_date">
				</td>
			</tr>
			<tr>
				<a href="#">[이전]</a>
			<a href="#">[다음]</a>
			</tr>
		</tbody>

		<tfoot>

		

		</tfoot>

	</table>



</div>

<jsp:include page="/template/footer.jsp"></jsp:include>