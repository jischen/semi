<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String rootPath = request.getContextPath();

		MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
		boolean isLogin = mdto != null;

%>

	 <ul class="menu" width="772" height="62">	 
	<li><a href="<%=rootPath%>/movie/movie_chart.jsp">영화</a></li>
	<li><a href="<%=rootPath%>/ticketing/ticketing_selection.jsp">예매</a></li>
	<li><a href="<%=rootPath%>/theater/theater_intro.jsp">극장</a></li>
	<li><a href="<%=rootPath%>/event/list.jsp">이벤트</a></li>
	<li><a href="<%=rootPath%>/cs/list.jsp">고객센터</a></li>
	</ul>

	
	
	
