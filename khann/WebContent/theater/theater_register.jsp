<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	
	<h2>상영관 등록</h2>
	
	<form action="theater_register.do" method="post">
		<table border="0">
			<tbody>
				<tr>
					<th>상영관 번호</th>
					<td>
						<input type="number" name="theater_no" required>
					</td>
				</tr>
				<tr>
					<th>상영관 이름</th>
					<td>
						<input type="text" name="theater_name" required>
					</td>
				</tr><tr>
					<th>상영관 종류</th>
					<td>
						<input type="text" name="theater_type" required>
					</td>
				</tr><tr>
					<th>좌석 줄 수</th>
					<td>
						<input type="number" name="theater_row" required>
					</td>
				</tr><tr>
					<th>좌석 칸 수</th>
					<td>
						<input type="number" name="theater_col" required>
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