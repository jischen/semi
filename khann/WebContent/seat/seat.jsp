<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	<table>
		<tbody>
		<%for(int j = 5; j>=1; j--) {%>
		<tr>
			<%for(int i = 1; i<=5; i++){ %>
			<td>
				<img src = "http://placeholoder.it/seat/100x100"><%=j+"_"+i %>
			</td>
			<%} %>
		</tr>	
		<%} %>
		</tbody>
		<tfoot>
			<td>
				<h2>스크린</h2>
			</td>
		</tfoot>
		
	</table>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

