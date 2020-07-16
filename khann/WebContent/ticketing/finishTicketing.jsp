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
		
		
	SeatDao seat = new SeatDao();
	
	
	
	
	
	
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div id="dh-content">
	<%for(TicketingDto tdto : list){ %>
	<%if(tdto.getTickekting_no() == (ticket_no-1)){ %>
	<table border="1">
		<tr>
			<td>영화 제목</td>	
			<td>
	            <% 
	            ShowDto sdto = show.get(tdto.getShow_no());
	            MovieDto mdto = mdao.get(sdto.getMovie_no());
	            %>
				<input type="text"  value="<%=mdto.getMovie_name() %>" >
			</td>
		<tr>
	
		<tr>
			<td>티켓 구매자 아이디</td>	
			<td><input type="text"  value="<%=user.getMember_id() %>" ><td>
		<tr>
		
		<tr>
			<%
			
			String movieStartDay = sdto.getShow_start().substring(2,10);
			String movieStartTime = sdto.getShow_start().substring(11,16);
			%>
			<td>상영 날짜 / 시간</td>
			<td><input type="text"  value="<%=movieStartDay + " / " + movieStartTime %>" ><td>
		<tr>
		
		<tr>
			<%List<SeatDto> seatList = seat.seat(tdto.getSeat_no()); %>
			<td>좌석</td>	
			<td>
			<%for(SeatDto seatno : seatList){ %>
			
			<input type="text"  value="<%=seatno.getSeat_row()+"-"+seatno.getSeat_col()%>" >
			<td>
			<%} %>
			
		<tr>
		
		<tr>
			<td>티켓 구매 일자</td>	
			<td>
			<input type="text" value="<%=(year)/100+"년 "+ month + "월 "+ day + "일" + hour+":"+ min%>">
			</td>
		<tr>
		
		<tr>
			<td>금액</td>	
			<td>
			<input type="text" value="<%=tdto.getTicketing_price()*tdto.getTicketing_peoplenum()+"원"%>">
			</td>
		<tr>
	
	</table>
	<%} }%>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>