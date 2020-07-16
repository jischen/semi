<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/swiper/css/swiper.min.css">


</head>
<body>
	<%
		//rootPath에는 프로젝트 rootpath(/home)가 자동을 계산되어 저장된다.
		//이는 절대경로 작성 시 활용 할 수 있다.
		String rootPath = request.getContextPath();

		//로그인 여부에 따른 메뉴 구성 변경
		//-세션에 "userinfo"라는 데이터가 있으면 로그인, 없으면 로그아웃 상태-의사코드
		MemberDto mdto = (MemberDto) session.getAttribute("userinfo"); // 다운 캐스팅(down-casting)
		boolean isLogin = mdto != null;
	%>
	<!--컨테이너 설정-->
	<div id="dh-container">
		<!--헤더 설정-->
		<div id="dh-header">
			<!-- 상단 로고 -->
			<div id="top-logo">
				<a href="/khann/index.jsp"> <img
					src="<%=rootPath%>/img/logo2.png" width="200" height="200">
				</a>
			</div>
			<!--헤더메뉴1 로그인/회원가입/내정보-->
			<div class="lojoin" width="779" height="18">

				<%
					if (!isLogin) {
				%>
				<a class="CM" href="<%=rootPath%>/member/login.jsp">로그인</a> <a
					href="<%=rootPath%>/member/join_term_check.jsp">회원가입</a>

				<%
					}
				%>

				<%
					if (isLogin) {
				%>
				<!-- 로그인 상태일 경우 -->
				<a href="<%=rootPath%>/member/logout.do">로그아웃</a> <a
					href="<%=rootPath%>/member/info.jsp">내정보</a>
				<!-- 로그인 된 사용자 중에서도 "관리자" 인 경우만 나와야 하는 메뉴 -->
				<%
					if (mdto.getGrade().equals("관리자")) {
				%>
				<a href="<%=rootPath%>/theater/insert1.jsp">상영관등록</a>
				<a href="<%=rootPath%>/show/show_insert.jsp">영화 등록</a>
				<%
					} else {
				%>


				<%
					}
					}
				%>

			</div>


			<!-- 메인 메뉴(navigation) 영역 -->

			<jsp:include page="/template/menu.jsp"></jsp:include>
			<hr>

			<!-- 본문(section) 영역 -->
		</div>