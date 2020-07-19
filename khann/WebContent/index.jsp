<%@page import="org.apache.commons.fileupload.RequestContext"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<jsp:include page="/template/header.jsp"></jsp:include>


<div style="background-color:#030401">
<div align="center" style= "margin: auto;width:70%; height:450px; background-color: black;">
<iframe width="800" height="450" src="https://www.youtube.com/embed/ZkKobjd9Db0?rel=0;amp;autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
</div>

		
<div style="background-color:#061310">
<h1 class="cb" align="center" style="
    margin-bottom: 10px;
    padding-top: 50px;
    color:#9D3434;
">현 재 상 영 중 인 영 화 </h1>
	<a href="#"> <img
		src="<%=request.getContextPath()%>/image/poster/밤쉘.jpg" width="286"
		height="408" style="margin: 50px;">
	</a>
	
	<a href="#"> <img
		src="<%=request.getContextPath()%>/image/poster/반도.jpg" width="286"
		height="408" style="margin: 50px;">
	</a>
	
	<a href="#"> <img
		src="<%=request.getContextPath()%>/image/poster/비바리움.jpg" width="286"
		height="408" style="margin: 50px;">
	</a>
</div>

<div style="background-color:#030401;padding-bottom:90px;">
		<h1 class="cb" align="center" style="
		padding-top: 50px;
    margin-bottom: 50px; color:#9D3434;
">E V E N T  @=(^ㅇ ^)@</h1> 



<div>

	<!-- 이미지 슬라이더 영역 -->
	<div class="swiper-container">
		<!-- 필수 영역 -->
		<div class="swiper-wrapper">
			<!-- 배치되는 이미지 또는 화면 -->
			<div class="swiper-slide">
				<img src="<%=request.getContextPath()%>/img/showing.jpg"  style="width: 1200px; height: 600px;">
			</div>
			<div class="swiper-slide">
				<img src="<%=request.getContextPath()%>/img/showing2.jpg" style="width: 1200px; height: 600px;">
			</div>
			<div class="swiper-slide">
				<img src="<%=request.getContextPath()%>/img/showing3.jpg" style="width: 1200px; height: 600px;">
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


<jsp:include page="/template/footer.jsp"></jsp:include>




