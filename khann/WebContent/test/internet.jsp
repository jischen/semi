  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int row = Integer.parseInt(request.getParameter("row"));
	int col = Integer.parseInt(request.getParameter("col"));
%>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>영화관 좌석 배치</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.css">
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/js/cinema/hakademy-cinema.js"></script>
    <script>
        window.addEventListener("load", function(){
            var tag = document.querySelector(".cinema-wrap");
            var cinema = new Hakademy.Reservation(tag);
        });
    </script>
</head>
<body>
    <form action="cinema-seat.html" method="get">
        <div class="cinema-wrap" data-name="seat">
            <div class="cinema-screen">스크린</div>

            <div class="cinema-seat-area" data-rowsize="<%=row%>" data-colsize="<%=col%>">

				<%for(int i=1; i <= row; i++){ %>
					<%for(int j=1; j <= col; j++){ %>
						<div class="cinema-seat" data-row="<%=i%>" data-column="<%=j%>"></div>	
					<%} %>
				<%} %>
                
            </div>

        </div>

        <input type="submit" value="선택">
    </form>
</body>
</html>