<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	
	
	<form action="insert.do" method="post">
	<table border="1">
		<tr>
			<td> 상영관 이름  </td>
			<td><input name="Theater_name" type="text" value="상영관 이르음"></td>
		</tr>
		
		<tr>
			<td> 상영관 타입 </td>
			<td><input name="Theater_type" type="text" value="상영관  타입"></td>
		</tr>
		
		<tr>
			<td> 좌석 줄수  </td>
			<td><input name="Theater_row"  type="text" value="상영관  줄수"></td>
		</tr>
		
		<tr>
			<td> 좌석 칸수  </td>
			<td><input name="Theater_col" type="text" value="상영관 칸수"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="right"><input type="submit" value="확인"></td>
		</tr>
	
	</table>
	</form>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>