<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	
	
	<form action="theater_insert.do" method="post">
	<table border="1">
	
		<tr>
			<td> 상영관 이름 </td>
			<td>
			<input name="theater_name" type="text">
			</td>
		</tr>
		<tr>
			<td> 상영관 유형 </td>
			<td>
			<input name="theater_type" type="text">
			</td>
		</tr>
		<tr>
			<td> 상영관 줄 </td>
			<td>
			<input name="theater_row" type="text">
			</td>
		</tr>
		<tr>
			<td> 상영관 칸 </td>
			<td>
			<input name="theater_col" type="text">
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input  type="submit" value="전송">
			</td>
		</tr>
	
	</table>
	</form>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>