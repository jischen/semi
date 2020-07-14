<%@page import="beans.dto.SeatDto"%>
<%@page import="beans.dao.SeatDao"%>
<%@page import="beans.dto.TheaterDto"%>
<%@page import="java.util.List"%>
<%@page import="beans.dao.TheaterDao"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="beans.dao.ShowDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	int show_no = Integer.parseInt(request.getParameter("show_no"));
	
	ShowDao sdao = new ShowDao();
	ShowDto sdto = sdao.get(show_no);
	

	int theater_no = sdto.getTheater_no();
	
	System.out.println("theater_no = " + theater_no);
	
	SeatDao issdao = new SeatDao();
	List<SeatDto> list = issdao.seatList(theater_no);
	
	
	
%>


<jsp:include page="/template/header.jsp"></jsp:include>
<div id="dh-content">

	
	
	
	
<link rel="stylesheet" type="text/css" href="../css/hacademy-cinema.css">

<script src = "../css/hacademy-cinema.js"></script>

<script>
   window.onload = function(){
      var cinema = new Hacademy.Reservation(".cinema-wrap");
      console.log("finish");
   };
</script>
		
		
						
		 <form action="cinema-seat.html" method="get">
        <div class="cinema-wrap" data-name="seat">
            <div class="cinema-screen">스크린</div>

            <div class="cinema-seat-area" data-rowsize="5" data-colsize="15" data-mode="manual">
				<!-- 예매 가능 좌석 -->
				<%for(SeatDto issdto : list){ %>
                <div class="cinema-seat" 
                		data-row="<%=issdto.getSeat_row() %>" 
                		data-col="<%=issdto.getSeat_col()%>">
                </div>
				<%} %>
				
				<!-- 선택한 좌석 -->
                <!-- <div class="cinema-seat active" data-row="1" data-col="1"></div> -->
               
                
				<!-- 예매 완료 좌석  -->
                <!-- <div class="cinema-seat disabled" data-row="4" data-col="4"></div> -->
               
               
                
            </div>

        </div>

        <input type="submit" value="선택">
    </form>
	




</div>
<jsp:include page="/template/footer.jsp"></jsp:include>