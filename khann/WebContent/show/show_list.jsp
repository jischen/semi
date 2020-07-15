<%@page import="beans.dto.ShowDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 상영 목록 -->


<% 

	ShowDao sdao=new ShowDao();
	List<ShowDto>list=sdao.getList();

	ShowDto edto=new ShowDto();


%>
<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">

	<form action="show_list.do" method="post">
		<table border="1">
		
			<h2>상영 리스트</h2>
			<tbody>

			<%for(ShowDto sdto:list) {%>
				<tr>
					<th>상영 번호</th>
					<th>영화 번호</th>
					<th>상영관 번호</th>
					<th>상영 시작 시간</th>
				</tr>

				<tr>
					<td><%=sdto.getShow_no() %></td>
					<td><%=sdto.getMovie_no() %></td>
					<td><%=sdto.getTheater_no() %></td>
					<td><%=sdto.getShow_start() %></td>
				</tr>


			</tbody>
		
<%} %>
		</table>

	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
    
    
    