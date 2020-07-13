<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	MovieDao mdao = new MovieDao();
	List<MovieDto> list = mdao.getList();
	//로그인 정보 확인 
	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
	boolean isLogin = mdto != null;
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<table border="1">
		<tbody>

			<tr>
				<%
					for (MovieDto moivedto : list) {
				%>
				<td><a
					href="movie_content.jsp?movie_no=<%=moivedto.getMovie_no()%>">
						<img src="/khann/image/<%=moivedto.getMovie_no()%>.jpg"
						width="170" height="200">
				</a></td>

				<%
					}
				%>
			</tr>


		</tbody>


		<tfoot>
			<%
				if (isLogin) {
			%>
			<%
				if (mdto.getGrade().equals("관리자")) {
			%>

			<tr>
				<td align="center" colspan="9"><a
					href="/khann/movie/movie_insert.jsp">영화 등록</a> <a
					href="/khann/movie/movie_delete.jsp">영화 삭제</a></td>
			</tr>
			<%
				}
			%>

			<%
				}
			%>


		</tfoot>

	</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
