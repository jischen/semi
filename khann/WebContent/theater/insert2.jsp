<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>

<%
	request.setCharacterEncoding("UTF-8");
	
	String theater_name = request.getParameter("theater_name");
	String theater_type = request.getParameter("theater_type");
	int theater_row = Integer.parseInt(request.getParameter("theater_row"));
	int theater_col = Integer.parseInt(request.getParameter("theater_col"));
	

%>

<link rel="stylesheet" type="text/css" href="../css/hacademy-cinema.css">

<script src = "../css/hacademy-cinema.js"></script>

<script>
   window.onload = function(){
      var cinema = new Hacademy.Reservation(".cinema-wrap");
      window.dispatchEvent(new Event('resize'));
   };
</script>
						
<div>
		<form action="insert.do" method="post">
			<input type="hidden" name="theater_name" value="<%=theater_name%>">
			<input type="hidden" name="theater_type" value="<%=theater_type%>">
			<input type="hidden" name="theater_row" value="<%=theater_row%>">
			<input type="hidden" name="theater_col" value="<%=theater_col%>">
			
			
			
			
			<div class="cinema-wrap" data-name="seat">
   			<div class="cinema-screen">스크린</div>
   			<div class="cinema-seat-area" 
                 data-rowsize="<%=theater_row%>" 
                 data-colsize="<%=theater_col%>" 
                 data-mode="auto">
            </div>
            </div>
            
            <input type="submit" value="등록">
		</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>