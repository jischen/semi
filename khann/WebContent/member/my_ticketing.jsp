<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="beans.dao.ShowDao"%>
<%@page import="java.util.List"%>
<%@page import="beans.dto.TicketingDto"%>
<%@page import="beans.dao.TicketingDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberDto user = (MemberDto)request.getSession().getAttribute("userinfo");
	

	TicketingDao tdao = new TicketingDao();
	List<TicketingDto> list = tdao.get(user.getMember_no());
	
	
%>


<jsp:include page="/template/header.jsp"></jsp:include>


<div>

	<table border="1">	
		<tr>
			<td>영화 이름</td>
			<td>상영 날</td>
		</tr>
		
		<%for(TicketingDto tdto : list) {%>
		<tr>
			<% ShowDao sdao = new ShowDao();
				ShowDto sdto = sdao.get(tdto.getShow_no());
				MovieDao mdao = new MovieDao();
				MovieDto mdto = mdao.get(sdto.getMovie_no());%>
			<td><%=mdto.getMovie_name() %></td>
			<td><%=sdto.getShow_start() %></td>
		</tr>
	<%} %>
	
	</table>

</div>


<jsp:include page="/template/footer.jsp"></jsp:include>
    