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



   <div	 align ="center"> 
    <div id="map" style="width:700px;height:490px;  margin: 20px" ></div>
    <div class=container-700 style="width: 700px;">
    <div style="text-align: right"><a class="decox" href ="http://kko.to/Z9KBlgfDj ">지도찾기</a></div>
    </div>
    <h3>서울특별시 관악구 서원동 문성로 248</h3>
    <h3>문의 전화 :02-1234-5975</h3>
   <hr>
     <div style="padding-right: 170;"><img src="<%=request.getContextPath()%>/img/subway.png"  style="width:50px; height: auto;"><span style="margin-bottom: 100px">2호선 신림역에서 도보 5분<span></span> </div>
     
            
          <div><img src="<%=request.getContextPath()%>/img/bus.png"  style="width:50px; height: auto;"><span> 152, 5516, 5519, 5522B, 5523, 5528, 6512, 6513, 6514</span> <div>탑승후 
  서원동 문화교 앞 하차 도보 2분</div></div>
     
     
    </div>



<jsp:include page="/template/footer.jsp"></jsp:include>


