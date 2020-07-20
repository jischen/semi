<%@page import="beans.dao.TheaterDao"%>
<%@page import="beans.dto.TheaterDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="beans.dto.SeatDto"%>
<%@page import="beans.dao.SeatDao"%>
<%@page import="beans.dto.ShowDto"%>
<%@page import="beans.dao.ShowDao"%>
<%@page import="beans.dto.MovieDto"%>
<%@page import="beans.dao.MovieDao"%>
<%@page import="java.util.List"%>
<%@page import="beans.dto.TicketingDto"%>
<%@page import="beans.dao.TicketingDao"%>
<%@page import="beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	///////////////////////////////////////////////////////////////////////
	//////////////////////////////캘린더/////////////////////////////////////
	Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
	
	
	///////////////////////////////////////////////////////////////////////
	MemberDto user = (MemberDto)request.getSession().getAttribute("userinfo");
	
	int	member_no = user.getMember_no();
	
	
	TicketingDao tdao = new TicketingDao();
	List<TicketingDto> list = tdao.getList(member_no);
	
	int ticket_no = tdao.Sequen();
	
	//영화 정보
	ShowDao show = new ShowDao();
	
	MovieDao mdao = new MovieDao();
		
	TheaterDao ttdao = new TheaterDao();	
	SeatDao seat = new SeatDao();
	
	

%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div>
<head>
 
    <style>
        article{
            height: 650px;
            width: 350px;
            background-color: #e8f0f3;
            margin-top: 150px; 
            margin-left: 350px;
            text-align: center;
            font-family : "굴림";
            font-size: 20px;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .ticket{
            color: black;
        }
        hr{
            border-bottom-style: dotted;       
        }
    </style>
    
</head>
<body>
   <article>
   	<%for(TicketingDto tdto : list){ %>
	<%if(tdto.getTickekting_no() == (ticket_no-1)){ %>
    	<div>
    		<img src="<%=request.getContextPath()%>/img/logo2.png" width="150px" height="150px">
    	</div>
   		<hr>
   		<div id="ticket">
             <% 
	         ShowDto sdto = show.get(tdto.getShow_no());
	         MovieDto mdto = mdao.get(sdto.getMovie_no());
	  	     %>
	  	     <%=mdto.getMovie_name() %>
		</div>
    	<hr>
    	<div id="ticket">
    		<%=user.getMember_id() %>
    	</div>
    	<hr>
    	<div id="ticket">
    		<%
			String movieStartDay = sdto.getShow_start().substring(2,10);
			String movieStartTime = sdto.getShow_start().substring(11,16);
			%>
			<%=movieStartDay + " / " + movieStartTime %>
    	</div>
    	<hr>
    	<%List<SeatDto> seatList = seat.seat(tdto.getSeat_no()); %>
    	<%
    	  int theater_no = sdto.getTheater_no(); 
    	  TheaterDto ttdto = ttdao.get(theater_no); %>
    	<%for(SeatDto seatno : seatList){ %>
   		<div id="ticket">
   			<%=ttdto.getTheater_name()%> / <%=seatno.getSeat_row()+"-"+seatno.getSeat_col()%>
   		</div>
   		<%} %>
    	<hr>
    	<div id="ticket">
    		<%=(year)/100+"년 "+ month + "월 "+ day + "일" + hour+":"+ min%>
    	</div>
    	<hr>
    	<div id="ticket">
    		<%=tdto.getTicketing_price()*tdto.getTicketing_peoplenum()+"원"%>
    	</div>
    	<hr>
    	<div id="ticket">
    		<img src="<%=request.getContextPath()%>/img/barcode.png" width="200px" height="80">
    	</div>
    	<hr>
    	<div>
    		<%if(0 < user.getMember_point() && user.getMember_point()<tdto.getTicketing_price()) {%>
    		<form action="tiecket.do" method="post">
    		<input type="submit" value="예매">
    		</form>
    		<%}else{ %>
    		<a href="<%=request.getContextPath()%>/ticketing/nopoint.jsp">
    		<input type="button" value="예매">
    		</a>
    		<%} %>
    	</div>
   <%}} %>
   </article> 
   
</body>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>