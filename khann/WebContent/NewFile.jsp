<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>CINEMA KHANN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/swiper/css/swiper.min.css">


</head>
<body>
	<%
		String rootPath = request.getContextPath();

		//로그인 여부에 따른 메뉴 구성 변경
		//-세션에 "userinfo"라는 데이터가 있으면 로그인, 없으면 로그아웃 상태-의사코드
		MemberDto mdto = (MemberDto) session.getAttribute("userinfo"); // 다운 캐스팅(down-casting)
		boolean isLogin = mdto != null;
	%>
	<!--컨테이너 설정-->
	<div id="dh-container">
		<!--헤더-->
		<div id="dh-header2">
			<!--util(배경색상 설정)-->
			<div id="util">
				<div class="margin-auto">
					<ul>
						<li >
						<a href="https://www.facebook.com/seoulcinema">
						<img src="<%=request.getContextPath()%>/img/sns_fb.png">
						</a>
						</li>
						<li>
						<a href="#">
						<img src="<%=request.getContextPath()%>/img/sns_insta.png">
						</a>
						</li>
						<li>
						<a href="#">
						<img src="<%=request.getContextPath()%>/img/sns_tw.png">
						</a>
						</li>						
						<li>
						<a href="#">
						<img src="<%=request.getContextPath()%>/img/sns_kakao.png">
						</a>
						</li>								
					</ul>								
				</div>
			</div>
			<div id="lojoin"></div>

			<!-- 상단 로고 -->
			<a href="/khann/index.jsp"> <img
				src="<%=rootPath%>/img/logo2.png" width="200" height="200">
			</a>
		</div>
		<!--로그인/회원가입/내정보 오른쪽-->
		<div class="right">

			<%
				if (!isLogin) {
			%>
			<a class="cm" href="<%=rootPath%>/member/login.jsp">로그인</a> <a
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
			<a href="<%=rootPath%>/theater/theater_insert.jsp">상영관등록</a> <a
				href="<%=rootPath%>#">뭐뭐</a>
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





	<div id="dh-content">
		<h2>내용제목</h2>
		<div>
			<div>
				<!-- 이미지 슬라이더 영역 -->
				<div class="swiper-container">
					<!-- 필수 영역 -->
					<div class="swiper-wrapper">
						<!-- 배치되는 이미지 또는 화면 -->
						<div class="swiper-slide">
							<img src="https://placeimg.com/600/300/architecture">
						</div>
						<div class="swiper-slide">
							<img src="https://placeimg.com/600/300/tech">
						</div>
						<div class="swiper-slide">
							<img src="https://placeimg.com/600/300/people">
						</div>
					</div>

					<!-- 페이지 위치 표시 영역(선택) -->
					<div class="swiper-pagination"></div>

					<!-- 이전/다음 버튼(선택) -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>

					<!-- 스크롤바 -->
					<div class="swiper-scrollbar"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="dh-sidebar">
		<h2>로그인페이지</h2>
		<ul>
			<li>ID</li>
			<li>PASSWORD</li>
			<li>어쩌고 저쩌고</li>
		</ul>
	</div>
	<!--하단(footer)영역  -->
	<div class="dh-footer">
		<div class="footer_divL">
			<img
				src="https://postfiles.pstatic.net/MjAyMDA3MDlfMjg0/MDAxNTk0MjY4OTMzMDc1.RuMKcRJaegMqy0BZW4rmUrXbw8aLOTF1-fLL0yTzGeYg.YdsB-f4ui94rj9EE2yT1PkiDAgDRBJ5l9eMuNUJ3TUIg.PNG.ndh13399/logo_transparent.png?type=w966"
				width="90" height="90">
		</div>

		<div class="footer_divC">
			<span>회사소개</span> <span> | </span> <span>광고/프로모션문의</span> <span>
				| </span> <span>제휴문의</span> <span> | </span> <span>출점문의</span>
			<p>
				<span>(주)주식회사 KHANN</span> <span> | </span> <span>대표: 미스터 고</span> <span>
					| </span> <span>사업자등록번호 : 123-45-6789</span> <span> | </span>
			</p>
			<p>오시는 길: 서울특별시 관악구 서원동 문성로 248</p>
			<p></p>
		</div>
		<div class="footer_divR">&copy; KHANN Corp. All right reserved.
		</div>

	</div>
</body>
</html>