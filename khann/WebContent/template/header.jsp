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
			<!--로고-->
			<div class="flex-container" style="background-color: #e8f0f3">

				<!-- 헤더메뉴좌측 SNS로고-->
				<div>
					<ul class="flex-container">
						<li><a href="https://www.facebook.com/seoulcinema"> <img
								class="sns" src="<%=request.getContextPath()%>/img/sns_fb.png">
						</a></li>
						<li><a href="#"> <img class="sns"
								src="<%=request.getContextPath()%>/img/sns_insta.png">
						</a></li>
						<li><a href="#"> <img class="sns"
								src="<%=request.getContextPath()%>/img/sns_tw.png">
						</a></li>
						<li><a href="#"> <img class="sns"
								src="<%=request.getContextPath()%>/img/sns_kakao.png">
						</a></li>
					</ul>
				</div>
				<!--헤더메뉴우측 로그인/회원가입/내정보-->
				<div class="flex_item" id="lojoin">
					<%
						if (!isLogin) {
					%>
					<a class="CM" href="<%=rootPath%>/member/login.jsp">로그인</a>
					<span>|</span> 
					<a href="<%=rootPath%>/member/join_term_check.jsp">회원가입</a>

					<%
						}
					%>

					<%
						if (isLogin) {
					%>
					<!-- 로그인 상태일 경우 -->
					<a href="<%=rootPath%>/member/logout.do">로그아웃</a> <span>|</span> <a
						href="<%=rootPath%>/member/info.jsp">내정보</a> <span>|</span> <a
						href="<%=rootPath%>">예매 내역</a> <span>|</span>
					<!-- 로그인 된 사용자 중에서도 "관리자" 인 경우만 나와야 하는 메뉴 -->
					<%
						if (mdto.getGrade().equals("관리자")) {
					%>
					<a href="<%=rootPath%>/theater/insert1.jsp">상영관등록</a> <span>|</span>
					<a href="<%=rootPath%>/show/show_insert.jsp">상영시간등록</a> <span>|</span>
					<a href="<%=rootPath%>/movie/movie_insert.jsp">영화 등록</a> <span>|</span>
					<a href="<%=rootPath%>/movie/movie_delete.jsp">영화 삭제</a>

					<%
						} else {
					%>


					<%
						}
						}
					%>
				
			</div>
		</div>

		<!-- 메인 메뉴(navigation) 영역 -->

		<jsp:include page="/template/menu.jsp"></jsp:include>
		<hr>

		<!-- 본문(section) 영역 -->
	</div>