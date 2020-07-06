<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>영화관 좌석 배치</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.css">
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.js"></script>
    <script>
        window.addEventListener("load", function() {
            var tag = document.querySelector(".cinema-wrap");
            var cinema = new Hakademy.Reservation(tag);
        });

    </script>
</head>

<body>
    <form action="cinema-seat.html" method="get">
        <div class="cinema-wrap" data-name="seat" data-rowsize="5" data-colsize="20">
            <div class="cinema-screen">screen</div>

            <div class="cinema-seat-area" data-rowsize="5" data-colsize="15">

                <div class="cinema-seat " data-row="1" data-column="1"></div>
                <div class="cinema-seat " data-row="1" data-column="2"></div>
                <div class="cinema-seat " data-row="1" data-column="3"></div>
                <div class="cinema-seat " data-row="1" data-column="4"></div>

                <div class="cinema-seat" data-row="1" data-column="6"></div>
                <div class="cinema-seat" data-row="1" data-column="7"></div>
                <div class="cinema-seat" data-row="1" data-column="8"></div>
                <div class="cinema-seat" data-row="1" data-column="9"></div>


                <div class="cinema-seat" data-row="1" data-column="11"></div>
                <div class="cinema-seat" data-row="1" data-column="12"></div>
                <div class="cinema-seat" data-row="1" data-column="13"></div>
                <div class="cinema-seat" data-row="1" data-column="14"></div>

                <div class="cinema-seat" data-row="2" data-column="1"></div>
                <div class="cinema-seat" data-row="2" data-column="2"></div>
                <div class="cinema-seat" data-row="2" data-column="3"></div>
                <div class="cinema-seat" data-row="2" data-column="4"></div>


                <div class="cinema-seat" data-row="2" data-column="6"></div>
                <div class="cinema-seat" data-row="2" data-column="7"></div>
                <div class="cinema-seat" data-row="2" data-column="8"></div>
                <div class="cinema-seat" data-row="2" data-column="9"></div>


                <div class="cinema-seat" data-row="2" data-column="11"></div>
                <div class="cinema-seat" data-row="2" data-column="12"></div>
                <div class="cinema-seat" data-row="2" data-column="13"></div>
                <div class="cinema-seat" data-row="2" data-column="14"></div>


                <div class="cinema-seat" data-row="3" data-column="1"></div>
                <div class="cinema-seat" data-row="3" data-column="2"></div>
                <div class="cinema-seat" data-row="3" data-column="3"></div>
                <div class="cinema-seat" data-row="3" data-column="4"></div>

                <div class="cinema-seat" data-row="3" data-column="6"></div>
                <div class="cinema-seat" data-row="3" data-column="7"></div>
                <div class="cinema-seat" data-row="3" data-column="8"></div>
                <div class="cinema-seat" data-row="3" data-column="9"></div>

                <div class="cinema-seat" data-row="3" data-column="11"></div>
                <div class="cinema-seat" data-row="3" data-column="12"></div>
                <div class="cinema-seat" data-row="3" data-column="13"></div>
                <div class="cinema-seat" data-row="3" data-column="14"></div>


                <div class="cinema-seat" data-row="4" data-column="1"></div>
                <div class="cinema-seat" data-row="4" data-column="2"></div>
                <div class="cinema-seat" data-row="4" data-column="3"></div>
                <div class="cinema-seat" data-row="4" data-column="4"></div>


                <div class="cinema-seat" data-row="4" data-column="6"></div>
                <div class="cinema-seat" data-row="4" data-column="7"></div>
                <div class="cinema-seat" data-row="4" data-column="8"></div>
                <div class="cinema-seat" data-row="4" data-column="9"></div>


                <div class="cinema-seat" data-row="4" data-column="11"></div>
                <div class="cinema-seat" data-row="4" data-column="12"></div>
                <div class="cinema-seat" data-row="4" data-column="13"></div>
                <div class="cinema-seat" data-row="4" data-column="14"></div>



            </div>

        </div>

        <input type="submit" value="선택">
    </form>
</body>

</html>
