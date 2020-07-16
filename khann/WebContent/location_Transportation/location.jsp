<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<title>영화관소개</title>
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=83a4809f6c2385e492b99c45abae78ad"></script>
    <script>
        window.onload = function() {
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.47835 , 126.930970), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 마커가 표시될 위치입니다 
            var markerPosition = new kakao.maps.LatLng(37.478356, 126.930970);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);

            var iwContent = '<div style="padding:5px;">'
                                        +'CINEMA KHANN'
                                        +'</div>'
                // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                ,iwPosition = new kakao.maps.LatLng(37.478356, 126.930970); //인포윈도우 표시 위치입니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                position: iwPosition,
                content: iwContent
            });

            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(map, marker);
        };
    </script>
    
    
<jsp:include page="/template/header.jsp"></jsp:include>

<h2>찾아오시는 길 </h2>
<hr>		


<div id=dh-container-flex >
    <div class="map-flex-item"id="map" style="width:700px;height:490px;  margin: 20px" ></div>
	<div class="map-flex-item">
	<div class="map-flex-item-column"><div><h2>CINEMAKHANN</h2></div><div>서울특별시 관악구 서원동 문성로 248</div></div> 
	<div class="map-flex-item-column"><div><h2>고객 센터</h2></div> <div>010-5854-2088</div></div>
	<div class="map-flex-item-column"><a href="http://kko.to/Z9KBlgfDj"><img src="<%=request.getContextPath()%>/img/kakaomap.jfif"  style="width: 130px; height: 130px;"></a>
	<a href="http://kko.to/Z9KBlgfDj"><img src="<%=request.getContextPath()%>/img/navermap.jfif"  style="width: 130px; height: 130px;"></a>
	</div>
	</div>
</div>		






<jsp:include page="/template/footer.jsp"></jsp:include>


