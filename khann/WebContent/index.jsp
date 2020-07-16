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






<div id="dh-content">

	<!-- 이미지 슬라이더 영역 -->
	<div class="swiper-container">
		<!-- 필수 영역 -->
		<div class="swiper-wrapper">
			<!-- 배치되는 이미지 또는 화면 -->
			<div class="swiper-slide">
				<img src="<%=request.getContextPath()%>/img/showing.jpg"  style="width: 1200px; height: 600px;">
			</div>
			<div class="swiper-slide">
				<img src="<%=request.getContextPath()%>/img/showing.jpg" style="width: 1200px; height: 600px;">
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



<jsp:include page="/template/footer.jsp"></jsp:include>




