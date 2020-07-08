<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
    <link rel="stylesheet" href="./css/swiper.min.css">
    <style>
        .swiper-container {
            width: 100%;
            min-height: 200px;
            max-height: 300px;
        }
        .swiper-container .swiper-slide,
        .swiper-container .swiper-slide > img{
            width:99%;
            min-height: 200px;
            height:auto;
            max-height: 300px;
        }
        
    </style>
    
    <script src="./js/swiper.min.js"></script>
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
</body>
</html>







