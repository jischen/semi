<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



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

		<h1>헤더에 있는 스와이프 스크립트가(windows.onload가 먼저 되어서 지도 api가 로딩이 안된다)
		스와이퍼 api를 먼저 해결해야지 가능 할것으로 보인다 header.jsp </h1>

    <div id="map" style="width:500px;height:350px;"></div>


<jsp:include page="/template/footer.jsp"></jsp:include>