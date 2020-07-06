<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	
	<h2>좌석 수정</h2>
	
	<form action="#" method="post">
		<table border="0">
			<tbody>
				<tr>
					<th>상영관 번호</th>
					<td>
						<input type="number" name="theater_no" required>
					</td>
				</tr>								
				<tr><div>좌석 목록 나오는 자리</div></tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input type="submit" value="수정">
					</th>
				</tr>
			</tfoot>
		</table>
	</form>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>