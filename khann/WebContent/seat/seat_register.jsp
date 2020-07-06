<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	
	<h2>좌석 등록</h2>
	
	<form action="seat_register.do" method="post">
		<table border="0">
			<tbody>
				<tr>
					<th>좌석 일련 번호</th>
					<td>
						<input type="number" name="seat_no" required>
					</td>
				</tr>
				<tr>
					<th>상영관 번호</th>
					<td>
						<input type="number" name="theater_no" required>
					</td>
				</tr>								
				<tr>
					<th>좌석 줄 수</th>
					<td>
						<input type="number" name="seat_row" required>
					</td>
				</tr>
				<tr>
					<th>좌석 칸 수</th>
					<td>
						<input type="number" name="seat_col" required>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록">
					</th>
				</tr>
			</tfoot>
		</table>
	</form>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>