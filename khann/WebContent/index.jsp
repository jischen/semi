
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>

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


<jsp:include page="/template/footer.jsp"></jsp:include>