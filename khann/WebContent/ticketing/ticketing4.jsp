<%@page import="beans.dto.TicketingDto"%>
<%@page import="beans.dao.TicketingDao"%>
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
   
   
    //예매 가능 좌석 리스트
   int theater_no = sdto.getTheater_no();

   SeatDao issdao = new SeatDao();
   List<SeatDto> list = issdao.seatList(theater_no);

   //전체 좌석 
   TheaterDao tdao = new TheaterDao();
   TheaterDto tdto = tdao.get(theater_no);


   TicketingDao ttdao = new TicketingDao();
   List<TicketingDto> ttdto = ttdao.choiceSeat(show_no);
   
%>


<jsp:include page="/template/header.jsp"></jsp:include>
<div id="dh-content">

   
   
   
   
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js@0.0.9/cinema/hacademy-cinema.css">
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/js@0.0.9/cinema/hacademy-cinema.js"></script>

<script>
   window.onload = function(){
      var cinema = new Hacademy.Reservation(".cinema-wrap");
      window.dispatchEvent(new Event('resize'));
   };
</script>
      
      
                  
       <form action="ticketing.do" method="get">
       
	
        <div class="cinema-wrap" data-name="seat">
            <div class="cinema-screen">스크린</div>
            <input type="hidden" name="show_no" value="<%=show_no %>">
         <input type="hidden" name="theater_no" value="<%=theater_no %>">
            
            
            <!-- 전체 좌석 -->
            <div class="cinema-seat-area"
                   data-rowsize="<%=tdto.getTheater_row() %>"
                   data-colsize="<%=tdto.getTheater_col() %>" 
                   data-mode="manual">
               
               
 
            
               
                  
                   
                    <% for(SeatDto seatDto : list){ %>
                    <% 
							int index = 0; 
							//좌석 번호 찾기
							boolean flag = false;
							while(index < ttdto.size()){
								TicketingDto ticketingDto = ttdto.get(index);
								System.out.println(ticketingDto.getSeat_no()+", "+seatDto.getSeat_no());
								if(ticketingDto.getSeat_no() == seatDto.getSeat_no()){
									flag = true;
									break;
								}
								index++;
								} 
					 %>
               		 <%if(flag){ %>
               	  	 <!-- 예매 완료 좌석  -->
                         <div class="cinema-seat disabled" 
                                data-row=" <%=seatDto.getSeat_row()%>" 
                           	    data-col="<%=seatDto.getSeat_col()%>">
                         </div>  
              	 	<%} else { %>
               	    <!-- 예매 가능 좌석 -->
                         <div class="cinema-seat" 
                         	   data-row="<%=seatDto.getSeat_row()%>" 
                       	   	   data-col="<%=seatDto.getSeat_col()%>"  >
                         </div>
         			<%} }%>
					
               
               

            <!-- 예매 가능 좌석 -->
            
            
            <!-- 선택한 좌석 -->
                <!-- <div class="cinema-seat active" data-row="1" data-col="1"></div> -->
               
                
               
                

            </div>
        </div>

        <input type="submit" value="선택">
    </form>
   




</div>
<jsp:include page="/template/footer.jsp"></jsp:include>