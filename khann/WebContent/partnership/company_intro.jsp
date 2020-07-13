
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>

<div id="dh-content">

	<img src="<%=request.getContextPath()%>/img/cinemaintro.jpg"
		width="750" height="563">
	<div>
		<font size="5"> KHANN</font>
	</div>
	<hr>

	<div class="flex-container-750">
		<div class="flex-item"><p>KHANN CINEMA는 2020년에 오픈한 신생 극장입니다. 
		저희 극장에서는 항상 고객님들을 위한 이벤트를 준비하고 있습니다. 쾌적한 영화관람 환경을 위해서 항상
		노력하고 있습니다. 저희 KHANN CINEMA는 사회 소외계층  문화 지원 사업 국군장병 무료 관람등
		사회에 기여하기 위한 노력도 아끼지 않고 있습니다. 지역 주민들이 문화공간으로서   오래 오래 함께하고 싶습니다.
		부디 많은 사랑과 관심 부탁드립니다.</p></div>
		

		<div class="flex-item">
			<img style="float: left;  margin-left: 20px; align=middle" src="<%=request.getContextPath()%>/img/film.jpg"
		width="180" height="180"></div>
	</div>
</div>

<div id="dh-sidebar">

	<div>여기는 광고 자리이고</div>
	<div>나는 여기에 사진을 넣겠습니다.</div>

</div>



<jsp:include page="/template/footer.jsp"></jsp:include>