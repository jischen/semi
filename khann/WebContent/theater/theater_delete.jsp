<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:include page="/template/header.jsp"></jsp:include>
						
<div>
	<form action="delete.do" method="post">
	<table>
		<tr>
			<td>
			<input name="theater_name" type="text" value="상영관 이름 입력하세요">
			<input type="submit" value="삭제">
			</td>
		</tr>
	
	</table>
	</form>
	
</div>	

<jsp:include page="/template/footer.jsp"></jsp:include>