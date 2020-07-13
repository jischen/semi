<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<form action="show_insert.do" method="post">
		<table border="1">
			<h2>상영 시간 삽입</h2>
			<tbody>
				<tr>
				
					<th>영화 번호</th>
					<th>상영관 번호</th>
					<th>상영 시작 시간</th>
				</tr>

				<tr>
					
					<td><input type="text" name="movie_no" ></td>
					<td><input type="text" name="theater_no"></td>
					<td><input type="text" name="show_start"></td>
				</tr>


			</tbody>
			<tfoot>
			<tr>
<td colspan="4" align="center">
<input type="submit" value="등록">
</td>

</tr>
			</tfoot>


		</table>

	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>