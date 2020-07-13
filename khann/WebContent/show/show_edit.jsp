<%@page import="beans.dto.ShowDto"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<%
		int show_no = Integer.parseInt(request.getParameter("show_no"));

		ShowDao sdao = new ShowDao();
		ShowDto sdto = sdao.get(show_no);
	%>



	<form action="show_edit.do" method="post">
		<table border="1">
			<h2>상영 시간 삽입</h2>
			<tbody>
				<tr>
					<th>상영 번호</th>
					<th>영화 번호</th>
					<th>상영관 번호</th>
					<th>상영 시작 시간</th>
				</tr>

				<tr>
				
					<td><input type="text" name="show_no"
						value="<%=show_no%>"></td>
					<td><input type="text" name="movie_no"
						value="<%=sdto.getMovie_no()%>"></td>
					<td><input type="text" name="theater_no"
						value="<%=sdto.getTheater_no()%>"></td>
					<td><input type="text" name="show_start"
						value="<%=sdto.getShow_start()%>"></td>
				</tr>


			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					<a href="/khann/show/show_list.jsp"> 
					<input type="submit" value="수정하기"></a></td>

				</tr>
			</tfoot>

		</table>

	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
