
<%@page import="beans.dto.MemberDto"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
int show_no = Integer.parseInt(request.getParameter("show_no"));

MemberDto user = (MemberDto) session.getAttribute("userinfo");
boolean isLogin = user != null;


ShowDao sdao = new ShowDao();
ShowDto sdto = sdao.get(show_no);
	
	
%>



<div align="center">
	<form action="show_content.do" method="post">
		<table border="1">
			<h2>영화 등록이 완료되었습니다.</h2>
			<tbody>

				<tr>
					<th>상영 번호</th>
					<td><%=show_no%></td>
				</tr>
				<tr>
					<th>영화 번호</th>
					<td><%=sdto.getMovie_no() %></td>
				</tr>
				<tr>
					<th>상영관 번호</th>
					<td><%=sdto.getTheater_no()%></td>
				</tr>
				<tr>
					<th>상영 시작시간</th>
					<td><%=sdto.getShow_start()%></td>
				</tr>
				<tr>


				</tr>

			</tbody>
		
			<tfoot>
			<%if (isLogin) {%>
		<tr>
		<td colspan="3" align="center"><a href="/khann/show/show_edit.jsp?show_no=<%=sdto.getShow_no() %>">수정하기</a></td>
		</tr>
		<tr>
		<td colspan="3" align="center"><a href="/khann/show/show_delete.jsp?show_no=<%=sdto.getShow_no() %>">삭제하기</a></td>
		</tr>
		<%} %>
			</tfoot>
		
		</table>
		
		
	</form>



</div>


<jsp:include page="/template/footer.jsp"></jsp:include>