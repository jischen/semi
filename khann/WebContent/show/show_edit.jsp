<%@page import="beans.dto.TheaterDto"%>
<%@page import="beans.dao.TheaterDao"%>
<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int show_no = Integer.parseInt(request.getParameter("show_no"));
	MemberDto user = (MemberDto) session.getAttribute("userinfo");
	boolean isLogin = user != null;

	ShowDao sdao = new ShowDao();
	ShowDto sdto = sdao.get(show_no);
	

MovieDao mdao = new MovieDao();
MovieDto mdto = mdao.get(sdto.getMovie_no());

TheaterDao tdao = new TheaterDao();
TheaterDto tdto = tdao.get(sdto.getTheater_no());

%>

<jsp:include page="/template/header.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="../css/base.css">
<div align="center">


	<form action="show_edit.do" method="post">
		<table border="1">

			<h2>상영 시간 수정</h2>
			<tbody>
				<tr>
					<th>상영 번호</th>
					<th>영화 제목</th>
					<th>상영관 번호</th>
					<th>상영 시작 시간</th>
				</tr>
<%if (isLogin) {%>

				<tr>

					<td><input type="text" name="show_no" value="<%=show_no%>"></td>
					<td><input type="text" name="movie_name" value="<%=mdto.getMovie_name()%>"></td>
					<td><input type="text" name="theater_name" value="<%=tdto.getTheater_name()%>"></td>
					<td><input type="text" name="show_start"
						value="<%=sdto.getShow_start()%>"></td>
				</tr>

<%}%>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center"><input type="submit"
						value="수정하기"></td>

				</tr>
			</tfoot>

		</table>

	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
