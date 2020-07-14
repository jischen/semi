<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>게시글 작성</h2>
	<form action="write.do" method="post">
	<input type="hidden" name="ask_no" value="<%=request.getParameter("ask_no")%>">
	<input type="hidden" name="ask_head" value="미답변">
	<table border="1">
		<tbody>
				<!-- <tr>
					<th>말머리</th>
					<td>
						<select name="ask_head">
							<option value="">말머리 선택</option>
							<option value="미답변">미답변</option>
							<option value="답변완료">답변완료</option>
						</select>
					</td>
				</tr> -->
				<tr>
					<th>제목</th>
					<td><input type="text" name="ask_title" size="75" required></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea name="ask_content" required rows="15" cols="77"></textarea>
				</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="작성">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>