
<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>KHANN</title>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/swiper/css/swiper.min.css">
    <style>
/*메인페이지 스와이퍼!  */    
		.swiper-outer{
			width:1200px;
		}
        .swiper-container {
            width:100%;
            min-height: 200px;
            max-height: 300px;
        }
        .swiper-container .swiper-slide,
        .swiper-container .swiper-slide > img{
            width:100%;
            min-height: 200px;
            height:auto;
            max-height: 300px;
        }
        
    </style>
    
    <script src="<%=request.getContextPath()%>/swiper/js/swiper.min.js"></script>
    <script>
        //창의 로딩이 완료되었을 때 실행할 코드를 예약
        window.onload = function(){
            //var mySwiper = new Swiper(선택자, 옵션);
            var mySwiper = new Swiper ('.swiper-container', {
                //swiper에 적용할 옵션들을 작성
                
                direction: 'horizontal'   //표시방식(수직:vertical, 수평:horizontal)
                ,loop: true //순환 모드 여부
                
                //자동재생 옵션그룹
                ,autoplay:{
                    delay:2000  //자동재생 시간(2초)
                }

                //페이지 네비게이터 옵션그룹
                ,pagination: {
                    el: '.swiper-pagination', //적용 대상의 선택자
                    type: 'bullets',//네비게이터 모양(bullets/fraction/...)
                },

                //이전/다음 이동버튼 설정그룹
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                }

                //커서 모양을 손모양으로 변경
                ,grabCursor:false
                
                //슬라이드 전환 효과(effect)
                //,effect:'coverflow'
                //,effect:'cube'
                //,effect:'fade'
                //,effect:'flip'
                ,effect:'slide'//기본값
            });
        };
    </script>
    
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
					<!--스와이퍼 : 현재는 테이블로 구성되어 있어서 부득이하게 swiper-outer를 이용해서 폭을 제한하였음... 나중에 레이아웃 바꾸면 div만 유지시키면 됨!!!!!!!!-->
					<div class="swiper-outer">
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