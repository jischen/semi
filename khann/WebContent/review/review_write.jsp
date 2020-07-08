<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MovieDto cdto=new MovieDto();
    MemberDto mdto= new MemberDto();
    
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">


	<h2>영화 리뷰 작성</h2>

	<form action="review_write.do" method="post">


	<table border="1">
	<!-- 리뷰 시퀀스 -->
		<tr>
		<th>리뷰번호</th>
		<td>
		<input type="hidden" name="review_no">
		</td>
		</tr>

	<tr>
		<th>작성자</th>
		<td><input type="text" name="member_id">
		<%=mdto.getMember_id() %>
		</td>
	</tr>


	<tr>
		<th>리뷰 점수</th>
		<td>
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
<th>내용</th>
<td>
<textarea rows="7" cols="60" placeholder="리뷰를 작성해주세요.(욕설금지)"></textarea>
</td>
</tr>

<tfoot>
<tr>
<td align="center" colspan="2" >
<input type="submit" value="등록">
</td>
</tr>
</tfoot>


</table>

</form>

</div>
<jsp:include page="/template/footer.jsp"></jsp:include>