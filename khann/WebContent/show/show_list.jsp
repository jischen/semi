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
					<th>영화 제목</th>
					<th>상영관명</th>
					<th>상영 시작 시간</th>
				</tr>

				<tr>
					<td><%=sdto.getShow_no() %></td>
					<td><%=sdto.getMovie_name() %></td>
					<td><%=sdto.getTheater_name() %></td>
					<td><%=sdto.getShow_start() %></td>
				</tr>


			</tbody>
		
<%} %>


		</table>
	<hr>
		<a href="/khann/index.jsp"><input type="button" value="홈으로 돌아가기"></a>
		<a href="/khann/show/show_insert.jsp"><input type="button" value="등록하러가기"></a>
		

	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
    
    
    