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
<!--스와이퍼 스크립트-->
<script src="<%=request.getContextPath()%>/swiper/js/swiper.js"></script>
<script>
	//창의 로딩이 완료되었을 때 실행할 코드를 예약
	window.onload = function() {
		//var mySwiper = new Swiper(선택자, 옵션);
		var mySwiper = new Swiper('.swiper-container', {
			//swiper에 적용할 옵션들을 작성

			direction : 'horizontal' //표시방식(수직:vertical, 수평:horizontal)
			,
			loop : true //순환 모드 여부

			//자동재생 옵션그룹
			,
			autoplay : {
				delay : 2000
			//자동재생 시간(2초)
			}

			//페이지 네비게이터 옵션그룹
			,
			pagination : {
				el : '.swiper-pagination', //적용 대상의 선택자
				type : 'bullets',//네비게이터 모양(bullets/fraction/...)
			},

			//이전/다음 이동버튼 설정그룹
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			}

			//커서 모양을 손모양으로 변경
			,
			grabCursor : false

			//슬라이드 전환 효과(effect)
			//,effect:'coverflow'
			//,effect:'cube'
			//,effect:'fade'
			//,effect:'flip'
			,
			effect : 'slide'//기본값
		});
	};
</script>

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
				<a href="<%=rootPath%>/member/login.jsp">로그인</a> <a
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
				<a href="<%=rootPath%>/theater/theater_insert.jsp">상영관등록</a>
				<a href="<%=rootPath%>#">뭐뭐</a>
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