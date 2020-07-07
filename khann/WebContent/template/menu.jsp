<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String rootPath = request.getContextPath();

		MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
		boolean isLogin = mdto != null;

%>
	<a href="<%=rootPath%>/khann/movie/movie_chart.jsp">영화</a>
	<a href="#">예매</a>
	<a href="#">극장</a>
	<a href="#">이벤트</a>
	<a href="#">고객센터</a>
	
	
	
	
