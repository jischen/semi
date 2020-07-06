<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
						
<div align="center">
	
	<table border="1">
		<tbody>
		
		<%for(int j=0; j<3; j++){ %>
		<tr>
		<%for(int i =1; i<=3; i++) {%>
		<td>
			<a href ="/khann/movie/movie_content.jsp">
				<img src="/khann/image/movie<%=i+"_"+j %>.jpg" width="170" height=200">
			</a>
		</td> 
		<%} %>
		</tr>
		<%} %>
	
	</tbody>


	<tfoot>
		<tr>
			<td align="center"  colspan="3">
				<a href="/khann/movie/movie_insert.jsp">영화 등록</a>
			</td>
		</tr>
	</tfoot>	
	
	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

    