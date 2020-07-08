
<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHANN</title>
</head>
<body>
	<%
		//rootPath에는 프로젝트 root path(/home)가 자동을 계산되어 저장된다.
		//이는 절대경로 작성 시 활용 할 수 있다.
		String rootPath = request.getContextPath();

		//로그인 여부에 따른 메뉴 구성 변경
		//-세션에 "userinfo"라는 데이터가 있으면 로그인, 없으면 로그아웃 상태-의사코드
		MemberDto mdto = (MemberDto) session.getAttribute("userinfo"); // 다운 캐스팅(down-casting)
		boolean isLogin = mdto != null;
	%>

	<div align="center">
		<table border="1" width="1200">
			<tbody>
				<td>
					<div align="right">
						<%
							if (!isLogin) {
						%>
						<a href="<%=rootPath%>/member/login.jsp">로그인</a> 
						<a href="<%=rootPath%>/member/join_term_check.jsp">회원가입</a>
						 
					
						<%} %>
						
						<%
							if (isLogin) {
						%>
						<!-- 로그인 상태일 경우 -->
							<a href="<%=rootPath%>/member/logout.do">로그아웃</a> 
							<a href="<%=rootPath%>/member/info.jsp">내정보</a>
							
							
					
						<!-- 로그인 된 사용자 중에서도 "관리자" 인 경우만 나와야 하는 메뉴 -->
						<%
							if (mdto.getGrade().equals("관리자")) {
						%>
						<a href="#">관리메뉴</a>
						<%
						} else{
						%>

						
						<% } }%>
						
					</div>
				</td>

				<tr height="100">
					<td align="center" width="1000"><a href="/khann/index.jsp"><h1>Khann</h1></a>

					</td>

				</tr>
				<!-- 메뉴(navigation) 영역 -->
				<tr>
					<td><jsp:include page="/template/menu.jsp"></jsp:include></td>
				</tr>
				<!-- 본문(section) 영역 -->
				<tr height="350">
					<td valign="top">