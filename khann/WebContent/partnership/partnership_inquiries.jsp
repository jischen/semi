<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div id="dh-content2">
	<h1>BECOME A BUSINESS PARTNER!</h1>
	<h3>CINEMA KHANN 의 사업 파트너가 되어보세요 귀사의 성공적인 비즈니스 파트너가 되고자합니다.</h3>

	<hr>
	<span><h4>비즈니스 상품소개</h4></span>
	<p></p>


	<div class=flex-container_partnership>
		<div class=flex-item-3>
			<img src="<%=request.getContextPath()%>/img/service_list.png"
				width="150" height="150">
		</div>
		<div class=flex-item_partnership>
			<img src="<%=request.getContextPath()%>/img/service_list2.png"
				width="150" height="150">
		</div>
		<div class=flex-item_partnership>
			<img src="<%=request.getContextPath()%>/img/service_list3.png"
				width="150" height="150">
		</div>
		
		<div class=flex-item_partnership>
			<a href="/khann/partnership/partnership_insert.jsp"><img src="<%=request.getContextPath()%>/img/service_list4.png"
				width="150" height="150"></a>
		</div>
	</div>



	<div class=flex-container_partnership style="">
		<div class=flex-item_partnership>
			<ul class=ul-none>
			<li><h4>통신사제휴</h4></li>				
				<li>요금제 제휴</li>
				<li>멤버십 관람</li>
				<li>요금제 부가 서비스</li>
			</ul>

		</div>


		<div class=flex-item_partnership>
			<ul class=ul-none>
				<li><h4>신용카드(포인트)</h4></li>
				<li>티켓할인</li>
				<li>매점 상품제공</li>
				<li>포인트 결제</li>
			</ul>

		</div>


		<div class=flex-item_partnership>
			<ul class=ul-none>
				<li>
				<h4>쿠폰</h4>
				</li>
				<li>VIP쿠폰</li>
				<li>영화티켓 쿠폰</li>
				<li>매점상품 할인쿠폰</li>
			</ul>
		</div>
		
		<div class=flex-item-3>
			<ul class=ul-none>
				<li><h4>영화 관람권/대관</h4></li>
				<li>B2B관람권</li>
				<li>고객 초청 대관</li>
			</ul>
		</div>

</div>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>